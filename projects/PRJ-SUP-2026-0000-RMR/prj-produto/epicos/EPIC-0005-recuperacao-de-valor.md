# 🧭 EPIC-0005 — Recuperação de Valor

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **ID** | `EPIC-0005` |
| **B-REQs atendidas** | [B-REQ-04 — Rastreabilidade de Baixa Patrimonial Contábil](../../prj-negocio/requisitos/requisitos-negocio.md) · [B-REQ-05 — Termo de Destruição Segura de Dados (LGPD)](../../prj-negocio/requisitos/requisitos-negocio.md) · [B-REQ-09 — Venda de Peças e Sucata (Recuperação de Valor)](../../prj-negocio/requisitos/requisitos-negocio.md) · [B-REQ-10 — Motor de Recuperação de Valor](../../prj-negocio/requisitos/requisitos-negocio.md) |
| **Features** | 6 (`FEATURE-0005.0001` … `FEATURE-0005.0006`) |
| **Origem** | [Requisitos de Negócio](../../prj-negocio/requisitos/requisitos-negocio.md) · [PEDIDO](../../prj-negocio/discovery/PEDIDO.md) · [BRAINSTORM](../discovery/BRAINSTORM.md) · [mapeamento](../rastreabilidade.md) |
| **Priorização** | [backlog](../../../../docs/produto/backlog/BACKLOG-LIST.md) |
| **Prioridade** | **Onda 1-Must (MVP mínimo) + Onda 2-Should (MVP completo) + Onda 3-Could (Integração & Valor)** — derivada das features (1 × Onda 1-Must (MVP mínimo) · 4 × Onda 2-Should (MVP completo) · 1 × Onda 3-Could (Integração & Valor)) · ver [backlog](../../../../docs/produto/backlog/BACKLOG-LIST.md) |
| **Status** | 📝 Rascunho (2026-10-20) |

---

## 1. Objetivo

- **Problema:** quando o reparo não compensa, o valor morre no fim do ciclo — peças boas se perdem, sucata não vira receita, a sanitização de dados não tem certificado e a baixa patrimonial nunca é conciliada.
- **Solução:** desmanche/colheita com lote e etiqueta, estoques de peças e sucata com unidade de medida, motor que compara a viabilidade de cada rota (reparo × remanufatura × desmanche × reciclagem × descarte), venda com catálogo/precificação/NF, termo de destruição segura de dados (LGPD) e baixa patrimonial contábil.
- **Impacto:** prejuízo da quebra minimizado por receita de peças/sucata, conformidade auditável (LGPD + MTR/PNRS) e **hipótese fiscal a validar**: pagamento de impostos indevidos sobre ativo morto, com dono **Finanças/Controladoria** e origem na [B-REQ-04](../../prj-negocio/requisitos/requisitos-negocio.md). A hipótese precisa de validação documental antes de virar meta ou benefício.

## 2. Fora do escopo deste épico

- No Onda 1-Must (MVP mínimo) entra só a `FEATURE-0005.0005` (travas LGPD/compliance) — desmanche, estoques, motor, venda e baixa são Onda 2-Should (MVP completo)/Onda 3-Could (Integração & Valor) ([backlog](../../../../docs/produto/backlog/BACKLOG-LIST.md)).
- A logística reversa de entrada (recebimento e triagem) pertence ao EPIC-0001 — este épico começa no desmanche.

## 3. Features e stories derivadas

| Feature | Card | Stories |
|---|---|---|
| `FEATURE-0005.0001` — Desmanche / colheita de peças e abertura de lote | — *(sem card)* | — |
| `FEATURE-0005.0002` — Estoques de peças e sucata (com unidade de medida) | — *(sem card)* | — |
| `FEATURE-0005.0003` — Motor de Recuperação de Valor (viabilidade por rota) | — *(sem card)* | — |
| `FEATURE-0005.0004` — Venda (catálogo, precificação, NF e baixa patrimonial) | — *(sem card)* | — |
| `FEATURE-0005.0005` — Travas de LGPD e compliance ambiental | [card](../features/FEATURE-0005.0005-travas-lgpd-compliance.md) | [0011](../user-stories/US-FEAT-0005.0005-0011-destruicao-dados-midia.md) · [0012](../user-stories/US-FEAT-0005.0005-0012-compliance-ambiental-destino.md) · [0013](../user-stories/US-FEAT-0005.0005-0013-evidencias-compliance-auditoria.md) |
| `FEATURE-0005.0006` — Baixa patrimonial contábil (rastreabilidade + conciliação) | — *(sem card)* | — |

---

> 💡 **Rastreabilidade:** escopo/criação das features: [registro de decisões](../backlog/DECISOES-BACKLOG.md) (ex.: `FEATURE-0005.0006` nasceu da decisão **(c) da B-REQ-04**) · pendências: [hub](../../pendencias.md). **Objetivo e fora do escopo acima são síntese** das B-REQ/PEDIDO/BRAINSTORM — 📝 revisar com as áreas. Este documento **aponta, não copia** — o detalhe mora no card da feature e nas stories.
