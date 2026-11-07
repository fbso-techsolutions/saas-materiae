# 🧱 mer.md — modelo relacional (decisões e restrições)

| Campo | Valor |
|---|---|
| **Papel** — O QUE é | Modelo lógico/físico do PostgreSQL: tabelas, chaves, restrições, seeds e decisões de modelagem. O **diagrama** fica em [erd.md](erd.md) · **campos** em [data-dictionary.md](data-dictionary.md) · **sistemas externos** em [datamapping.md](datamapping.md) |
| **Fonte** | [taxonomia-entidades-cadastro-ativos](../../negocio/taxonomia-entidades-cadastro-ativos.md) (9 entidades de negócio — verdade de negócio, PENDENCY-0002 ✅) · SAD §3 (entidades de plataforma — dissolvido) · ADR-002 · ADR-010 · ADR-003 |
| **Banco** | PostgreSQL 17 + **Flyway** (migrations versionadas no repositório) |
| **Status** | ✅ v1 (2026-10-21) · ✅ nomenclatura canônica decidida (§4 — PENDENCY-0022, 2026-10-30) |

---

## 1. Convenções

1. **`tenant_id` em toda tabela de domínio** (FK → `TENANT`) + **RLS** com `SET LOCAL app.current_tenant` — sem exceções ([ADR-002](adrs/adr-002-rls-multi-tenant.md)). *Lookups* com seeds globais (`STATUS_DESTINO`, `LINHA_EEE`, `FRACAO_MATERIAL`) são resolvidas por `tenant_id` na *view* de acesso; a estrutura é única.
2. **PK `uuid`** (gerada na aplicação) para entidades operacionais; **`int` serial** para *lookups* de seed.
3. **`jsonb` para listas/configuração extensível** — novos tipos de identificador, atributos por categoria, estágios de workflow entram como **dado, não DDL** (princípio da taxonomia §5.1/§5.2).
4. **`timestamptz`** para eventos/auditoria; `date` só para datas de negócio (`data_recebimento`).
5. **Sem cascata de `DELETE`** em tabelas de evento — **append-only** (`STAGE_TRANSITION`, `INTEGRATION_EVENT`, `LABEL_PRINT`): apagado físico não existe; vigência se resolve por coluna.
6. **Migrações idempotentes** (Flyway) + seeds declarados na própria migration — a Onda 1-Must (MVP mínimo) nasce populado (§6).

## 2. Catálogo de tabelas (4 grupos)

| Grupo | Tabelas | Fase Onda 1-Must (MVP mínimo) |
|---|---|---|
| **A · Tenancy & config** | `TENANT` · `WORKFLOW_DEF` | ✅ uso |
| **B · Cadastro & catálogo** (négócio) | `STATUS_DESTINO` · `LINHA_EEE` · `CATEGORIA_ATIVO` · `MODELO` · `ATIVO` · `KIT` · `KIT_ITEM` · `FRACAO_MATERIAL` · `FRACAO_RETIRADA` + `TIPO_IDENTIFICADOR` · `MODELO_IDENTIFICADOR` | ✅ as 9 (seeds); 🔵 `TIPO/MODELO_IDENTIFICADOR` = DDL em Onda 2-Should (MVP completo) (rolling wave FEATURE-0001.0003) |
| **C · Operação & workflow** | `STAGE_TRANSITION` · `WORK_ORDER` · `EVIDENCIA` · `LABEL_PRINT` · `WATCHLIST` (+ `MATERIAL_SERIALIZADO`, ver §4) | ✅ uso |
| **D · Integração & massa** | `INTEGRATION_EVENT` (Outbox/Inbox) · `APONTAMENTO_NAO_SERIALIZADO` | ✅ uso |

> **Total:** 20 tabelas na Onda 1-Must (MVP mínimo) (11 de negócio/compostas + 9 de plataforma) — [erd.md](erd.md) tem os diagramas.

## 3. Restrições e índices que carregam regra de negócio

| Restrição | Tabela | Regra de origem |
|---|---|---|
| **Índice único parcial**: 1 kit `ATIVO` por `ativo_id` por vez | `KIT_ITEM` | [taxonomia §5.3](../../negocio/taxonomia-entidades-cadastro-ativos.md) regra 2 |
| **`identificador_unico` obrigatório + indexado** | `ATIVO` | BR-1.1.1/BR-1.1.2 — leitura por leitor. **Unicidade** é validada na leitura/importação (cross-validações do [regras-formacao-identificadores](../../negocio/regras-formacao-identificadores.md)), não por `UNIQUE` global |
| **Exatamente 1 `primario` por modelo** (checagem de app + constraint) | `MODELO_IDENTIFICADOR` | [taxonomia §5.1.1](../../negocio/taxonomia-entidades-cadastro-ativos.md) regra 2 |
| **`linha_id` derivada da categoria** (gravada, não calculada) | `ATIVO` | Relatórios/conformidade por linha (taxonomia §5) |
| **`idempotency_key` única por direção+sistema** | `INTEGRATION_EVENT` | BR-1.4.7 (devolutiva idempotente) · R39–R46 |
| **Estágios/transições = JSONB validado na borda** | `WORKFLOW_DEF` | [ADR-003](adrs/adr-003-workflow-configuravel.md) — Onda 1-Must (MVP mínimo) com fluxo fixo **em seed**, representação configurável |
| **Evidência = metadado no PG, binário no object storage** | `EVIDENCIA.storage_uri` | [ADR-007](adrs/adr-007-evidencia-configuravel.md) |

## 4. ✅ Decidido (2026-10-30) — nomenclatura `MODELO`/`ATIVO` canônica ([PENDENCY-0022](../../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md))

O SAD v0.1 (origem técnica) modelou `MATERIAL` (SKU) + `MATERIAL_SERIALIZADO` (unidade) — [ADR-010](adrs/adr-010-dois-niveis-dado.md). A [taxonomia](../../negocio/taxonomia-entidades-cadastro-ativos.md) (PENDENCY-0002, mais recente) modelou `MODELO` + `ATIVO` com mais campos de negócio. **Correspondência decidida (2026-10-30):**

| Técnico (SAD/ADR-010) | Negócio (taxonomia) | Observação |
|---|---|---|
| `MATERIAL` (SKU) | `MODELO` | `codigo` ≈ `nome`+`fabricante`; `regra_formacao` vive em `TIPO_IDENTIFICADOR`/`MODELO_IDENTIFICADOR` (Onda 2-Should (MVP completo)) |
| `MATERIAL_SERIALIZADO` (unidade) | `ATIVO` | `tracking_code` ≈ `identificador_unico` · `external_ids` ≈ `atributos` (§5.2) · `estagio_atual`/`status` = campo de workflow **ausente na taxonomia** e `status_destino_id` **ausente no SAD** — os dois campos coexistem |
| `APONTAMENTO_NAO_SERIALIZADO` | — | Insumos a granel (uom) — sem correspondente na taxonomia; mantida |

**Decisão (2026-10-30):** adotar os nomes da **taxonomia** (`MODELO`/`ATIVO`) como canônicos no DDL da Onda 1-Must (MVP mínimo), acrescentando a `ATIVO` as colunas de workflow (`estagio_atual`, `status`) do SAD, e tratar `MATERIAL`/`MATERIAL_SERIALIZADO` como **aliases**. **⚠️ Não implementar migração dupla** — o DDL da FEATURE-0001.0001 nasce de uma decisão só.

## 5. Relacionamentos de domínio (resumo)

- 1 `MODELO` → N `ATIVO` · 1 `ATIVO` → N `STAGE_TRANSITION`/`EVIDENCIA`/`WORK_ORDER` · 1 `ATIVO` → 0..N `KIT_ITEM` (≤1 kit ativo).
- 1 `ATIVO` → N `FRACAO_RETIRADA` (pós-desmontagem, Onda 2-Should (MVP completo)) — `lote_id` cobre o caso de desmontagem por lote.
- `CATEGORIA_ATIVO` autorelação (categoria → tipo) + FK `LINHA_EEE`.
- `WORKFLOW_DEF` é 1:N com `STAGE_TRANSITION` (transições validadas pelo motor — [ADR-003](adrs/adr-003-workflow-configuravel.md)).

## 6. Seeds da Onda 1-Must (MVP mínimo) (Flyway `V*__seed.sql`)

| Seed | Conteúdo |
|---|---|
| `LINHA_EEE` | 4 linhas (uso = Verde) |
| `CATEGORIA_ATIVO` | Linha Verde completa (1 + 10) + demais linhas `ativa=false` |
| `STATUS_DESTINO` | 3 destinos (uso = Manutenção + Reciclagem) |
| `FRACAO_MATERIAL` | 4 grupos (PCI/METAL/POLIMERO/PERIGOSO) — tabela pronta, sem uso |
| `MODELO` | 1 modelo (fatiamento [escopo da Onda 1-Must (MVP mínimo)](../../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/escopo-onda-1.md)) com flag de mídia |
| `TENANT` + `WORKFLOW_DEF` | 1 tenant + workflow **fixo da Onda 1-Must (MVP mínimo)** em JSONB |
| `TIPO_IDENTIFICADOR` | 🔵 Onda 2-Should (MVP completo) (rolling wave FEATURE-0001.0003) |

## 7. Lacunas e próximos passos 🟢🟡🔴

- 🟢 **Taxonomia fechada** (PENDENCY-0002 ✅ + PENDENCY-0012 ✅) — 9 entidades com campos, FKs e DoD.
- ✅ **§4 acima** — nomenclatura canônica decidida: `MODELO`/`ATIVO` (taxonomia) — **PENDENCY-0022** (2026-10-30).
- 🟡 **`EVENTO_RECEBIMENTO`** (defeito reclamado) e evento de reparo (defeito constatado) vivem em `WORK_ORDER`/transição — se virarem tabela própria, modelar com o rolling wave (taxonomia §5 nota ⚠️).
- 🟡 **Balança integrada** (PENDENCY-0011) — `FRACAO_RETIRADA.peso_kg` já existe; integração futura não muda estrutura.
- 🔴 **`pendencia`:** MTR/CDF — MTR é **número manual** na Onda 1-Must (MVP mínimo); CDF (PENDENCY-0010) exigirá tabela própria quando decidida.
- **Próximo:** DDL real nas FEATURES (Flyway) + [data-dictionary.md](data-dictionary.md) acompanhando cada migration.
