# 📖 data-dictionary — dicionário de dados

| Campo | Valor |
|---|---|
| **Papel** — O QUE é cada coluna | Dicionário campo a campo das tabelas **core** + contratos `jsonb`. **Regra de negócio** (significado, seeds, seeds) vive na [taxonomia](../../negocio/taxonomia-entidades-cadastro-ativos.md) — aqui ficam **tipo, nullability, origem e vínculo técnico** |
| **Fonte** | [mer.md](mer.md) (modelo/restrições) · [erd.md](erd.md) (diagramas) · SAD §3 (plataforma) · ADR-002/003/004/007 |
| **Tipos** | PostgreSQL 17 · `uuid` (app) · `int` serial (*lookups*) · `jsonb` · `timestamptz` · `numeric(12,3)` |
| **Status** | ✅ v1 (2026-10-21) — acompanha o DDL Flyway: **migration muda coluna ⇒ atualizar aqui no mesmo PR** |

> `tenant_id` (FK → `TENANT`, `not null`) existe em **todas** as tabelas de domínio (RLS — ADR-002) e é omitido abaixo.

## 1. `ATIVO` — registro individual (core)

| Coluna | Tipo | Null | Origem / vínculo |
|---|---|---|---|
| `id` | `uuid` PK | ✗ | gerada na app |
| `identificador_unico` | `text` | ✗ | **chave de rastreio** — leitura por leitor (BR-1.1.1/1.1.2); indexado; formato validado pela lei de formação por modelo ([regras](../../negocio/regras-formacao-identificadores.md)) |
| `atributos` | `jsonb` | ✓ | atributos **não identificadores** — §3.1 |
| `categoria_id` | `int` FK → `CATEGORIA_ATIVO` | ✗ | nível 2 (tipo) |
| `modelo_id` | `int` FK → `MODELO` | ✗ | 1 modelo → N ativos |
| `linha_id` | `int` FK → `LINHA_EEE` | ✗ | **derivada da categoria** (gravada p/ conformidade) |
| `status_destino_id` | `int` FK → `STATUS_DESTINO` | ✗ | decisão da triagem (eixo 1) |
| `estagio_atual` | `text` | ✗ | **workflow** — coluna do SAD §3 a incorporar (ver [mer.md §4](mer.md)) |
| `data_recebimento` | `date` | ✗ | recebimento |
| `created_by` | `uuid` | ✗ | operador autenticado (identity) |

> ⚠️ **Defeito reclamado NÃO mora aqui** — fica no evento de recebimento; defeito constatado/OS em `WORK_ORDER` (taxonomia §5 nota).

## 2. `MODELO` — SKU/cadastro de modelos (core)

| Coluna | Tipo | Null | Origem / vínculo |
|---|---|---|---|
| `id` | `int` PK serial | ✗ | lookup cadastro |
| `categoria_id` | `int` FK → `CATEGORIA_ATIVO` | ✗ | tipo (nível 2) |
| `nome` · `fabricante` | `text` | ✗ / ✓ | cadastro (Suprimentos/TI) |
| `possui_midia_armazenamento` | `boolean` | ✗ default `false` | **base da BR-5.5.3** — travas FEATURE-0005.0005; flag por modelo (checklist jurídico A4) |
| `caracteristicas` | `jsonb` | ✓ | peso nominal, dimensões… (lista por modelo) |
| `ativo` | `boolean` | ✗ | soft-disable (sem `DELETE`) |

## 3. `CATEGORIA_ATIVO` · `TIPO/MODELO_IDENTIFICADOR`

**`CATEGORIA_ATIVO`:** `id` (PK) · `codigo` · `nome` · `categoria_pai_id` (FK autorelação — categoria↔tipo) · `linha_id` (FK → `LINHA_EEE`) · `nivel` (`1`=categoria, `2`=tipo) · `caracteristicas` (`jsonb` — **catálogo de atributos aplicáveis ao tipo**) · `ativa` · `ordem`.

**`TIPO_IDENTIFICADOR`** (Onda 2-Should (MVP completo) — rolling wave FEATURE-0001.0003):

| Coluna | Tipo | Null | Vínculo |
|---|---|---|---|
| `codigo` | `text` | ✗ | seed do catálogo (taxonomia §5.1): `SERIAL, SMART_CARD, SCID, CAID, CAS, GPON_SN, SAT_KIT_SN, IMEI, ICCID, IMSI` |
| `regex` · `tamanho_min` · `tamanho_max` | `text`/`int` | ✓/✗/✗ | lei de formação genérica |
| `higienizacao` | `jsonb` | ✓ | pré-validações (caixa alta, limpeza de rótulo) — [regras](../../negocio/regras-formacao-identificadores.md) |
| `cross_validations` | `jsonb` | ✓ | exigências por tipo (ex.: `GPON_SN` exige `MAC_ADDRESS`; IMEI × Luhn) |
| `ativa` | `boolean` | ✗ | extensível por seed — sem mudança de estrutura |

**`MODELO_IDENTIFICADOR`:** `modelo_id` (FK) · `tipo_identificador_id` (FK) · `obrigatorio` (bool) · **`primario`** (bool — **exatamente 1 por modelo**) · `regex_override` (text?, **modelo vence genérico** — PENDENCY-0012 item 3).

## 4. Operação — `STAGE_TRANSITION` · `WORK_ORDER` · `EVIDENCIA`

| Tabela/coluna | Tipo | Null | Vínculo |
|---|---|---|---|
| `STAGE_TRANSITION.de_estagio` · `para_estagio` | `text` | ✗ | valores do `WORKFLOW_DEF.estagios` (Onda 1-Must (MVP mínimo) = seed fixo) |
| `STAGE_TRANSITION.ator_id` | `uuid` | ✗ | usuário do evento (RBAC por transição — ADR-003) |
| `STAGE_TRANSITION.ocorrido_em` | `timestamptz` | ✗ | **append-only** — auditoria imutável (base dos dashboards) |
| `STAGE_TRANSITION.local` | `text` | ✓ | posto/filial (quando aplicável) |
| `WORK_ORDER.defeito_id/causa_raiz_id/servico_id` | `uuid` FKs | ✗/✓ | catálogos R6–R16; defeito **constatado** |
| `WORK_ORDER.inicio/fim` | `timestamptz` | ✗/✓ | tempo de OS (R29) |
| `EVIDENCIA.storage_uri` | `text` | ✗ | **URL do object storage** — binário fora do PG (ADR-007); entrega por URL assinada |
| `EVIDENCIA.status_validacao` | `text` | ✗ | `pendente\|ok\|divergente` (OCR opcional — feature flag por tenant) |
| `LABEL_PRINT.tipo` | `text` | ✗ | `triagem\|final` — impressão única (R58); reimpressão justificada |
| `WATCHLIST.tipo` | `text` | ✗ | `blacklist\|scrap\|boomerang` (R19/R23) |

## 5. Integração — `INTEGRATION_EVENT` (Outbox/Inbox)

| Coluna | Tipo | Null | Vínculo |
|---|---|---|---|
| `direcao` | `text` | ✗ | `out` = Outbox · `in` = Inbox ([ADR-004](adrs/adr-004-acl-outbox.md)) |
| `sistema` | `text` | ✗ | `mestre\|materiais\|wms\|hub\|parceiro` (5 integrações — [inventory](../inventory.md) §3) |
| `status` | `text` | ✗ | `pendente\|enviado\|falha` — falha entra em retry/DLQ |
| `idempotency_key` | `text` | ✗ | **única por (direção, sistema, chave)** — BR-1.4.7 · R39–R46 |
| `payload` | `jsonb` | ✓ | corpo trafegado (auditoria/replay) — sem PII além do necessário |

## 6. Contratos `jsonb`

| JSON | Caminho | Formato |
|---|---|---|
| **Atributos do ativo** | `ATIVO.atributos` | `{ "cor": ..., "marca": ..., "fabricante": ..., "tecnologia": ..., "nds": "AB123456" }` — chaves do `caracteristicas` da categoria; **NDS ≤32 chars, opcional** ([regras §6](../../negocio/regras-formacao-identificadores.md)) — [taxonomia §5.2](../../negocio/taxonomia-entidades-cadastro-ativos.md) |
| **Workflow (estágios)** | `WORKFLOW_DEF.estagios` | `[ { "id": "...", "nome": "...", "perfis": ["OPERACAO"], "campos": [...] } ]` — Onda 1-Must (MVP mínimo) = seed fixo ([ADR-003](adrs/adr-003-workflow-configuravel.md)) |
| **Workflow (transições)** | `WORKFLOW_DEF.transicoes` | `[ { "de": "...", "para": "...", "evento": "...", "pre": ["pre-condição"] } ]` |
| **Config do tenant** | `TENANT.config` | `{ "aliases": {...}, "politica_evidencia": {...}, "feature_flags": {...} }` |
| **Cruzamentos** | `TIPO_IDENTIFICADOR.cross_validations` | `[ { "exige": "MAC_ADDRESS", "regex": "...", "obrigatorio": true } ]` |

## 7. Lacunas 🟡🔴

- 🟡 **`ATIVO.estagio_atual` × `status_destino_id`** — coexistência definida em [mer.md §4](mer.md); confirmar no DDL.
- 🟡 **`MAC_ADDRESS`** — é validação (cross-validation), **não** identificador nem atributo; onde persistir o valor lido não está definido (**PENDENCY-0028**) — provável: coluna/JSON do evento de importação.
- 🔴 **MTR/CDF** — MTR = número manual em coluna a modelar (campo `mtr` em evento de expedição?); CDF (PENDENCY-0010) exigirá tabela própria — DDL em **PENDENCY-0028**.
- 🟢 **Extensibilidade sem DDL** — identificadores, atributos, estágios e frações crescem por seed/jsonb (princípio da taxonomia).
