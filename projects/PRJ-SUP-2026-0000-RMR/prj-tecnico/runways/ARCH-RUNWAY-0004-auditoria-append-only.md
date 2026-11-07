# 🧱 ARCH-RUNWAY-0004 — Trilha de auditoria append-only

| Campo | Valor |
|---|---|
| **Tipo** | Architectural Runway |
| **Domínio** | 🛡️ `#arch-security` |
| **Origem** | Gate de arquitetura 9/9 (2026-10-19) — checklist **C3** · [ADR-012](../../../../docs/tecnico/arquitetura/adrs/adr-012-stack-onda-1.md) |
| **Entregue por** | [ENABLER-0007](../enablers/ENABLER-0007-auditoria-append-only.md) |
| **Habilita** | Auditoria das 13 stories (BR-2.1.2) · evidências de compliance da FEATURE-0005.0005 · prova para auditoria interna/regulatória |
| **Status** | 🔵 Sprint 1 — 29/10 |

**O que é:** tabela `EVENTO_AUDITORIA` append-only (quem, quando, o quê, identificador lido, `tenant_id`), com bloqueio de `UPDATE`/`DELETE` na aplicação **e** no banco.

**Não é trabalho separado:** a entrega é o [ENABLER-0007](../enablers/ENABLER-0007-auditoria-append-only.md); este documento existe para rastrear a **capacidade** no backlog.

**Detalhe e critério de saída:** [ENABLER-0007 §3–§4](../enablers/ENABLER-0007-auditoria-append-only.md).
