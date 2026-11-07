# 🧩 domain.md — modelo de domínio (bounded contexts)

## 1. Visão geral

| Item | Valor |
|------|-------|
| Projeto | PRJ-SUP-2026-0000-RMR |
| Domínio de negócio | Ciclo de vida de materiais serializados: **reparo, manutenção e reciclagem** (recebimento → triagem → reparo → expedição/descarte) |
| Estilo | Monólito modular (Quarkus — [ADR-001](arquitetura/adrs/adr-001-monolito-modular.md)) com **hexagonal por módulo** |
| Bounded contexts | **3 grupos · 18 módulos** (§2) — [c4-components.md](arquitetura/c4-components.md) (diagrama) |
| Fonte da verdade de **negócio** | [negocio/requisitos/taxonomia-entidades-cadastro-ativos.md](../negocio/taxonomia-entidades-cadastro-ativos.md) — este doc é a visão **técnica** do domínio |
| Requisitos de origem | [PEDIDO](../../projects/PRJ-SUP-2026-0000-RMR/prj-negocio/discovery/PEDIDO.md) R1–R59 · [BRAINSTORM](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/discovery/BRAINSTORM.md) Premissas 1–5 |
| Status | 📝 **v1 (2026-10-21)** — dissolvido do SAD §2/§6 |

---

## 2. Bounded contexts

| Contexto | Módulos | Papel |
|---|---|---|
| **Ciclo Reverso** (domínio operacional) | `workflow`, `triage`, `inspection`, `maintenance`, `recycling`, `packaging`, `shipping` | A máquina de estados e as etapas que movem o ativo — o *work* |
| **Núcleo** (fonte da verdade) | `catalog`, `serialized-asset`, `watchlist`, `labeling`, `evidence`, `value-recovery` | O que é material, o que existe fisicamente, regras de formação de código, evidências e valor |
| **Suporte** (plataforma) | `identity`, `tenancy`, `notification`, `integration`, `reporting` | Identidade, configuração por tenant, hub de integração (ACL), leitura/reporting |

**Relações de contexto (context map):**

- `serialized-asset` e `catalog` são **upstream** de quase tudo (fonte da verdade — regra de ouro #3).
- `workflow` **orquestra** as etapas do Ciclo Reverso (nunca o contrário — regra de ouro #2); etapas consomem o motor.
- `integration` é a **fronteira anti-corrupção** (downstream de sistemas externos — [ADR-004](arquitetura/adrs/adr-004-acl-outbox.md)); nenhum outro módulo enxerga termos externos.
- `tenancy` é **transversal**: toda configuração (workflow, catálogos, etiquetas, dicionário, política de evidência) resolve por tenant.
- `watchlist` e `value-recovery` dependem de `serialized-asset` + eventos (`StageTransition`) — não de telas.

## 3. Conceitos-chave (glossário técnico)

| Conceito | Definição técnica | Definição de negócio |
|---|---|---|
| **SKU (`material`)** | Registro de catálogo com regra de formação de código (JSONB) | [taxonomia §3/§4](../negocio/taxonomia-entidades-cadastro-ativos.md) |
| **Unidade (`material_serializado`)** | Instância física com `trackingCode` + `external_ids` (JSONB) | [taxonomia §4](../negocio/taxonomia-entidades-cadastro-ativos.md) |
| **`identificador_unico`** | Chave de rastreio do ativo = identificador **primário** do modelo | [taxonomia §5.1.1](../negocio/taxonomia-entidades-cadastro-ativos.md) · [regras-formacao-identificadores](../negocio/regras-formacao-identificadores.md) |
| **Workflow** | Definição (`WORKFLOW_DEF`, JSONB estágios/transições) + instância (transições por unidade) | R14/R20 · PENDENCY-0003 (adiada) |
| **Estágio / transição** | Estado atual do ativo + evento que o move; pré-condições e RBAC na transição | R20 |
| **Watchlist** | `blacklist` (bloqueio total) · `scrap` (destino de sucata) · `boomerang` (retorno) | R19/R23 · [FEATURE-0001.0005](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/features/FEATURE-0001.0005-watchlist-triagem.md) |
| **Evidência** | Imagem com política configurável (obrigatoriedade × fase × finalidade) + OCR opcional | Premissa 5/R59 · [ADR-007](arquitetura/adrs/adr-007-evidencia-configuravel.md) |
| **NDS** | **Atributo opcional** de importação (`ATIVO.atributos`, ≤32 chars) — agrupador de lote, **não identificador** | [regras §6](../negocio/regras-formacao-identificadores.md) |
| **Recuperação de valor** | Motor determinístico por rota (reparo/remanufatura/desmanche/reciclagem/descarte + venda de peças) | B-REQ-02/09/10 · [ADR-011](arquitetura/adrs/adr-011-motor-recuperacao-valor.md) |
| **Tenant** | Unidade isolada de dados/config — `tenant_id` + RLS | Premissa 1 · [ADR-002](arquitetura/adrs/adr-002-rls-multi-tenant.md) |

## 4. Configurabilidade por tenant

> "Configuração acima de código" (Premissa 1) — `ConfigResolver` por tenant alimenta todos os módulos (dissolvido do SAD §6).

| Configuração | Escopo | Decisão |
|---|---|---|
| Workflow (etapas/transições/permissões) | por tenant | [ADR-003](arquitetura/adrs/adr-003-workflow-configuravel.md) |
| Campos por etapa (*form builder*) | por tenant/etapa | BRAINSTORM §6.6 |
| Catálogos mestres (defeito, causa, serviço, insumo) | por tenant | R6–R16 |
| Layouts de etiqueta | por modelo/parceiro | R58 |
| Dicionário de termos (*aliases* — ex.: NDS) | por tenant | BRAINSTORM §2.3 |
| Política de evidência | por cliente/modelo/fase | Premissa 5 |

## 5. Lacunas e observações 🟢🟡🔴

- 🟢 **Fronteiras explícitas** — 18 módulos mapeados com requisitos; regras de ouro documentadas em [architecture.md](arquitetura/architecture.md) §3.
- 🟡 **PENDENCY-0003 adiada** — permissões por defeito e níveis por fornecedor: Onda 1-Must (MVP mínimo) usa fluxo fixo (seed); detalhar quando a configuração Onda 2-Should (MVP completo) voltar (workflow-config).
- 🟡 **Glossário de negócio × técnico** — taxonomia (négócio) e este doc precisam de passada de sincronismo a cada mudança de §5 da taxonomia.
- 🟡 **`value-recovery`** — motor ainda não especificado a nível de domínio (só ADR-011 + backlog); refinar na feature B-REQ-09/10.
- 🔴 **Módulo `integration` sem inventário completo de sistemas** — ver [inventory.md](inventory.md) (4 de 5 integrações sem doc).

## 6. Próximos passos

1. **[inventory.md](inventory.md)** — fechar dono/contrato de cada solução externa.
2. Detalhar **eventos de domínio** (`StageTransition`) como contrato interno (base do Outbox/ADR-004).
3. Sincronizar este doc quando a **taxonomia** (négócio) mudar §4/§5.
4. Retomar PENDENCY-0003 (configuração de workflow) fora da Onda 1-Must (MVP mínimo).
