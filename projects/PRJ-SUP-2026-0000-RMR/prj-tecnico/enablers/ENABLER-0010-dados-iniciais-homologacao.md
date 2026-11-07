# 🛠️ ENABLER-0010 — Dados iniciais de homologação (seeds de negócio)

| Campo | Valor |
|---|---|
| **Categoria** | Infraestrutura / Dados |
| **Origem** | [decisão D-02](../../prj-produto/backlog/DECISOES-BACKLOG.md) (catálogo mínimo embutido — BR-1.1.3) + §3 (1 modelo serializado com identificador e flag de mídia) |
| **Habilita** | Demonstração/homologação realista das stories 0001–0009 (ponta a ponta com dados plausíveis, não tabela vazia) |
| **Depende de** | [ENABLER-0005](ENABLER-0005-flyway-entidades-seeds.md) (schema + catálogos) · [ENABLER-0003](ENABLER-0003-keycloak-perfis.md) (usuários de homolog) · [ENABLER-0004](ENABLER-0004-policies-rls-tenant.md) (tenant) |
| **Dono sugerido** | Patricia Varra (QA) + Carlos Mattos (dados) |
| **Estimativa (Job Size)** | **2** *(proposta — consolidar no planning)* |
| **Status** | 📝 Rascunho (2026-10-19) · **DoR:** [checklist](dor-enablers.md) · **WSJF:** [avaliação](wsjf-enablers-iniciais.md) (10º lugar proposto) |

---

## 1. Visão Geral e Contexto

- **Categoria:** Infraestrutura / Dados
- **Origem:** [decisão D-02](../../prj-produto/backlog/DECISOES-BACKLOG.md) — catálogo de defeitos "reclamados/constatados" e serviços cosméticos **embutidos no binário** para a Onda 1-Must (MVP mínimo) ficar demonstrável sem depender de cadastro manual; [escopo da Onda 1-Must (MVP mínimo)](../../prj-produto/escopo-onda-1.md) — 1 modelo serializado c/ identificador + flag de mídia (trava BR-5.5.1).
- **Status de Bloqueio:** **Não bloqueia código, bloqueia demonstração e homologação.** Sem dados, o QA testa com tabelas vazias e a Operação não reconhece o fluxo — demonstração do fim da Onda 1-Must (MVP mínimo) perde força.

## 2. Análise de Priorização (Métricas para WSJF)

- **Valor de Negócio / Redução de Risco:** **Médio.** Homologação sem dados plausível = teste manual demorado e demonstração frágil ("funciona, mas não dá para ver rodando"). Com seeds idempotentes, qualquer ambiente sobe pronto.
- **Habilitação de Oportunidade:** Scripts de seed reutilizados em demos, treinamento da Operação e ambientes futuros.

## 3. Escopo Técnico Detalhado

1. **Catálogo mínimo embutido:** defeitos reclamados + constatados (BR-1.1.3) e serviços cosméticos — seed versionado, idempotente.
2. **1 modelo serializado** com identificador físico e **flag de mídia coerente com a trava FEATURE-0005.0005** (BR-5.5.1) — dado de ponta para exercitar o lookup.
3. **Usuários de homolog** (1 por perfil: Operação + Compliance) no realm do [ENABLER-0003](ENABLER-0003-keycloak-perfis.md).
4. **Rotina de carga:** script único (`seed` pós-`flyway migrate`) documentado no README do ambiente — rodou, ambiente útil.

> **Não está incluso:** seeds de schema/catálogos de domínio (→ [ENABLER-0005](ENABLER-0005-flyway-entidades-seeds.md)) · seed de tenant (→ [ENABLER-0004](ENABLER-0004-policies-rls-tenant.md)) · massa de teste de carga (QA) · dados de produção (não existe).

## 4. Critérios de Saída (Definition of Done)

- Script de seed roda **do zero após `flyway migrate`** em homologação, de forma **idempotente** (2× = mesmo estado).
- Com os seeds, é possível **registrar 1 item de ponta a ponta** em homologação usando dados de seed (recepção → destino).
- Usuários de homologação **logam** no realm do [ENABLER-0003](ENABLER-0003-keycloak-perfis.md) (1 Operação + 1 Compliance).
- Flag de mídia do modelo de seed **coerente** com a trava BR-5.5.1 (conferência junto ao time de Compliance).
