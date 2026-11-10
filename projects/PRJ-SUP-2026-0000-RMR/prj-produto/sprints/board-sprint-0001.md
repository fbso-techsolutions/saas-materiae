# 🗂️ Board — Sprint 1 (Fundação) · 19/10 – 30/10/2026

> **O que é:** a **camada fina** de status da Sprint 1 — 14 itens (10 enablers + 4 architectural runways). A camada grossa está no [BACKLOG-LIST](../../../../docs/produto/backlog/BACKLOG-LIST.md); as regras do fluxo, em [sprints/README §Board da sprint](README.md#board-da-sprint).
> **Fechamento (2026-10-30):** posição confirmada na review de encerramento — 8 enablers comprometidos 🔵 + 3 runways `Concluído`; ENABLER-0006/ENABLER-0010 (🟡) e a runway de workflow continuam na Sprint 2 ([PENDENCY-0033](../../pendencias.md) ✅).

| Campo | Valor |
|---|---|
| **Sprint** | 19–30/10/2026 — 10 dias úteis |
| **Escopo** | 10 enablers (8 comprometidos + 2 iniciados) + 4 runways · zero stories |
| **WIP `Em Dev`** | **2 / 10** (ENABLER-0006 + ENABLER-0010, em continuidade na S2) |
| **Runways** | fluxo próprio (não consomem WIP de dev) |
| **Atualizado** | 2026-10-30 |

## Itens

| Item | Estado | Dono | Próxima ação | Evidência |
|---|---|---|---|---|
| [ENABLER-0001](../../prj-tecnico/enablers/ENABLER-0001-servidor-interno-docker-compose.md) — Servidor + Compose + backup | `Concluído` | Lourival Louro | — | review 30/10 |
| [ENABLER-0002](../../prj-tecnico/enablers/ENABLER-0002-pipeline-ci-cd.md) — Pipeline CI/CD trunk-based | `Concluído` | Lourival Louro | — | review 30/10 |
| [ENABLER-0003](../../prj-tecnico/enablers/ENABLER-0003-keycloak-perfis.md) — Keycloak + perfis | `Concluído` | Bruno Oliveira (+ Daniel Vini) | — | review 30/10 |
| [ENABLER-0004](../../prj-tecnico/enablers/ENABLER-0004-policies-rls-tenant.md) — Policies de RLS + seed de tenant | `Concluído` | Carlos Mattos | — | review 30/10 |
| [ENABLER-0005](../../prj-tecnico/enablers/ENABLER-0005-flyway-entidades-seeds.md) — Esqueleto Flyway: 7 entidades + seeds | `Concluído` | Carlos Mattos | — | review 30/10 |
| [ENABLER-0006](../../prj-tecnico/enablers/ENABLER-0006-workflow-tabela-configuracao.md) — Workflow em tabela de configuração | `Em Dev` | Bolismar da Silva + Bruno Oliveira | Conclusão 04/11 (S2) | — |
| [ENABLER-0007](../../prj-tecnico/enablers/ENABLER-0007-auditoria-append-only.md) — Auditoria append-only | `Concluído` | Bruno Oliveira | — | review 30/10 |
| [ENABLER-0008](../../prj-tecnico/enablers/ENABLER-0008-terminais-leitores.md) — Terminais: leitores + operação sem mouse | `Concluído` | Manoel Carlos | — | review 30/10 |
| [ENABLER-0009](../../prj-tecnico/enablers/ENABLER-0009-decisao-stack-front.md) — Stack front: SPA (Vite + TanStack) | `Concluído` | Manoel Carlos | — | review 30/10 |
| [ENABLER-0010](../../prj-tecnico/enablers/ENABLER-0010-dados-iniciais-homologacao.md) — Dados iniciais de homologação | `Em Dev` | Patricia Varra | Conclusão 05/11 (S2) | — |
| [ARCH-RUNWAY-0001](../../prj-tecnico/runways/ARCH-RUNWAY-0001-keycloak-identidade-sso.md) — Keycloak no Compose | `Concluído` | Bruno Oliveira (ENABLER-0003) | — | DoD ENABLER-0003 |
| [ARCH-RUNWAY-0002](../../prj-tecnico/runways/ARCH-RUNWAY-0002-policies-rls-multi-tenant.md) — Policies de RLS | `Concluído` | Carlos Mattos (ENABLER-0004) | — | DoD ENABLER-0004 |
| [ARCH-RUNWAY-0003](../../prj-tecnico/runways/ARCH-RUNWAY-0003-workflow-tabela-configuracao.md) — Tabela de configuração de workflow | `Em execução` | Bolismar da Silva + Bruno Oliveira (ENABLER-0006) | DoD do ENABLER-0006 (04/11 S2) | — |
| [ARCH-RUNWAY-0004](../../prj-tecnico/runways/ARCH-RUNWAY-0004-auditoria-append-only.md) — Trilha de auditoria append-only | `Concluído` | Bruno Oliveira (ENABLER-0007) | — | DoD ENABLER-0007 |

**Resumo:** `Concluído` 11 (8 enablers 🔵 + 3 runways) · `Em Dev` 2 (ENABLER-0006/0010) · `Em execução` (runway) 1 (workflow) · `Em Review` 0 · `Em Testes` 0.

## Fechamento (review de 30/10)

- [x] Confirmar a posição dos 14 itens e **anexar a evidência** (link do PR, teste, script do zero) — [PENDENCY-0033](../../pendencias.md) ✅.
- [x] Mover para `Concluído` só com **DoD do card + smoke test**; atualizar a camada grossa no [BACKLOG-LIST](../../../../docs/produto/backlog/BACKLOG-LIST.md) para `✅ Entregue`.
- [x] Registrar a **baseline de fluxo** da S1: itens concluídos / 14 = **11/14** · lead time médio · rework · WIP máximo.
- [ ] Abrir o board da Sprint 2 (`board-sprint-0002.md`) no planning de 02/11, já com WIP e fluxo por tipo.
