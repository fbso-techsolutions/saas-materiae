# 💬 User Story: US-FEAT-0001.0003-0014 — Cadastrar defeitos, locais e causas raiz

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0001 — Logística Reversa e Triagem](../epicos/EPIC-0001-logistica-reversa-e-triagem.md) ➔ [FEATURE-0001.0003 — Cadastros mestres](../features/FEATURE-0001.0003-cadastros-mestres.md) ➔ US-FEAT-0001.0003-0014 |
| **Prioridade** | **Should Have** (Onda 2-Should (MVP completo), fora da Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | MVP (Onda 2-Should (MVP completo)) — rolling wave |
| **Estimativa** | 3 pontos |
| **Rastreio** | B-REQ-01 (apoio) · R6 (defeito reclamado), R7 (defeito constatado), R8 (local danificado), R9 (causa raiz) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** responsável pelos cadastros (Suprimentos/TI),
- **quero** cadastrar e gerenciar defeitos (reclamados e constatados), locais danificados e causas raiz,
- **para que** as telas operacionais usem listas padronizadas e o histórico seja consistente.

## 2. Cenários comportamentais de aceite

### Cenário 1: Gestão das 4 listas com auditoria
- **Dado** o acesso ao cadastro,
- **Quando** o responsável cria/edita/desativa itens nas **4 listas** (reclamado R6, constatado R7, local R8, causa raiz R9),
- **Então** a descrição é obrigatória e a alteração fica auditada (autor/data).

### Cenário 2: Exclusão bloqueada — só desativação
- **Dado** um item já utilizado em recebimento/OS,
- **Quando** o responsável tenta excluí-lo,
- **Então** a exclusão é **bloqueada** — só **desativação** é permitida, e o item some das escolhas novas preservando o histórico.

### Cenário 3: Efeito imediato nas telas operacionais
- **Dado** um item cadastrado/desativado,
- **Quando** o operador abre as telas de recebimento ([US-FEAT-0001.0001-0002](US-FEAT-0001.0001-0002-defeito-reclamado-recebimento.md)), teste inicial ([US-FEAT-0002.0001-0005](US-FEAT-0002.0001-0005-teste-inicial.md)) ou OS ([US-FEAT-0002.0001-0006](US-FEAT-0002.0001-0006-reparo-os.md)),
- **Então** as listas refletem imediatamente o estado atual (ativo × desativado).

## 3. Regras de negócio relacionadas

- **BR-1.3.2** — Sem exclusão de itens em uso; só desativação preservando histórico (cen. 2) — *definição na [FEATURE-0001.0003 §3](../features/FEATURE-0001.0003-cadastros-mestres.md)*

## 4. Não funcionais

- Cadastro simples (planilha-like), operável sem mouse.

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ cadastro autônomo, sem dependências de entrega · **N** ✅ listas conversadas com Suprimentos/TI · **V** ✅ padroniza o histórico (R6–R9) · **E** ✅ 3 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 3 cenários testáveis.
