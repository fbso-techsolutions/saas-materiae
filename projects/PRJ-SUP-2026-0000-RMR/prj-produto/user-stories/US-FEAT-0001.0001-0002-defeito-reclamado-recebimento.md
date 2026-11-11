# 💬 User Story: US-FEAT-0001.0001-0002 — Registrar defeito reclamado no recebimento

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0001 — Logística Reversa e Triagem](../epicos/EPIC-0001-logistica-reversa-e-triagem.md) ➔ [FEATURE-0001.0001 — Recebimento de ativos](../features/FEATURE-0001.0001-recebimento-ativos.md) ➔ US-FEAT-0001.0001-0002 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 3 pontos |
| **Rastreio** | B-REQ-01 (categoria do ativo · apoio à triagem) · R6 (defeito reclamado), R15 (modelos) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techsolutions/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)) |
| **Status** | ✅ Revisado (2026-11-05) |

---

## 1. Declaração da história

- **Como** operador de triagem,
- **quero** registrar o defeito reclamado no momento do recebimento,
- **para que** o teste inicial tenha um ponto de partida e o histórico do item seja completo desde a entrada.

## 2. Cenários comportamentais de aceite

### Cenário 1: Defeito registrado pelo catálogo mínimo da Onda 1-Must (MVP mínimo)
- **Dado** um recebimento em andamento,
- **Quando** o operador seleciona o defeito reclamado no **catálogo mínimo da Onda 1-Must (MVP mínimo)**,
- **Então** o defeito fica associado ao item e visível no histórico iniciado.

### Cenário 2: Conclusão bloqueada sem defeito
- **Dado** que o defeito ainda não foi registrado,
- **Quando** o operador tenta concluir o recebimento,
- **Então** a confirmação é impedida — defeito é obrigatório.

### Cenário 3: Defeito herda visibilidade no teste inicial
- **Dado** o defeito registrado,
- **Quando** o item avança para **teste inicial**,
- **Então** o defeito reclamado aparece como referência para o técnico registrar o **defeito constatado** (evolução do fluxo — R7).

## 3. Regras de negócio relacionadas

- **BR-1.1.2** — Campos obrigatórios do recebimento, incluindo defeito (cen. 2)
- **BR-1.1.3** — Catálogo mínimo de defeitos embutido na Onda 1-Must (MVP mínimo) (cen. 1) — *definição na [FEATURE-0001.0001 §3](../features/FEATURE-0001.0001-recebimento-ativos.md)*

## 4. Não funcionais

- O catálogo da Onda 1-Must (MVP mínimo) é **mínimo e embutido** (decisão [D-02](../backlog/DECISOES-BACKLOG.md)) — o catálogo completo (local danificado, causa raiz, serviços) vem com **FEATURE-0001.0003 em Onda 2-Should (MVP completo)**.
- Seleção por teclado (atalho/foco), sem mouse.

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techsolutions/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)): **I** ✅ só exige o recebimento em andamento (US-FEAT-0001.0001-0001 como contexto, não como pré-condição de entrega) · **N** ✅ conversa define o catálogo mínimo · **V** ✅ histórico completo desde a entrada · **E** ✅ 3 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 3 cenários testáveis.
