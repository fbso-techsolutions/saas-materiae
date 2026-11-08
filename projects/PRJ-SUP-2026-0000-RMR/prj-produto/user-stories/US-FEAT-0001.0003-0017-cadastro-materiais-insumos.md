# 💬 User Story: US-FEAT-0001.0003-0017 — Cadastrar materiais e insumos

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0001 — Logística Reversa e Triagem](../epicos/EPIC-0001-logistica-reversa-e-triagem.md) ➔ [FEATURE-0001.0003 — Cadastros mestres](../features/FEATURE-0001.0003-cadastros-mestres.md) ➔ US-FEAT-0001.0003-0017 |
| **Prioridade** | **Should Have** (Onda 2-Should (MVP completo), fora da Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | MVP (Onda 2-Should (MVP completo)) — rolling wave |
| **Estimativa** | 3 pontos |
| **Rastreio** | B-REQ-01 (apoio) · R16 (materiais e insumos: código do ERP e descrição) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** responsável pelos cadastros,
- **quero** cadastrar os materiais e insumos (código do ERP + descrição),
- **para que** a OS registre os componentes substituídos de forma padronizada.

## 2. Cenários comportamentais de aceite

### Cenário 1: Material cadastrado com código ERP + descrição
- **Dado** o cadastro de materiais,
- **Quando** o responsável cria/edita/desativa um item,
- **Então** ele registra **código do ERP corporativo** (genérico — qualquer ERP) + **descrição** (ex.: cabo HDMI, fonte, antena — R16), com auditoria.

### Cenário 2: Componentes substituídos selecionados na OS
- **Dado** materiais cadastrados,
- **Quando** o técnico preenche a OS ([US-FEAT-0002.0001-0006](US-FEAT-0002.0001-0006-reparo-os.md)),
- **Então** os **componentes substituídos** são selecionados dessa lista.

### Cenário 3: Exclusão bloqueada — só desativação
- **Dado** um material já usado em OS,
- **Quando** o responsável tenta excluí-lo,
- **Então** a exclusão é **bloqueada** — só desativação, preservando o histórico.

## 3. Regras de negócio relacionadas

- **BR-1.3.5** — Materiais/insumos disponíveis para seleção de componentes na OS (cen. 2) — *definição na [FEATURE-0001.0003 §3](../features/FEATURE-0001.0003-cadastros-mestres.md)*
- **BR-1.3.2** — Sem exclusão de itens em uso; só desativação (cen. 3)

## 4. Não funcionais

- A lista é insumo futura de consumo/estoque (FEATURE-0002.0004 dashboards, FEATURE-0005.0002 estoques) — estrutura desde já.

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)): **I** ✅ cadastro autônomo · **N** ✅ campos mínimos conversados (R16) · **V** ✅ OS padronizada e insumo de estoques · **E** ✅ 3 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 3 cenários testáveis.
