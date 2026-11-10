# 🎯 Escopo da Onda 1-Must (MVP mínimo) — fatia vertical

> **O que é:** a definição do **Onda 1-Must (MVP mínimo)** — a menor fatia que fecha o ciclo do item ponta a ponta. Decisão de origem: **D-04** ([DECISOES-BACKLOG](backlog/DECISOES-BACKLOG.md)). Itens executáveis: [BACKLOG-LIST](../../../docs/produto/backlog/BACKLOG-LIST.md) (lista única). Critérios de priorização: [backlog/README](backlog/README.md).
> **Status:** ✅ Escopo confirmado (2026-10-16) · ✅ fatiamento S2–S5 **validado (2026-10-30)** ([PENDENCY-0032](../pendencias.md)).

## Objetivo

**Um item serializado (1 modelo)** percorre `TRIAGEM → TESTE INICIAL → REPARO → RECICLAGEM → RUN IN → EMBALAGEM → EXPEDIÇÃO` com rastreabilidade completa, incluindo a rota de descarte com **wipe/destruição certificado** — sem depender de sistemas externos.

## Entra × fica de fora

| Entra na Onda 1-Must (MVP mínimo) | Fica de fora da Onda 1-Must (MVP mínimo) — mas **no MVP** (Onda 2-Should (MVP completo)) | Fica para Onda 3-Could (Integração & Valor) |
|---|---|---|
| [FEATURE-0001.0001](features/FEATURE-0001.0001-recebimento-ativos.md) · [FEATURE-0002.0001](features/FEATURE-0002.0001-painel-kanban-workflow.md) · [FEATURE-0002.0005](features/FEATURE-0002.0005-expedicao.md) · [FEATURE-0005.0005](features/FEATURE-0005.0005-travas-lgpd-compliance.md) (mínimo: registro do certificado) · 1 modelo de material serializado · decisão de rota **humana** (sem motor) | FEATURE-0001.0002 · FEATURE-0001.0003 · FEATURE-0001.0004 · FEATURE-0001.0005 · FEATURE-0002.0002 · FEATURE-0002.0003 · FEATURE-0002.0004 · FEATURE-0003.0001 · FEATURE-0004.0001 · FEATURE-0005.0001 · FEATURE-0005.0002 · FEATURE-0005.0003 · FEATURE-0005.0006 | FEATURE-0004.0002 · FEATURE-0004.0003 · FEATURE-0005.0004 |

Base do fatiamento: [BRAINSTORM §4.3, §15.5 e §16](discovery/BRAINSTORM.md) — "Onda 1-Must (MVP mínimo): triagem→…→expedição com 1 modelo; Onda 2-Should (MVP completo): todas as variações, dashboards e integrações". As features fora da Onda 1-Must (MVP mínimo) estão no [pipeline do backlog](../../../docs/produto/backlog/BACKLOG-LIST.md#pipeline-de-features-sem-stories).

## Critério de pronto da Onda 1-Must (MVP mínimo)

O item atravessa todas as etapas sem "buraco" de informação, com trilha de auditoria (quem/quando/onde) e sem sistemas externos como pré-requisito.

## Composição em stories — 13 stories · 45 SP

As 4 features da Onda 1-Must (MVP mínimo) já estão detalhadas em **13 stories** ([índice](user-stories/README.md)):

| Feature | Stories | SP |
|---|---|---|
| FEATURE-0001.0001 | 0001 · 0002 · 0003 | 11 |
| FEATURE-0002.0001 | 0004 · 0005 · 0006 · 0007 · 0008 · 0009 | 19 |
| FEATURE-0002.0005 | 0010 | 4 |
| FEATURE-0005.0005 | 0011 · 0012 · 0013 | 11 |
| **Total** | **13** | **45** |

## Fatiamento proposto — S2 a S5

Capacidade declarada: **14 SP por sprint** ([equipe §3.2](../equipe.md)). 45 SP ⇒ **~4 sprints**, não uma. Até a Sprint 1 a Onda 1-Must (MVP mínimo) estava descrito como "13 stories na Sprint 2", o que excede a capacidade em 31 SP.

| Sprint | Data | Stories | SP |
|---|---|---|---|
| **S2** | 02/11 | 0001 · 0002 · 0003 · 0004 | 14 |
| **S3** | 16/11 | 0005 · 0006 · 0007 | 10 |
| **S4** | 30/11 | 0008 · 0009 · 0010 · 0011 | 14 |
| **S5** | 14/12 | 0012 · 0013 | 7 |

Cada story e sua sprint estão na coluna `Entregue por` do [BACKLOG-LIST](../../../docs/produto/backlog/BACKLOG-LIST.md); a cadeia `Depende de` segue o fluxo do processo.

> ✅ **Validado (2026-10-30)** — PO/PM + Tech lead ([PENDENCY-0032](../pendencias.md)). Ajustes de ordem e de capacidade podem mudar as datas sem alterar o escopo da Onda 1-Must (MVP mínimo).
