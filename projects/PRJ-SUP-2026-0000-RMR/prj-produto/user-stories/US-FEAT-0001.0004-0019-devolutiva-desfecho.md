# 💬 User Story: US-FEAT-0001.0004-0019 — Comunicar a devolutiva de desfecho ao cadastro mestre

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0001 — Logística Reversa e Triagem](../epicos/EPIC-0001-logistica-reversa-e-triagem.md) ➔ [FEATURE-0001.0004 — Validação no cadastro mestre](../features/FEATURE-0001.0004-validacao-identificador-cadastro-mestre.md) ➔ US-FEAT-0001.0004-0019 |
| **Prioridade** | **Should Have** (Onda 2-Should (MVP completo), fora da Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | MVP (Onda 2-Should (MVP completo)) — rolling wave |
| **Estimativa** | 4 pontos |
| **Rastreio** | R48 (cadastro mestre: informar os identificadores que retornam do campo, sucateados e expedidos) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** responsável pelo inventário corporativo,
- **quero** que o RMR devolva ao cadastro mestre o desfecho de cada ativo (retorno de campo, sucata, expedição),
- **para que** o cadastro mestre acompanhe o ciclo de vida do ativo sem retrabalho manual.

## 2. Cenários comportamentais de aceite

### Cenário 1: Devolutiva "retorno de campo"
- **Dado** um item **retornando do campo** (novo recebimento de identificador já conhecido — [US-FEAT-0001.0001-0001](US-FEAT-0001.0001-0001-registro-recebimento-ativo.md)),
- **Quando** o recebimento é confirmado,
- **Então** a devolutiva **"retorno de campo"** é enviada ao cadastro mestre (R48).

### Cenário 2: Devolutiva "sucateado"
- **Dado** um item cuja **destinação/sucata foi concluída** (travas FEATURE-0005.0005 — [US-FEAT-0005.0005-0011](US-FEAT-0005.0005-0011-destruicao-dados-midia.md)/[US-FEAT-0005.0005-0012](US-FEAT-0005.0005-0012-compliance-ambiental-destino.md)),
- **Quando** a conclusão acontece,
- **Então** a devolutiva **"sucateado"** é enviada.

### Cenário 3: Devolutiva "expedido"
- **Dado** um item **expedido** (pallet + NF — [US-FEAT-0002.0005-0010](US-FEAT-0002.0005-0010-expedicao.md)),
- **Quando** a expedição é confirmada,
- **Então** a devolutiva **"expedido"** é enviada.

### Cenário 4: Falha de envio → reenvio automático auditado
- **Dado** uma devolutiva com **falha de envio** (cadastro mestre fora do ar),
- **Quando** o sistema processa a fila,
- **Então** o reenvio é automático (limite de tentativas, BR-1.4.8), a falha fica **auditada** e o fluxo local **não é bloqueado**; esgotadas as tentativas, dispara **alerta** e a devolutiva fica **pendente**.

## 3. Regras de negócio relacionadas

- **BR-1.4.3** — Devolutiva disparada nos 3 desfechos (cens. 1, 2 e 3) — *definição na [FEATURE-0001.0004 §3](../features/FEATURE-0001.0004-validacao-identificador-cadastro-mestre.md)*
- **BR-1.4.5** — Falha de envio auditada: ator, data/hora, identificador, resultado (cen. 4)
- **BR-1.4.7** — Reenvio (fila/retry) idempotente — não duplica o registro no cadastro mestre (cen. 4)
- **BR-1.4.8**: fila de reenvio com limite de tentativas e alerta ao esgotar (cen. 4). *Definição na [FEATURE-0001.0004 §3](../features/FEATURE-0001.0004-validacao-identificador-cadastro-mestre.md)*

## 4. Não funcionais

- Devolutivas são **idempotentes** (reenvio não duplica registro no cadastro mestre) — **definição de negócio confirmada** em 2026-10-21 ([PENDENCY-0014](../../pendencias.md) ✅ — BR-1.4.7); a implementação (fila/idempotência) compõe **TASK técnica** no backlog técnico.

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)): **I** ✅ acoplada a eventos já existentes, sem stories novas pré-requisito · **N** ✅ idempotência confirmada como regra de negócio (BR-1.4.7 — ver §4) · **V** ✅ fim do retrabalho manual do inventário (R48) · **E** ✅ 4 pontos (sem bloqueio de estimativa) · **S** ✅ cabe numa Sprint · **T** ✅ 4 cenários testáveis.
