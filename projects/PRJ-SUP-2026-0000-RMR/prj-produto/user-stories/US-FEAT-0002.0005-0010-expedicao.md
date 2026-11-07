# 💬 User Story: US-FEAT-0002.0005-0010 — Compor o pallet e expedir os itens

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0002 — Oficina de Manutenção (Workflow)](../epicos/EPIC-0002-oficina-de-manutencao-workflow.md) ➔ [FEATURE-0002.0005 — Expedição (pallet + NF)](../features/FEATURE-0002.0005-expedicao.md) *(migrou da FEATURE-0002.0001 — decisão [PENDENCY-0004](../../pendencias.md))* ➔ US-FEAT-0002.0005-0010 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 4 pontos |
| **Rastreio** | Workflow · R36 (pallet por leitura), R37 (NF de saída e data) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** operador de expedição,
- **quero** abrir um pallet, adicionar os itens lendo seus identificadores e registrar a nota fiscal de saída,
- **para que** a expedição seja conferida item a item e fique rastreada até a saída.

## 2. Cenários comportamentais de aceite

### Cenário 1: Pallet montado por leitura
- **Dado** itens em **EMBALAGEM** prontos para sair,
- **Quando** o operador abre um novo **pallet** e lê os identificadores (R36),
- **Então** os itens são adicionados ao pallet e a lista mostra todos os identificadores que o compõem.

### Cenário 2: Expedição em lote com NF de saída
- **Dado** um pallet montado,
- **Quando** o operador informa a **NF de saída** e a data (R37),
- **Então** **todos** os itens do pallet transitem para **EXPEDIDO** com transição auditada.

### Cenário 3: Item só sai uma vez
- **Dado** um item **já expedido** ou pertencente a **outro pallet/processo ativo**,
- **Quando** o operador tenta lê-lo,
- **Então** a leitura é **bloqueada** informando o motivo — um item só sai uma vez (*regra **confirmada** com as áreas em 2026-10-16 — [checklist C2](../backlog/checklist-operacao-po-onda-1.md)*).

### Cenário 4: Conclusão bloqueada sem NF
- **Dado** o pallet sem NF informada,
- **Quando** o operador tenta concluir a expedição,
- **Então** a conclusão é **bloqueada** — NF é obrigatória.

## 3. Regras de negócio relacionadas

- **BR-2.5.1** — Pallet composto por leitura de identificadores (cen. 1) — *definição na [FEATURE-0002.0005 §3](../features/FEATURE-0002.0005-expedicao.md)*
- **BR-2.5.2** — NF obrigatória; transição em lote auditada (cens. 2 e 4)
- **BR-2.5.3** — Item só sai uma vez — só em um pallet/processo ativo (cen. 3)
- **BR-2.5.4** — Operação por leitor + teclado, sem mouse (leitura em lote) (cens. 1, 3 e 4)
- **BR-2.5.5** — Toda tentativa bloqueada fica na trilha de auditoria (cens. 3 e 4)

## 4. Não funcionais

- Leitura em lote por leitor de código (bipando item a item — R36), sem mouse.
- A composição do pallet é a base da reconciliação de expedição (evolução futura — ver [integrations hub §1](../../../../docs/tecnico/arquitetura/integracoes/integrations.md) (item 4)).
- A **devolutiva "expedido"** ao cadastro mestre (R48) é regra da [US-FEAT-0001.0004-0019](US-FEAT-0001.0004-0019-devolutiva-desfecho.md) / [FEATURE-0001.0004](../features/FEATURE-0001.0004-validacao-identificador-cadastro-mestre.md), **Onda 2-Should (MVP completo) e fora da Onda 1-Must (MVP mínimo)**. No Onda 1-Must (MVP mínimo), a expedição conclui registrando e auditando a transição para EXPEDIDO; a devolutiva é continuação Onda 2-Should (MVP completo) e entra no ar com a FEATURE-0001.0004, sem bloquear esta story.

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ extraída da FEATURE-0002.0001 justamente para ser planejável isolada (PENDENCY-0004) · **N** ✅ regras de pallet/NF conversadas (checklist B1/C2) · **V** ✅ expedição conferida e rastreada (R36/R37) · **E** ✅ 4 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 4 cenários testáveis.
