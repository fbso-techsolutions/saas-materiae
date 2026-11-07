# 🧭 EPIC-0004 — Jornada do Service Desk

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **ID** | `EPIC-0004` |
| **B-REQs atendidas** | [B-REQ-06 — Abertura de Triagem via Chamado de Troca](../../prj-negocio/requisitos/requisitos-negocio.md) · [B-REQ-07 — Consulta de Ativos Disponíveis para Swap (Troca)](../../prj-negocio/requisitos/requisitos-negocio.md) · [B-REQ-08 — Fluxo de Recebimento e Posse do Ativo Recuperado](../../prj-negocio/requisitos/requisitos-negocio.md) |
| **Features** | 3 (`FEATURE-0004.0001` … `FEATURE-0004.0003`) |
| **Origem** | [Requisitos de Negócio](../../prj-negocio/requisitos/requisitos-negocio.md) · [PEDIDO](../../prj-negocio/discovery/PEDIDO.md) · [BRAINSTORM](../discovery/BRAINSTORM.md) · [mapeamento](../rastreabilidade.md) |
| **Priorização** | [backlog](../backlog/BACKLOG-LIST.md) |
| **Prioridade** | **Onda 2-Should (MVP completo) + Onda 3-Could (Integração & Valor)** — derivada das features (1 × Onda 2-Should (MVP completo) · 2 × Onda 3-Could (Integração & Valor)) · ver [backlog](../backlog/BACKLOG-LIST.md) |
| **Status** | 📝 Rascunho (2026-10-20) |

---

## 1. Objetivo

- **Problema:** o Service Desk não tem ponte com a esteira — diagnosticado o defeito, o ativo se perde fora do rastreio; trocar a máquina exige requisição mesmo com recuperado disponível; e o aceite do ativo consertado é manual.
- **Solução:** envio em 1 clique do defeituoso para a triagem (B-REQ-06), busca de disponíveis para swap (B-REQ-07) e workflow de aceite e posse do recuperado (B-REQ-08).
- **Impacto:** trocas mais rápidas para o cliente final sem passar pela triagem de novo, menos requisições de máquina nova e cadeia de custódia auditável.

## 2. Fora do escopo deste épico

- **Quando:** fora da Onda 1-Must (MVP mínimo) — **FEATURE-0004.0001 na Onda 2-Should (MVP completo)**; FEATURE-0004.0002/0004.0003 em **Onda 3-Could (Integração & Valor)/roadmap** ([backlog](../backlog/BACKLOG-LIST.md)).
- O sistema de chamados do Service Desk não pertence ao épico — aqui só a jornada do ativo (envio, localização e custódia).

## 3. Features e stories derivadas

| Feature | Card | Stories |
|---|---|---|
| `FEATURE-0004.0001` — Envio de ativo defeituoso para a esteira (integração/botão) | — *(sem card)* | — |
| `FEATURE-0004.0002` — Busca de ativos "prontos para reuso" por configuração | — *(sem card)* | — |
| `FEATURE-0004.0003` — Workflow de transferência de custódia | — *(sem card)* | — |

---

> 💡 **Rastreabilidade:** priorização e detalhamento: [backlog](../backlog/BACKLOG-LIST.md) · pendências: [hub](../../pendencias.md). **Objetivo e fora do escopo acima são síntese** das B-REQ/PEDIDO/BRAINSTORM — 📝 revisar com as áreas. Este documento **aponta, não copia** — o detalhe mora no card da feature (quando criado).
