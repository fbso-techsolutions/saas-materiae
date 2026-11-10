# 🧭 EPIC-0001 — Logística Reversa e Triagem

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **ID** | `EPIC-0001` |
| **B-REQs atendidas** | [B-REQ-01 — Cadastro Simplificado de Ativos de TI](../../prj-negocio/requisitos/requisitos-negocio.md) · [B-REQ-02 — Motor Financeiro de Triagem (Regra dos 40%)](../../prj-negocio/requisitos/requisitos-negocio.md) |
| **Features** | 5 (`FEATURE-0001.0001` … `FEATURE-0001.0005`) |
| **Origem** | [Requisitos de Negócio](../../prj-negocio/requisitos/requisitos-negocio.md) · [PEDIDO](../../prj-negocio/discovery/PEDIDO.md) · [BRAINSTORM](../discovery/BRAINSTORM.md) · [mapeamento](../rastreabilidade.md) |
| **Priorização** | [backlog](../../../../docs/produto/backlog/BACKLOG-LIST.md) |
| **Prioridade** | **Onda 1-Must (MVP mínimo) + Onda 2-Should (MVP completo)** — derivada das features (1 × Onda 1-Must (MVP mínimo) · 4 × Onda 2-Should (MVP completo)) · ver [backlog](../../../../docs/produto/backlog/BACKLOG-LIST.md) |
| **Status** | 📝 Rascunho (2026-10-20) |

---

## 1. Objetivo

- **Problema:** sem categorização padronizada dos ativos (B-REQ-01) e sem critério financeiro único para decidir reparo × descarte (B-REQ-02), a entrada na esteira é julgada "no achismo" e o rastreio quebra desde a porta.
- **Solução:** recebimento que registra identificador e defeito, cadastros mestres que padronizam defeitos/locais/causas/serviços/materiais, validação de identificador e watchlist — mais o motor de viabilidade (custo reparo × valor de mercado) que orienta a triagem.
- **Impacto:** todo ativo categorizado e decidido por regra já na entrada — base confiável para reuso e venda, e menos recompra de ativos com defeito recorrente (blacklist/scrap/boomerang).

## 2. Fora do escopo deste épico

- No Onda 1-Must (MVP mínimo) entra só a `FEATURE-0001.0001` (recebimento) — as outras 4 features do épico são Onda 2-Should (MVP completo) ([backlog](../../../../docs/produto/backlog/BACKLOG-LIST.md)).
- O motor de viabilidade (`FEATURE-0001.0002`) depende de custos de peças e mão de obra que vêm do EPIC-0005 — fora da primeira fatia.

## 3. Features e stories derivadas

| Feature | Card | Stories |
|---|---|---|
| `FEATURE-0001.0001` — Recebimento de ativos e defeito | [card](../features/FEATURE-0001.0001-recebimento-ativos.md) | [0001](../user-stories/US-FEAT-0001.0001-0001-registro-recebimento-ativo.md) · [0002](../user-stories/US-FEAT-0001.0001-0002-defeito-reclamado-recebimento.md) · [0003](../user-stories/US-FEAT-0001.0001-0003-direcionamento-para-proxima-etapa.md) |
| `FEATURE-0001.0002` — Motor de cálculo de viabilidade (custo reparo × valor de mercado) | — *(sem card)* | — |
| `FEATURE-0001.0003` — Cadastros mestres de apoio | [card](../features/FEATURE-0001.0003-cadastros-mestres.md) | [0014](../user-stories/US-FEAT-0001.0003-0014-cadastros-defeitos-locais-causas.md) · [0015](../user-stories/US-FEAT-0001.0003-0015-cadastros-servicos-executados.md) · [0016](../user-stories/US-FEAT-0001.0003-0016-cadastro-modelos-equipamento.md) · [0017](../user-stories/US-FEAT-0001.0003-0017-cadastro-materiais-insumos.md) |
| `FEATURE-0001.0004` — Validação de identificador no cadastro mestre | [card](../features/FEATURE-0001.0004-validacao-identificador-cadastro-mestre.md) | [0018](../user-stories/US-FEAT-0001.0004-0018-validacao-identificador-cadastro-mestre.md) · [0019](../user-stories/US-FEAT-0001.0004-0019-devolutiva-desfecho.md) |
| `FEATURE-0001.0005` — Watchlist de triagem | [card](../features/FEATURE-0001.0005-watchlist-triagem.md) | [0020](../user-stories/US-FEAT-0001.0005-0020-cadastro-watchlist.md) · [0021](../user-stories/US-FEAT-0001.0005-0021-validacao-watchlist-triagem.md) |

---

> 💡 **Rastreabilidade:** escopo/criação das features: [registro de decisões](../backlog/DECISOES-BACKLOG.md) (ex.: **PENDENCY-0001** → nova `FEATURE-0001.0005` watchlist, Onda 2-Should (MVP completo)) · pendências: [hub](../../pendencias.md). **Objetivo e fora do escopo acima são síntese** das B-REQ/PEDIDO/BRAINSTORM — 📝 revisar com as áreas. Este documento **aponta, não copia** — o detalhe mora no card da feature e nas stories.
