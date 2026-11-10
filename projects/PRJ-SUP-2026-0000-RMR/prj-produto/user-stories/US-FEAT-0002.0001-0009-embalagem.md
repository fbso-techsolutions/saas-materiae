# 💬 User Story: US-FEAT-0002.0001-0009 — Registrar a etapa de Embalagem

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0002 — Oficina de Manutenção (Workflow)](../epicos/EPIC-0002-oficina-de-manutencao-workflow.md) ➔ [FEATURE-0002.0001 — Painel Kanban do workflow](../features/FEATURE-0002.0001-painel-kanban-workflow.md) ➔ US-FEAT-0002.0001-0009 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 3 pontos |
| **Rastreio** | Workflow · R33 (operador/data/hora), R35 (smart card + identificador juntos) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** operador de embalagem,
- **quero** registrar quem embalou, quando, e o smart card que acompanha o item,
- **para que** o conteúdo da embalagem fique rastreável até a expedição.

## 2. Cenários comportamentais de aceite

### Cenário 1: Embalagem concluída com operador e data/hora
- **Dado** um item aprovado em **RUN IN**,
- **Quando** o operador conclui a embalagem,
- **Então** ficam registrados operador e data/hora (R33) com auditoria.

### Cenário 2: Smart card associado ao item
- **Dado** a embalagem em andamento,
- **Quando** o operador informa o **smart card** lido/digitado junto com o identificador do item (R35),
- **Então** a associação smart card ↔ item fica salva no histórico.

### Cenário 3: Avanço para Expedição com dados completos
- **Dado** os dados obrigatórios (operador, data/hora, smart card) completos,
- **Quando** o operador avança,
- **Então** o item transita para **EXPEDIÇÃO**.

## 3. Regras de negócio relacionadas

- **BR-2.1.8** — Embalagem auditada (operador, data/hora) (cen. 1) — *definição na [FEATURE-0002.0001 §3](../features/FEATURE-0002.0001-painel-kanban-workflow.md)*

## 4. Não funcionais

- **Etiqueta final (R34) fica de fora da Onda 1-Must (MVP mínimo)** (FEATURE-0002.0002) — a embalagem **não** depende de impressão (*confirmado com a Operação em 2026-10-16 — [checklist A1](../discovery/checklist-operacao-po-onda-1.md)*).

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)): **I** ✅ opera sobre item aprovado em RUN IN · **N** ✅ papel do smart card conversado com a Operação (checklist A1/A2) · **V** ✅ rastreia o conteúdo até a expedição (R33/R35) · **E** ✅ 3 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 3 cenários testáveis.
