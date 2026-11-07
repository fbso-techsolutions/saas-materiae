# 🛠️ ENABLER-0004 — Policies de RLS + seed de tenant

| Campo | Valor |
|---|---|
| **Categoria** | Arquitetura |
| **Origem** | **B2** (checklist de arquitetura) — ADR-002 confirmado e **estendido para a Onda 1-Must (MVP mínimo)** (RLS desde o 1º dia) · decisão D4 (tenant_id) |
| **Habilita** | Toda tabela de domínio das **13 stories** da Onda 1-Must (MVP mínimo) (tenant_id nasce junto); multi-tenant deixa de ser refatoração e vira config (base futura SaaS Onda 4 (Produto)/Onda 5 (Plataforma)) |
| **Depende de** | [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md) (PostgreSQL no Compose) · coordena-se com [ENABLER-0005](ENABLER-0005-flyway-entidades-seeds.md) (policies aplicadas às migrations) |
| **Dono sugerido** | Carlos Mattos (dados) + Bolismar da Silva (arquiteto) |
| **Estimativa (Job Size)** | **3** *(proposta — consolidar no planning)* |
| **Status** | 📝 Rascunho (2026-10-19) · **DoR:** [checklist](dor-enablers.md) · **WSJF:** [avaliação](wsjf-enablers-iniciais.md) (3º lugar proposto) |

---

## 1. Visão Geral e Contexto

- **Categoria:** Arquitetura
- **Origem:** B2 (Checklist de Arquitetura) — ADR-002 (Camino C: RLS desde o dia 1), decisão D4 (`tenant_id` em toda tabela de domínio) e decisão 2 do checklist: "*policies + seed 1 tenant; app usa `SET LOCAL app.current_tenant`*".
- **Status de Bloqueio:** **Bloqueador crítico.** Toda tabela de domínio das 13 stories nasce com `tenant_id` e policy; **adiar significa migração caríssima depois** (reescrever todas as tabelas + backfill + rever toda query). A decisão "custo quase zero no dia 1" só vale se acontecer no dia 1.

## 2. Análise de Priorização (Métricas para WSJF)

- **Valor de Negócio / Redução de Risco:** **Risco máximo mitigado.** É o guardrail de isolamento multi-tenant — nenhum usuário lê dado de outro tenant por padrão. Sem ele, o vazamento deixa de ser "impossível por construção" e passa a depender de lembrança de cada query (erro humano garantido em algum ponto da Onda 1-Must (MVP mínimo)).
- **Habilitação de Oportunidade:** Habilita a evolução para SaaS multi-tenant (Onda 4 (Produto)/Onda 5 (Plataforma)) **sem refatoração** — vira adicionar tenant no seed.

## 3. Escopo Técnico Detalhado

1. **Migration com `tenant_id`:** todas as tabelas de domínio nascem com `tenant_id NOT NULL` + FK (criação coordenada com o esqueleto [ENABLER-0005](ENABLER-0005-flyway-entidades-seeds.md)).
2. **Policies RLS:** `ALTER TABLE … ENABLE ROW LEVEL SECURITY` com regra `USING`/`WITH CHECK` sobre a coluna de tenant em todas as tabelas de domínio.
3. **Mecanismo por request:** no backend, `SET LOCAL app.current_tenant = '<uuid>'` na transação de cada request (adaptador único no acesso a dados).
4. **Seed de tenant:** criar o tenant inicial de homologação (scripts idempotentes).
5. **Teste automatizado de isolamento:** conexão logada consegue ler linha de outro tenant? Deve falhar.
6. **Padrão documentado:** regra de escrita de migrations novas (toda tabela de domínio = `tenant_id` + policy) — checklist obrigatório nas PRs.

> **Não está incluso:** UI/administração de tenants (SaaS Onda 4 (Produto)/Onda 5 (Plataforma)) · migração de dados legados (não há produção antiga) · auditoria de trilha de acessos (→ [ENABLER-0007](ENABLER-0007-auditoria-append-only.md)).

## 4. Critérios de Saída (Definition of Done)

- `SELECT` em conexão **sem** `SET LOCAL` retorna **vazio** (ou erro, conforme a policy) — não vaza linha de outro tenant.
- `INSERT`/`UPDATE` com tenant diferente do contexto **falha** por `WITH CHECK`.
- Seed cria o tenant de homologação e o serviço consegue operar só nele.
- Padrão documentado e aplicado nas migrations do [ENABLER-0005](ENABLER-0005-flyway-entidades-seeds.md) (verificável numa leitura de migration).
