# 💬 User Story: US-FEAT-0001.0001-0003 — Direcionar o item para a próxima etapa após a triagem

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0001 — Logística Reversa e Triagem](../epicos/EPIC-0001-logistica-reversa-e-triagem.md) ➔ [FEATURE-0001.0001 — Recebimento de ativos](../features/FEATURE-0001.0001-recebimento-ativos.md) ➔ US-FEAT-0001.0001-0003 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 4 pontos |
| **Rastreio** | B-REQ-01 · R25 (triagem → *teste funcional* — etapa **TESTE INICIAL** — ou sucata), R20 (auditoria por etapa) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techsolutions/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)) |
| **Status** | ✅ Revisado (2026-11-05) |

---

## 1. Declaração da história

- **Como** operador de triagem,
- **quero** direcionar o item recebido para **teste inicial** ou **sucata**,
- **para que** o fluxo continue pela rota correta — com a decisão sob minha responsabilidade na Onda 1-Must (MVP mínimo).

## 2. Cenários comportamentais de aceite

### Cenário 1: Direcionamento auditado
- **Dado** um item em **TRIAGEM** com identificador, categoria/modelo, NF e defeito registrados,
- **Quando** o operador escolhe a rota (teste inicial ou sucata),
- **Então** o item transita para a etapa escolhida com transição auditada (ator, data/hora, identificador).

### Cenário 2: Direcionamento impedido por dados incompletos
- **Dado** um item incompleto (sem defeito registrado),
- **Quando** o operador tenta direcionar,
- **Então** o direcionamento é impedido informando o que falta.

### Cenário 3: Rota humana sem sugestão automática
- **Dado** que a rota é **humana** na Onda 1-Must (MVP mínimo),
- **Quando** o operador escolhe,
- **Então** nenhuma sugestão automática é aplicada — o motor de decisão (FEATURE-0001.0002) **não** participa (decisão [D-03](../backlog/DECISOES-BACKLOG.md)).

### Cenário 4: Sucata exige travas LGPD antes da destinação
- **Dado** que o operador escolheu **sucata**,
- **Quando** a transição ocorre,
- **Então** o item entra na rota de descarte com as **travas LGPD da FEATURE-0005.0005** exigidas antes da destinação.

## 3. Regras de negócio relacionadas

- **BR-1.1.4** — Transição auditada: ator, data/hora, local e identificador (R20) — nas conclusões e nas tentativas bloqueadas (cens. 1 e 2) — *definição na [FEATURE-0001.0001 §3](../features/FEATURE-0001.0001-recebimento-ativos.md)*
- **BR-1.1.5** — Direcionamento pós-triagem manual na Onda 1-Must (MVP mínimo) — rota automática só com FEATURE-0001.0002 (Onda 2-Should (MVP completo)) (cen. 3)
- **BR-1.1.7** — Rota de sucata trava com as exigências da FEATURE-0005.0005 antes da destinação (cen. 4)

## 4. Não funcionais

- As duas rotas são acessíveis sem mouse (atalho/teclado).
- Toda tentativa de transição (inclusive bloqueada) fica registrada na trilha de auditoria.

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techsolutions/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)): **I** ✅ decisão humana autônoma, sem depender de motor (FEATURE-0001.0002 fora da Onda 1-Must (MVP mínimo)) · **N** ✅ escolha de rotas conversada com a Operação · **V** ✅ mantém o fluxo em movimento (R25) · **E** ✅ 4 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 4 cenários testáveis.
