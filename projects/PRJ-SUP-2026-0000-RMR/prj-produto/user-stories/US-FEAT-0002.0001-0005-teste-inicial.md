# 💬 User Story: US-FEAT-0002.0001-0005 — Operar a etapa de Teste Inicial

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0002 — Oficina de Manutenção (Workflow)](../epicos/EPIC-0002-oficina-de-manutencao-workflow.md) ➔ [FEATURE-0002.0001 — Painel Kanban do workflow](../features/FEATURE-0002.0001-painel-kanban-workflow.md) ➔ US-FEAT-0002.0001-0005 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 3 pontos |
| **Rastreio** | Workflow · R26 (defeito constatado), R27 (roteamento) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** técnico de teste,
- **quero** registrar o defeito constatado e escolher para onde o item segue,
- **para que** o fluxo continue pela rota correta a partir da análise técnica.

## 2. Cenários comportamentais de aceite

### Cenário 1: Defeito constatado registrado ao lado do reclamado
- **Dado** um item em **TESTE INICIAL** com o defeito reclamado visível (herdado das stories de recebimento — [US-FEAT-0001.0001-0001](US-FEAT-0001.0001-0001-registro-recebimento-ativo.md)/[US-FEAT-0001.0001-0002](US-FEAT-0001.0001-0002-defeito-reclamado-recebimento.md)),
- **Quando** o técnico registra o **defeito constatado** (R26),
- **Então** ele fica associado ao item e ambos os defeitos constam no histórico.

### Cenário 2: Roteamento auditado para Reparo ou Reciclagem
- **Dado** o defeito constatado registrado,
- **Quando** o técnico escolhe a rota,
- **Então** o item transita para **REPARO** (com defeito) ou **RECICLAGEM**, com transição auditada — decisão **humana**, sem motor (FEATURE-0001.0002 fora da Onda 1-Must (MVP mínimo)).

### Cenário 3: Avanço bloqueado sem defeito constatado
- **Dado** que o defeito constatado ainda não foi registrado,
- **Quando** o técnico tenta avançar,
- **Então** o avanço é **bloqueado** informando o campo obrigatório.

## 3. Regras de negócio relacionadas

- **BR-2.1.2** — Transições auditadas (ator, data/hora) (cen. 2) — *definição na [FEATURE-0002.0001 §3](../features/FEATURE-0002.0001-painel-kanban-workflow.md)*
- **BR-2.1.4** — Defeito constatado obrigatório para rotear (cens. 2 e 3)

## 4. Não funcionais

- Operação por teclado, sem mouse.
- Toda tentativa de transição (inclusive bloqueada) entra na trilha de auditoria.

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)): **I** ✅ opera sobre item já em TESTE, sem depender de outras stories novas · **N** ✅ catálogo de defeito constatado conversado com a Operação · **V** ✅ alimenta o roteamento (R26/R27) · **E** ✅ 3 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 3 cenários testáveis.
