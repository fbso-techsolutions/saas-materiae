# 💬 User Story: US-FEAT-0002.0001-0007 — Registrar a etapa de Reciclagem

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0002 — Oficina de Manutenção (Workflow)](../epicos/EPIC-0002-oficina-de-manutencao-workflow.md) ➔ [FEATURE-0002.0001 — Painel Kanban do workflow](../features/FEATURE-0002.0001-painel-kanban-workflow.md) ➔ US-FEAT-0002.0001-0007 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 3 pontos |
| **Rastreio** | Workflow · R30 (serviço cosmético + operador), R31 (avanço para run in) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** operador de reciclagem,
- **quero** registrar o serviço cosmético realizado e o operador responsável,
- **para que** a etapa fique auditada e o item avance para o teste final.

## 2. Cenários comportamentais de aceite

### Cenário 1: Serviço cosmético registrado com auditoria
- **Dado** um item em **RECICLAGEM** (vindo do teste inicial ou do reparo),
- **Quando** o operador registra o serviço cosmético com data/hora e operador (R30),
- **Então** o registro fica no histórico do item com auditoria.

### Cenário 2: Avanço para Run In
- **Dado** o serviço registrado,
- **Quando** o operador avança,
- **Então** o item transita para **RUN IN** (R31).

### Cenário 3: Avanço bloqueado sem serviço registrado
- **Dado** que o serviço ainda não foi registrado,
- **Quando** o operador tenta avançar,
- **Então** o avanço é **bloqueado** informando o campo obrigatório.

## 3. Regras de negócio relacionadas

- **BR-2.1.2** — Transições auditadas (ator, data/hora) (cen. 1) — *definição na [FEATURE-0002.0001 §3](../features/FEATURE-0002.0001-painel-kanban-workflow.md)*
- **BR-2.1.6** — Reciclagem registra serviço cosmético, data/hora e operador (R30) e avança para run in (R31) (cens. 1 e 2) — *definição na [FEATURE-0002.0001 §3](../features/FEATURE-0002.0001-painel-kanban-workflow.md)*

## 4. Não funcionais

- Registro rápido no chão de fábrica: poucos campos, teclado/leitor, sem mouse.

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ opera sobre item em RECICLAGEM · **N** ✅ lista de serviços cosméticos conversada com a Operação · **V** ✅ etapa auditada e teste final liberado (R30/R31) · **E** ✅ 3 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 3 cenários testáveis.
