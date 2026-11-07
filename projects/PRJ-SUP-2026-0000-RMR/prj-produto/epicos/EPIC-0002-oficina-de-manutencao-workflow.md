# 🧭 EPIC-0002 — Oficina de Manutenção (Workflow)

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **ID** | `EPIC-0002` |
| **B-REQs atendidas** | — *(nenhuma direta; cobertura via R do [PEDIDO](../../prj-negocio/discovery/PEDIDO.md): R24 · R34 · R36/R37 · R49–R59 — ver [mapeamento](../rastreabilidade.md))* |
| **Features** | 5 (`FEATURE-0002.0001` … `FEATURE-0002.0005`) |
| **Origem** | [Requisitos de Negócio](../../prj-negocio/requisitos/requisitos-negocio.md) · [PEDIDO](../../prj-negocio/discovery/PEDIDO.md) · [BRAINSTORM](../discovery/BRAINSTORM.md) · [mapeamento](../rastreabilidade.md) |
| **Priorização** | [backlog](../backlog/BACKLOG-LIST.md) |
| **Prioridade** | **Onda 1-Must (MVP mínimo) + Onda 2-Should (MVP completo)** — derivada das features (2 × Onda 1-Must (MVP mínimo) · 3 × Onda 2-Should (MVP completo)) · ver [backlog](../backlog/BACKLOG-LIST.md) |
| **Status** | 📝 Rascunho (2026-10-20) |

---

## 1. Objetivo

- **Problema:** a manutenção roda sem status único do ativo — o fluxo avança por planilha e e-mail, sem visão de etapa, sem etiqueta rastreável e sem dado para decidir o destino.
- **Solução:** painel Kanban com as sete etapas do workflow ([R20](../../prj-negocio/discovery/PEDIDO.md): triagem → teste inicial → reparo → reciclagem → run in → embalagem → expedição), com sucata como ramo de descarte a partir de "sem conserto" e de reprovação no run in; etiquetas com controle de impressão, busca rápida do histórico e expedição com pallet conferido por leitura + NF de saída.
- **Impacto:** visibilidade em tempo real do WIP, taxa de reparo e SLA mensuráveis, e expedição sem retrabalho.

## 2. Fora do escopo deste épico

- No Onda 1-Must (MVP mínimo) entram só `FEATURE-0002.0001` (Kanban) e `FEATURE-0002.0005` (expedição — desmembrada por [PENDENCY-0004](../../pendencias.md)); etiquetas, busca e dashboards são Onda 2-Should (MVP completo) ([backlog](../backlog/BACKLOG-LIST.md)).
- Venda, precificação e baixa patrimonial pertencem ao EPIC-0005 — não a este épico.

## 3. Features e stories derivadas

| Feature | Card | Stories |
|---|---|---|
| `FEATURE-0002.0001` — Painel Kanban do workflow (transições por etapa) | [card](../features/FEATURE-0002.0001-painel-kanban-workflow.md) | [0004](../user-stories/US-FEAT-0002.0001-0004-painel-kanban.md) · [0005](../user-stories/US-FEAT-0002.0001-0005-teste-inicial.md) · [0006](../user-stories/US-FEAT-0002.0001-0006-reparo-os.md) · [0007](../user-stories/US-FEAT-0002.0001-0007-reciclagem.md) · [0008](../user-stories/US-FEAT-0002.0001-0008-run-in.md) · [0009](../user-stories/US-FEAT-0002.0001-0009-embalagem.md) |
| `FEATURE-0002.0002` — Etiquetas e controle de impressão | — *(sem card)* | — |
| `FEATURE-0002.0003` — Busca rápida (histórico por identificador / OS) | — *(sem card)* | — |
| `FEATURE-0002.0004` — Dashboards e indicadores | — *(sem card)* | — |
| `FEATURE-0002.0005` — Expedição (pallet por leitura + NF de saída) | [card](../features/FEATURE-0002.0005-expedicao.md) | [0010](../user-stories/US-FEAT-0002.0005-0010-expedicao.md) |

---

> 💡 **Rastreabilidade:** escopo/criação das features: [registro de decisões](../backlog/DECISOES-BACKLOG.md) (ex.: `FEATURE-0002.0005` **migrou da** `FEATURE-0002.0001` — decisões **PENDENCY-0004/0005/0006/0009**) · pendências: [hub](../../pendencias.md). **Objetivo e fora do escopo acima são síntese** das B-REQ/PEDIDO/BRAINSTORM — 📝 revisar com as áreas. Este documento **aponta, não copia** — o detalhe mora no card da feature e nas stories.
