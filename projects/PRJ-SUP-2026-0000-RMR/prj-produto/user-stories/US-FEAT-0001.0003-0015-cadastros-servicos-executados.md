# 💬 User Story: US-FEAT-0001.0003-0015 — Cadastrar serviços executados (reparo, HDD, reciclagem, sem conserto)

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0001 — Logística Reversa e Triagem](../epicos/EPIC-0001-logistica-reversa-e-triagem.md) ➔ [FEATURE-0001.0003 — Cadastros mestres](../features/FEATURE-0001.0003-cadastros-mestres.md) ➔ US-FEAT-0001.0003-0015 |
| **Prioridade** | **Should Have** (Onda 2-Should (MVP completo), fora da Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | MVP (Onda 2-Should (MVP completo)) — rolling wave |
| **Estimativa** | 4 pontos |
| **Rastreio** | B-REQ-01 (apoio) · R10 (serviço executado), R11 (sem conserto/sucata), R12 (serviço no HDD), R13 (serviços de reciclagem estética) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** responsável pelos cadastros,
- **quero** cadastrar os tipos de serviço — reparo, serviço em HDD, reciclagem estética e "sem conserto",
- **para que** a OS e as etapas finais referenciem serviços padronizados e rastreáveis.

## 2. Cenários comportamentais de aceite

### Cenário 1: Serviço classificado por tipo
- **Dado** o cadastro de serviços,
- **Quando** o responsável cria/edita/desativa um serviço,
- **Então** ele é classificado por **tipo**: `REPARO` (R10), `HDD` (R12), `RECICLAGEM` (R13) ou `SEM_CONCERTO` (R11), com descrição obrigatória e auditoria.

### Cenário 2: `SEM_CONCERTO` disponível na OS com rota para sucata
- **Dado** um serviço do tipo `SEM_CONCERTO` cadastrado,
- **Quando** o técnico encerra a OS marcando sem conserto ([US-FEAT-0002.0001-0006](US-FEAT-0002.0001-0006-reparo-os.md)),
- **Então** ele aparece como opção válida e o item segue para **sucata** com as travas FEATURE-0005.0005.

### Cenário 3: `HDD` e `RECICLAGEM` disponíveis nas etapas
- **Dado** serviços dos tipos `HDD` e `RECICLAGEM` cadastrados,
- **Quando** as etapas de reciclagem ([US-FEAT-0002.0001-0007](US-FEAT-0002.0001-0007-reciclagem.md)) e destruição de dados ([US-FEAT-0005.0005-0011](US-FEAT-0005.0005-0011-destruicao-dados-midia.md)) consultam o cadastro,
- **Então** os serviços aparecem para seleção.

### Cenário 4: Sem campo de nível/fornecedor (R18 fora do escopo)
- **Dado** que R18 (níveis por fornecedor) está fora do escopo,
- **Quando** o cadastro é apresentado,
- **Então** **não há** campo de nível/fornecedor — pendência [PENDENCY-0003](../../pendencias.md).

## 3. Regras de negócio relacionadas

- **BR-1.3.6** — Cadastro sem níveis por fornecedor no escopo atual (cen. 4) — *definição na [FEATURE-0001.0003 §3](../features/FEATURE-0001.0003-cadastros-mestres.md)*
- **BR-2.1.5** — Rota sem conserto → sucata com travas FEATURE-0005.0005 (cen. 2)

## 4. Não funcionais

- Desativação sem perda de histórico (BR-1.3.2).

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ cadastro autônomo · **N** ✅ tipos de serviço mapeados com a oficina · **V** ✅ serviços rastreáveis na OS e nas etapas (R10–R13) · **E** ✅ 4 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 4 cenários testáveis.
