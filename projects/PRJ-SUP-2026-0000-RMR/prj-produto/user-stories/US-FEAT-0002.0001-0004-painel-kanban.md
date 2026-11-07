# 💬 User Story: US-FEAT-0002.0001-0004 — Ver o painel Kanban com os itens por etapa

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0002 — Oficina de Manutenção (Workflow)](../epicos/EPIC-0002-oficina-de-manutencao-workflow.md) ➔ [FEATURE-0002.0001 — Painel Kanban do workflow](../features/FEATURE-0002.0001-painel-kanban-workflow.md) ➔ US-FEAT-0002.0001-0004 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 3 pontos |
| **Rastreio** | Workflow (R20) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | ✅ Revisado (2026-11-05) |

---

## 1. Declaração da história

- **Como** técnico/operador da oficina,
- **quero** ver o painel com os itens organizados por etapa,
- **para que** eu saiba o que está em cada ponto do fluxo e priorize o atendimento.

## 2. Cenários comportamentais de aceite

### Cenário 1: Painel com coluna por etapa
- **Dado** que existem itens em etapas diferentes (TRIAGEM, TESTE INICIAL, REPARO, RECICLAGEM, RUN IN, EMBALAGEM, EXPEDIÇÃO) e itens que seguiram para SUCATA,
- **Quando** o operador abre o painel,
- **Então** cada uma das sete etapas aparece como coluna com seus cartões (identificador, modelo, defeito reclamado e tempo na etapa), a coluna EXPEDIÇÃO é somente leitura e os itens em SUCATA aparecem como ramo de descarte, sinalizados no cartão e filtráveis, sem coluna própria.

### Cenário 2: Atualização automática sem ação manual
- **Dado** um item que mudou de etapa em outra sessão,
- **Quando** o painel atualiza (polling),
- **Então** o cartão aparece na nova coluna sem ação manual.

### Cenário 3: Navegação exclusivamente por teclado
- **Dado** o painel aberto,
- **Quando** o operador navega,
- **Então** ele percorre colunas e cartões **somente com teclado/atalhos** — nenhuma ação exige mouse.

## 3. Regras de negócio relacionadas

- **BR-2.1.1** — Painel com sete colunas por etapa, EXPEDIÇÃO somente leitura e SUCATA como ramo (cen. 1) — *definição na [FEATURE-0002.0001 §3](../features/FEATURE-0002.0001-painel-kanban-workflow.md)*
- **BR-2.1.10** — Atualização por polling + operação sem mouse (cens. 2 e 3)

## 4. Não funcionais

- Atualização automática periódica (polling) no MVP — sem WebSocket ([BRAINSTORM §6.7](../discovery/BRAINSTORM.md)).
- Leitor de código foca o cartão/etapa selecionada.

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ visualização autônoma (lê dados existentes) · **N** ✅ campos dos cartões ajustáveis na conversa · **V** ✅ visão operacional do fluxo (R20) · **E** ✅ 3 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 3 cenários testáveis.
