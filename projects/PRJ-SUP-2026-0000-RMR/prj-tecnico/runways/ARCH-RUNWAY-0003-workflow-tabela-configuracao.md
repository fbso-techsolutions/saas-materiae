# 🧱 ARCH-RUNWAY-0003 — Tabela de configuração de workflow

| Campo | Valor |
|---|---|
| **Tipo** | Architectural Runway |
| **Domínio** | 🧱 `#arch-workflow` |
| **Origem** | Gate de arquitetura 9/9 (2026-10-19) — checklist **B3** · [ADR-003](../../../../docs/tecnico/arquitetura/adrs/adr-003-workflow-configuravel.md) · [ADR-012](../../../../docs/tecnico/arquitetura/adrs/adr-012-stack-onda-1.md) |
| **Entregue por** | [ENABLER-0006](../enablers/ENABLER-0006-workflow-tabela-configuracao.md) |
| **Habilita** | FEATURE-0002.0001 (stories 0004–0009) e a rota humana da Onda 1-Must (MVP mínimo): etapas e transições viram **linha de dados**, não código |
| **Status** | 🟡 Sprint 1→2 — 04/11 |

**O que é:** máquina de estados própria com `ETAPA` e `TRANSICAO` persistidas em tabela de configuração, validando pré-condições e papel no servidor.

**Não é trabalho separado:** a entrega é o [ENABLER-0006](../enablers/ENABLER-0006-workflow-tabela-configuracao.md); este documento existe para rastrear a **capacidade** no backlog.

**Detalhe e critério de saída:** [ENABLER-0006 §3–§4](../enablers/ENABLER-0006-workflow-tabela-configuracao.md).
