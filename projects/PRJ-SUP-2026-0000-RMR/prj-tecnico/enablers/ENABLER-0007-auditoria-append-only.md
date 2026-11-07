# 🛠️ ENABLER-0007 — Auditoria append-only (app + banco)

| Campo | Valor |
|---|---|
| **Categoria** | Arquitetura / Conformidade |
| **Origem** | **C3** (checklist de arquitetura) — requisito transversal das 4 features da Onda 1-Must (MVP mínimo); decisão 3 ("auditoria basic no Postgres, já que o app não pode apagar") + [PENDENCY-0009](../../pendencias.md) (regras B/R/BR) |
| **Habilita** | Auditoria das **13 stories** (BR-2.1.2), evidências da Onda 3-Could (Integração & Valor) da FEATURE-0005.0005 (B-REQ-05), trilha para auditoria interna/regulatória |
| **Depende de** | [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md) · [ENABLER-0005](ENABLER-0005-flyway-entidades-seeds.md) (schema) · [ENABLER-0004](ENABLER-0004-policies-rls-tenant.md) (tenant_id na trilha) |
| **Dono sugerido** | Bruno Oliveira (backend) + Carlos Mattos (dados) |
| **Estimativa (Job Size)** | **3** *(proposta — consolidar no planning)* |
| **Status** | 📝 Rascunho (2026-10-19) · **DoR:** [checklist](dor-enablers.md) · **WSJF:** [avaliação](wsjf-enablers-iniciais.md) (6º lugar proposto) |

---

## 1. Visão Geral e Contexto

- **Categoria:** Arquitetura / Conformidade
- **Origem:** C3 (Checklist de Arquitetura) — requisito transversal da Onda 1-Must (MVP mínimo): registrar **quem, quando, o quê, lendo qual identificador**; decisão 3 do checklist: "*app tem só INSERT; permissão de banco sem UPDATE/DELETE*" (append-only duplo).
- **Status de Bloqueio:** **Habilita a compliance desde a 1ª story.** Sem a trilha montada no dia 1, cada evento passaria a ser reescrito depois (reconstruir histórico = perdido) — e a FEATURE-0005.0005 (B-REQ-05) exige a prova hoje, não na Onda 3-Could (Integração & Valor).

## 2. Análise de Priorização (Métricas para WSJF)

- **Valor de Negócio / Redução de Risco:** **Conformidade + prova jurídica.** A trilha de auditoria é a evidência de que o ativo foi recebido, testado, reparado e destinado — a defesa da empresa em caso de litígio ou fiscalização. Sem ela, o produto funciona mas **não prova nada**.
- **Habilitação de Oportunidade:** read models de compliance, dashboards de exceção e a auditoria WORM/hash encadeado (pós-Onda 1-Must (MVP mínimo)) só têm onde crescer se a trilha existir e for append-only.

## 3. Escopo Técnico Detalhado

1. **Tabela EVENTO_AUDITORIA** (append-only): ator (id + perfil), data/hora, ação, entidade, identificador lido, dados relevantes, `tenant_id` — escrita por API única.
2. **Bloqueio por aplicação:** endpoints têm **só INSERT** — nenhum update/delete no recurso de auditoria.
3. **Bloqueio por banco:** revogar `UPDATE`/`DELETE` da tabela ao usuário da aplicação (o app não pode apagar nem por bug — decisão 3/C3).
4. **Leitura por item:** API de consulta da trilha de um item específico (identificador → eventos) para as telas de evidência (BR-2.1.2 e FEATURE-0005.0005).
5. **Higiene da trilha:** `tenant_id` em todo evento (RLS da [ENABLER-0004](ENABLER-0004-policies-rls-tenant.md) também protege a auditoria) + convenção de escrita de novos tipos de evento documentada.

> **Não está incluso:** hash/encadeamento anti-tamperio, retenção legal por prazo, export WORM (pós-Onda 1-Must (MVP mínimo) — roadmap compliance, ver [decisão D-06](../../prj-produto/backlog/DECISOES-BACKLOG.md)) · dashboard de auditoria (Onda 3-Could (Integração & Valor)).

## 4. Critérios de Saída (Definition of Done)

- `INSERT` de evento pela aplicação **funciona**; `UPDATE`/`DELETE` na tabela **falham por permissão de banco** (teste automatizado — prova do duplo bloqueio).
- Todo fluxo da Onda 1-Must (MVP mínimo) coberto em prova: transição de workflow e tentativa bloqueada geram evento automaticamente.
- Leitura da trilha por item retorna a sequência completa de eventos (log de teste evidenciando "quem, quando, o quê, qual identificador").
- Documentado (no repo) o padrão para acrescentar novos tipos de evento sem código esquecido.
