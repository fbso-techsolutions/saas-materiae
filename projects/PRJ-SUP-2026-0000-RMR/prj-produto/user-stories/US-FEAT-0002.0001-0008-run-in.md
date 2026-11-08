# 💬 User Story: US-FEAT-0002.0001-0008 — Aprovar ou reprovar no Run In

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0002 — Oficina de Manutenção (Workflow)](../epicos/EPIC-0002-oficina-de-manutencao-workflow.md) ➔ [FEATURE-0002.0001 — Painel Kanban do workflow](../features/FEATURE-0002.0001-painel-kanban-workflow.md) ➔ US-FEAT-0002.0001-0008 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 3 pontos |
| **Rastreio** | Workflow · R32 (aprovação/reprovação e retornos) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** técnico do run in,
- **quero** registrar o resultado do teste final (aprovado/reprovado) e, se reprovado, indicar para onde o item volta,
- **para que** só siga para embalagem o item que realmente passou no teste.

## 2. Cenários comportamentais de aceite

### Cenário 1: Aprovado → Embalagem
- **Dado** um item em **RUN IN**,
- **Quando** o técnico registra o resultado **aprovado**,
- **Então** o item transita para **EMBALAGEM** com auditoria (R32).

### Cenário 2: Reprovado → retorno a Reparo ou Reciclagem
- **Dado** um item em **RUN IN** com resultado **reprovado**,
- **Quando** o técnico confirma,
- **Então** o item **retorna** para **REPARO** ou **RECICLAGEM** — escolha humana registrada (R32).

### Cenário 3: Histórico da decisão consultável
- **Dado** o resultado registrado,
- **Quando** o histórico é consultado,
- **Então** aparecem resultado, técnico/operador e data/hora da decisão.

## 3. Regras de negócio relacionadas

- **BR-2.1.7** — Aprovado transita para EMBALAGEM com auditoria (cen. 1) — *definição na [FEATURE-0002.0001 §3](../features/FEATURE-0002.0001-painel-kanban-workflow.md)*
- **BR-2.1.2** — Transições auditadas (ator, data/hora) (cens. 1 e 3)

## 4. Não funcionais

- Ciclo reprova → retorna → testa de novo deve ser possível quantas vezes necessário, sempre auditado (sem "buraco" de informação).

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ opera sobre item em RUN IN · **N** ✅ regras de reprovado conversadas com a oficina · **V** ✅ garante que só itens aprovados sigam (R32) · **E** ✅ 3 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 3 cenários testáveis.
