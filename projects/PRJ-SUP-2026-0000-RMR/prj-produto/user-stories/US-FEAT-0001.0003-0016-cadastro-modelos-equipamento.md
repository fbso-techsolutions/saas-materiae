# 💬 User Story: US-FEAT-0001.0003-0016 — Cadastrar modelos de equipamento

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0001 — Logística Reversa e Triagem](../epicos/EPIC-0001-logistica-reversa-e-triagem.md) ➔ [FEATURE-0001.0003 — Cadastros mestres](../features/FEATURE-0001.0003-cadastros-mestres.md) ➔ US-FEAT-0001.0003-0016 |
| **Prioridade** | **Should Have** (Onda 2-Should (MVP completo), fora da Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | MVP (Onda 2-Should (MVP completo)) — rolling wave |
| **Estimativa** | 4 pontos |
| **Rastreio** | B-REQ-01 · R15 (modelo: código do ERP, descrição, fornecedor, lei de formação dos identificadores e do atributo de importação) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** responsável por Suprimentos/TI,
- **quero** cadastrar os modelos de equipamento com código do ERP, fornecedor, categoria/tipo e a lei de formação dos identificadores físicos e do atributo de importação,
- **para que** o cadastro de ativos seja estruturado e as travas LGPD saibam se o modelo tem mídia.

## 2. Cenários comportamentais de aceite

### Cenário 1: Modelo completo com lei de formação e flag de mídia
- **Dado** o cadastro de modelos,
- **Quando** o responsável cria/edita um modelo,
- **Então** ele registra: **código do ERP corporativo** (genérico — qualquer ERP), descrição, fornecedor, **lei de formação dos identificadores físicos e do atributo de importação** (por tipo/modelo — [catálogo §5.1/§5.2](../../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md); R15), **categoria/tipo** (FK → [taxonomia](../../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md)) e **flag de mídia de armazenamento**.

### Cenário 2: Flag de mídia ativa as travas LGPD
- **Dado** um modelo com **flag de mídia = sim**,
- **Quando** um ativo desse modelo entra na rota de saída,
- **Então** as travas LGPD da **FEATURE-0005.0005** são exigidas — sem depender de configuração extra.

### Cenário 3: Qualquer linha EEE na categoria
- **Dado** a taxonomia de categorias,
- **Quando** o responsável seleciona a categoria/tipo,
- **Então** são oferecidos os tipos de **qualquer linha EEE** (Verde/Marrom/Branca/Azul) — novas linhas entram como seed, sem mudança de estrutura (taxonomia §10).

### Cenário 4: Exclusão bloqueada com ativos vinculados
- **Dado** um modelo com ativos vinculados,
- **Quando** o responsável tenta excluí-lo,
- **Então** a exclusão é **bloqueada** — apenas desativação, preservando os ativos históricos.

## 3. Regras de negócio relacionadas

- **BR-1.3.3** — Campos do modelo, incluindo lei de formação e flag de mídia (cen. 1) — *definição na [FEATURE-0001.0003 §3](../features/FEATURE-0001.0003-cadastros-mestres.md)*
- **BR-1.3.2** — Sem exclusão de itens em uso; só desativação (cen. 4)
- **BR-5.5.3** — Flag de mídia do modelo ativa a trava LGPD (cen. 2)

## 4. Não funcionais

- A **lei de formação dos identificadores e do atributo de importação** é preenchida conforme o documento de regras de negócio — ✅ **[PENDENCY-0012](../../pendencias.md) respondida (2026-10-21)**: [regras-formacao-identificadores](../../../../docs/negocio/regras-formacao-identificadores.md); a ponte modelo → identificadores (`TIPO_IDENTIFICADOR` + `MODELO_IDENTIFICADOR`, com **primário** por modelo) está definida em [taxonomia §5.1.1](../../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md).

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ cadastro autônomo (depende de taxonomia já existente, não de story) · **N** ✅ campos conversados com Suprimentos/TI · **V** ✅ base do cadastro + trava LGPD (R15) · **E** ✅ 4 pontos (lei de formação definida — ver §4) · **S** ✅ cabe numa Sprint · **T** ✅ 4 cenários testáveis.
