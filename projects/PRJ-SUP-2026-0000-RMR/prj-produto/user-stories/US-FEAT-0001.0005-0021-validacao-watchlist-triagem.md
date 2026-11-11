# 💬 User Story: US-FEAT-0001.0005-0021 — Validar o identificador físico na triagem contra a watchlist

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0001 — Logística Reversa e Triagem](../epicos/EPIC-0001-logistica-reversa-e-triagem.md) ➔ [FEATURE-0001.0005 — Watchlist de triagem](../features/FEATURE-0001.0005-watchlist-triagem.md) ➔ US-FEAT-0001.0005-0021 |
| **Prioridade** | **Should Have** (Onda 2-Should (MVP completo), fora da Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | MVP (Onda 2-Should (MVP completo)) — rolling wave |
| **Estimativa** | 5 pontos |
| **Rastreio** | R23 (validar o identificador — NDS/IMEI no pedido — em black list, scrap ou boomerang na triagem) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techsolutions/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** operador de triagem,
- **quero** que o sistema consulte o identificador lido na watchlist antes de concluir o recebimento,
- **para que** itens bloqueados não entrem, recusas sejam conscientes e reincidências apareçam.

## 2. Cenários comportamentais de aceite

### Cenário 1: Match em BLACKLIST → bloqueio auditado
- **Dado** o identificador lido no recebimento ([US-FEAT-0001.0001-0001](US-FEAT-0001.0001-0001-registro-recebimento-ativo.md)),
- **Quando** há match em `BLACKLIST`,
- **Então** o recebimento é **bloqueado** com exibição do motivo e a tentativa fica **auditada**.

### Cenário 2: Match em SCRAP → alerta com decisão consciente
- **Dado** match em `SCRAP`,
- **Quando** o alerta aparece,
- **Então** o operador **confirma a recusa** ou **prossegue** — em ambos os casos com registro de decisão humana.

### Cenário 3: Match em BOOMERANG → alerta com contagem de retornos
- **Dado** match em `BOOMERANG`,
- **Quando** o alerta aparece,
- **Então** ele exibe a **contagem de retornos do identificador na janela móvel de dias corridos** — duas **checagens independentes exibidas juntas**: **≥ 2 retornos em 30 dias corridos** e **≥ 4 em 90 dias corridos** (cada uma aparece no alerta quando atendida; **nenhuma delas bloqueia** — o bloqueio é só da `BLACKLIST` — [PENDENCY-0013](../../pendencias.md) ✅ 2026-10-21), e o operador registra a ação.

### Cenário 4: Auditoria completa de qualquer match
- **Dado** qualquer match (bloqueio, recusa ou alerta),
- **Quando** a auditoria é consultada,
- **Então** constam ator, data/hora, identificador, lista e ação tomada.

### Cenário 5: Checagem independente do cadastro mestre
- **Dado** que a checagem do **cadastro mestre (FEATURE-0001.0004)** é independente,
- **Quando** as duas estão ativas,
- **Então** as duas checagens rodam no mesmo recebimento — uma não substitui a outra.

## 3. Regras de negócio relacionadas

- **BR-1.5.3** — Validação na leitura do identificador, antes de concluir (cens. 1–3) — *definição na [FEATURE-0001.0005 §3](../features/FEATURE-0001.0005-watchlist-triagem.md)*
- **BR-1.5.4** — Bloqueio (BLACKLIST) e decisão humana (SCRAP) (cens. 1 e 2)
- **BR-1.5.5** — BOOMERANG com contagem de retornos no período (cen. 3)
- **BR-1.5.6** — Auditoria de todos os matches (cen. 4)
- **BR-1.5.7** — Complementaridade com a checagem do cadastro mestre (cen. 5)

## 4. Não funcionais

- Checagem em **tempo real** (lookup local — sem dependência externa), sem segurar a operação do chão de fábrica.

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techsolutions/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)): **I** ✅ roda sobre a leitura existente; independente da FEATURE-0001.0004 (cen. 5) · **N** ✅ parâmetro do boomerang definido (ver cen. 3) · **V** ✅ MVP Core do [BRAINSTORM §4.2](../discovery/BRAINSTORM.md) (PENDENCY-0001) · **E** ✅ 5 pontos (parâmetros definidos — sem bloqueio à estimativa) · **S** ✅ cabe numa Sprint · **T** ✅ 5 cenários testáveis.
