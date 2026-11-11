# 🧱 Architectural Runways

> **O que é:** as iniciativas de base arquitetural da Onda 1-Must (MVP mínimo) que sustentam as features de negócio. Cada uma tem documento próprio (`ARCH-RUNWAY-{NNNN}`) porque é **item rastreável do backlog** — a entrega, porém, é do Enabler correspondente: runway **não é trabalho separado**.
> **Regra:** o documento registra a capacidade, a origem da decisão e quem entrega; o detalhe técnico e o critério de saída moram no Enabler. **Aponta, não copia.**
> **Origem:** gate de arquitetura 9/9 (2026-10-19) — [checklist](../checklist-arquitetura-onda-1.md) · [ADR-012](../../../../docs/tecnico/arquitetura/adrs/adr-012-stack-onda-1.md). Lista operacional: [backlog](../../../../docs/produto/backlog/BACKLOG-LIST.md).

| ID | Architectural Runway | Domínio | Entregue por | Status |
|---|---|---|---|---|
| [ARCH-RUNWAY-0001](ARCH-RUNWAY-0001-keycloak-identidade-sso.md) | Keycloak no Compose (identidade/SSO da Onda 1-Must (MVP mínimo)) | 🛡️ `#arch-security` | [ENABLER-0003](../enablers/ENABLER-0003-keycloak-perfis.md) | 🔵 Sprint 1 — 23/10 |
| [ARCH-RUNWAY-0002](ARCH-RUNWAY-0002-policies-rls-multi-tenant.md) | Policies de RLS (multi-tenant desde a Onda 1-Must (MVP mínimo)) | 🛡️ `#arch-security` | [ENABLER-0004](../enablers/ENABLER-0004-policies-rls-tenant.md) | 🔵 Sprint 1 — 23/10 |
| [ARCH-RUNWAY-0003](ARCH-RUNWAY-0003-workflow-tabela-configuracao.md) | Tabela de configuração de workflow | 🧱 `#arch-workflow` | [ENABLER-0006](../enablers/ENABLER-0006-workflow-tabela-configuracao.md) | 🟡 Sprint 1→2 — 04/11 |
| [ARCH-RUNWAY-0004](ARCH-RUNWAY-0004-auditoria-append-only.md) | Trilha de auditoria append-only | 🛡️ `#arch-security` | [ENABLER-0007](../enablers/ENABLER-0007-auditoria-append-only.md) | 🔵 Sprint 1 — 29/10 |

**Convenção:** `ARCH-RUNWAY-{NNNN}` · arquivo `{ID}-{slug}.md` · ícone 🧱 ([padrão §2.1](https://github.com/fbso-techsolutions/platform-standards/blob/main/standards/agile/padrao-identificacao-entidades.md)).

> 🔄 **Migração de prefixo (2026-11-03):** `ARCHITECTURE-RUNWAY-` → `ARCH-RUNWAY-` (PENDENCY-0029 · padrão §4 item 7). Os 4 documentos e todas as referências foram renomeados via `git mv`, seguindo a receita da §5 do padrão. Decisão registrada em [D-13](../../prj-produto/backlog/DECISOES-BACKLOG.md).
