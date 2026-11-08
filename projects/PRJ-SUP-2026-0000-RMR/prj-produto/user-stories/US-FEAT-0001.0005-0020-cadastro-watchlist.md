# 💬 User Story: US-FEAT-0001.0005-0020 — Cadastrar e gerenciar a watchlist

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0001 — Logística Reversa e Triagem](../epicos/EPIC-0001-logistica-reversa-e-triagem.md) ➔ [FEATURE-0001.0005 — Watchlist de triagem](../features/FEATURE-0001.0005-watchlist-triagem.md) ➔ US-FEAT-0001.0005-0020 |
| **Prioridade** | **Should Have** (Onda 2-Should (MVP completo), fora da Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | MVP (Onda 2-Should (MVP completo)) — rolling wave |
| **Estimativa** | 3 pontos |
| **Rastreio** | R19 (cadastro de blacklists — relação de identificadores identificados na triagem) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** responsável pelas listas de atenção (Suprimentos/TI),
- **quero** cadastrar identificadores em blacklist, scrap ou boomerang com motivo,
- **para que** a triagem saiba quais ativos exigem atenção especial.

## 2. Cenários comportamentais de aceite

### Cenário 1: Entrada criada com lista e motivo
- **Dado** o acesso à watchlist,
- **Quando** o responsável cria uma entrada,
- **Então** ele registra o **Identificador Físico do Ativo**, **lista** (`BLACKLIST`/`SCRAP`/`BOOMERANG`), **motivo**, autor e data (R19).

### Cenário 2: Correção/encerramento sem exclusão
- **Dado** uma entrada existente,
- **Quando** o responsável a corrige ou encerra,
- **Então** a ação é feita por **desativação/edição com trilha** — nunca exclusão.

### Cenário 3: Consulta por identificador ou lista
- **Dado** as listas preenchidas,
- **Quando** o responsável consulta por identificador ou lista,
- **Então** vê as entradas ativas e inativas com autor/data/motivo.

## 3. Regras de negócio relacionadas

- **BR-1.5.2** — Entradas da watchlist com trilha; sem exclusão (cens. 1 e 2) — *definição na [FEATURE-0001.0005 §3](../features/FEATURE-0001.0005-watchlist-triagem.md)*

## 4. Não funcionais

- Importação em massa (planilha) é desejável — **[PENDENCY-0023](../../pendencias.md)**: confirmar prioridade com as áreas — dono **Suprimentos/TI + PM/PO** (áreas donas do cadastro), prazo **2026-11-07** (mesmo horizonte das pendências Onda 2-Should (MVP completo) do [hub](../../pendencias.md)).

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ cadastro autônomo · **N** ✅ listas conversadas com Suprimentos/TI (PENDENCY-0001) · **V** ✅ base da validação de triagem (R19) · **E** ✅ 3 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 3 cenários testáveis.
