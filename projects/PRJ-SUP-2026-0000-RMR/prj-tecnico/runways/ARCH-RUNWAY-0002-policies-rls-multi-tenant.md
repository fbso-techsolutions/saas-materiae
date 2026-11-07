# 🧱 ARCH-RUNWAY-0002 — Policies de RLS (multi-tenant desde a Onda 1-Must (MVP mínimo))

| Campo | Valor |
|---|---|
| **Tipo** | Architectural Runway |
| **Domínio** | 🛡️ `#arch-security` |
| **Origem** | Gate de arquitetura 9/9 (2026-10-19) — checklist **B2** · [ADR-002](../../../../docs/tecnico/arquitetura/adrs/adr-002-rls-multi-tenant.md) · [ADR-012](../../../../docs/tecnico/arquitetura/adrs/adr-012-stack-onda-1.md) |
| **Entregue por** | [ENABLER-0004](../enablers/ENABLER-0004-policies-rls-tenant.md) |
| **Habilita** | Toda tabela de domínio das 13 stories (isolamento por `tenant_id` desde o 1º dia) · evolução SaaS Onda 4 (Produto)/Onda 5 (Plataforma) sem refatoração |
| **Status** | 🔵 Sprint 1 — 23/10 |

**O que é:** `tenant_id` + Row Level Security em todas as tabelas de domínio, com `SET LOCAL app.current_tenant` na transação de cada request.

**Não é trabalho separado:** a entrega é o [ENABLER-0004](../enablers/ENABLER-0004-policies-rls-tenant.md); este documento existe para rastrear a **capacidade** no backlog.

**Detalhe e critério de saída:** [ENABLER-0004 §3–§4](../enablers/ENABLER-0004-policies-rls-tenant.md).
