# 💬 User Story: US-FEAT-0002.0001-0006 — Abrir a Ordem de Serviço (OS) no reparo

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0002 — Oficina de Manutenção (Workflow)](../epicos/EPIC-0002-oficina-de-manutencao-workflow.md) ➔ [FEATURE-0002.0001 — Painel Kanban do workflow](../features/FEATURE-0002.0001-painel-kanban-workflow.md) ➔ US-FEAT-0002.0001-0006 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 4 pontos |
| **Rastreio** | Workflow · R28 (campos da OS), R29 (destino pós-reparo) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techsolutions/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** técnico de manutenção,
- **quero** registrar a OS completa do conserto e indicar o destino do item,
- **para que** a manutenção fique documentada (o que, quem, quando) e o item siga para a próxima etapa correta.

## 2. Cenários comportamentais de aceite

### Cenário 1: OS completa registrada
- **Dado** um item em **REPARO**,
- **Quando** o técnico abre a OS,
- **Então** ele consegue registrar: técnico, data/hora **início e fim**, defeito constatado, local danificado, componente substituído, causa raiz e **serviço executado ou motivo de sem conserto** (R28).

### Cenário 2: Encerramento com serviço executado → Reciclagem
- **Dado** a OS encerrada com **serviço executado**,
- **Quando** o técnico confirma,
- **Então** o item transita para **RECICLAGEM** com auditoria (R29).

### Cenário 3: Encerramento sem conserto → Sucata com travas LGPD
- **Dado** a OS encerrada com **sem conserto**,
- **Quando** o técnico confirma,
- **Então** o item transita para **SUCATA** e as **travas LGPD da FEATURE-0005.0005** passam a ser exigidas antes da destinação (R29).

### Cenário 4: Encerramento bloqueado por campos obrigatórios
- **Dado** a OS sem os campos obrigatórios (técnico, datas, defeito constatado, serviço/motivo),
- **Quando** o técnico tenta encerrar,
- **Então** o encerramento é **bloqueado** apontando o que falta.

## 3. Regras de negócio relacionadas

- **BR-2.1.5** — Campos obrigatórios da OS e rota sem conserto → SUCATA com travas FEATURE-0005.0005 (cens. 1, 3 e 4) — *definição na [FEATURE-0002.0001 §3](../features/FEATURE-0002.0001-painel-kanban-workflow.md)*

## 4. Não funcionais

- Prazo da OS auditável (início × fim) — base de lead time futuro (FEATURE-0002.0004).
- Sem mouse (teclado/atalhos).

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techsolutions/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)): **I** ✅ opera sobre item em REPARO, sem stories novas dependentes · **N** ✅ campos da OS detalhados na conversa com a oficina · **V** ✅ documenta o conserto e roteia o item (R28/R29) · **E** ✅ 4 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 4 cenários testáveis.
