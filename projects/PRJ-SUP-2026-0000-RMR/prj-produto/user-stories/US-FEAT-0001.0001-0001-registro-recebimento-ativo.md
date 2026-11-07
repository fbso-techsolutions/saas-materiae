# 💬 User Story: US-FEAT-0001.0001-0001 — Registrar recebimento de ativo na triagem

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0001 — Logística Reversa e Triagem](../epicos/EPIC-0001-logistica-reversa-e-triagem.md) ➔ [FEATURE-0001.0001 — Recebimento de ativos](../features/FEATURE-0001.0001-recebimento-ativos.md) ➔ US-FEAT-0001.0001-0001 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 4 pontos |
| **Rastreio** | B-REQ-01 · R20, R21 |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | ✅ Revisado (2026-11-05) |

---

## 1. Declaração da história

- **Como** operador de triagem,
- **quero** registrar o recebimento de um ativo informando identificador, categoria/modelo e nota fiscal de entrada,
- **para que** o item entre rastreado no processo — base para reuso e para evitar novas compras.

## 2. Cenários comportamentais de aceite

### Cenário 1: Recebimento confirmado com dados completos
- **Dado que** o operador informou o identificador (lido no leitor ou digitado), a categoria/modelo e a NF de entrada,
- **Quando** ele confirma o recebimento,
- **Então** o item é criado na etapa **TRIAGEM** com ator, data/hora e local registrados.

### Cenário 2: Bloqueio de duplicidade
- **Dado que** o identificador informado já pertence a um **item em processo ativo**,
- **Quando** o operador tenta confirmar,
- **Então** o sistema **bloqueia** a duplicidade e informa o item existente (*regra derivada — [PENDENCY-0009](../../pendencias.md), confirmada com as áreas em 2026-10-16*).

### Cenário 3: Campo obrigatório ausente
- **Dado que** um campo obrigatório está vazio (identificador, categoria/modelo ou NF),
- **Quando** o operador tenta confirmar,
- **Então** a confirmação é impedida com mensagem apontando o campo faltante.

### Cenário 4: Estado auditado pós-confirmação
- **Dado** o recebimento concluído,
- **Quando** o sistema avalia o estado do item,
- **Então** ele está em **TRIAGEM** com o histórico iniciado (primeira transição auditada) e o identificador lido fica registrado.

## 3. Regras de negócio relacionadas

- **BR-1.1.1** — Bloqueio de duplicidade de identificador em processo ativo (cen. 2) — *definição na [FEATURE-0001.0001 §3](../features/FEATURE-0001.0001-recebimento-ativos.md)*
- **BR-1.1.2** — Campos obrigatórios do recebimento (cen. 3)
- **BR-1.1.4** — Auditoria de etapa/ator/data-hora/local (cens. 1 e 4)

## 4. Não funcionais

- Entrada do identificador por **leitor de código** com campo sempre focado (sem mouse — BR-1.1.6).
- Sem chamadas a sistemas externos na Onda 1-Must (MVP mínimo).

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ entregável isolada (nenhuma outra story depende dela para *ser entregue*) · **N** ✅ detalhe na conversa com o PO · **V** ✅ item rastreado desde a entrada (B-REQ-01) · **E** ✅ escopo fechado, 4 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 4 cenários testáveis.
