# 🛠️ ENABLER-0005 — Esqueleto Flyway: 7 entidades + seeds

| Campo | Valor |
|---|---|
| **Categoria** | Arquitetura / Dados |
| **Origem** | **A2** (checklist de arquitetura) — "criar as 7 tabelas com seeds desde já" · [taxonomia §5](../../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md) (9 entidades: 7 centrais + 2 de workflow) |
| **Habilita** | FEATURE-0001.0001 (MODELO/ATIVO/STATUS_DESTINO), FEATURE-0005.0005 (flag mídia por modelo), F2.x (bases do workflow); **prepara FEATURE-0001.0003/FEATURE-0001.0005/F5.x sem migração** |
| **Depende de** | [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md) (PostgreSQL) · coordena-se com [ENABLER-0004](ENABLER-0004-policies-rls-tenant.md) (tenant_id + policies nas migrations) |
| **Dono sugerido** | Carlos Mattos (dados) + Bruno Oliveira (backend) |
| **Estimativa (Job Size)** | **3** *(proposta — consolidar no planning)* |
| **Status** | 📝 Rascunho (2026-10-19) · **DoR:** [checklist](dor-enablers.md) · **WSJF:** [avaliação](wsjf-enablers-iniciais.md) (7º lugar proposto) |

---

## 1. Visão Geral e Contexto

- **Categoria:** Arquitetura / Dados
- **Origem:** A2 (Checklist de Arquitetura) — decisão 1: "*Flyway desde a primeira migration; criar as 7 tabelas com seeds desde já*" (para que a Onda 3-Could (Integração & Valor) vire escrita de migration, não refatoração); entidades conforme a [taxonomia](../../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md) §5.1.
- **Status de Bloqueio:** **Bloqueador das histórias de leitura/escrita de domínio** (FEATURE-0001.0001 sem tabela não lê nada; FEATURE-0005.0005 sem MODELO não tem flag; F2.x sem STATUS_DESTINO não tem catálogo). Adiar = refatoração estrutural quando Onda 3-Could (Integração & Valor) chegar.

## 2. Análise de Priorização (Métricas para WSJF)

- **Valor de Negócio / Redução de Risco:** **Alto.** Cria o esqueleto estável das entidades centrais (LINHA_EEE, CATEGORIA_ATIVO, MODELO, ATIVO, STATUS_DESTINO, FRACAO_MATERIAL, FRACAO_RETIRADA) — o produto inteiro "fala" com essas tabelas. Risco de refatoração futuro próximo de zero.
- **Habilitação de Oportunidade:** FEATURE-0001.0003/FEATURE-0001.0005/F5.x (Onda 2-Should (MVP completo)) e a futura feature de kits passam a escrever **só migrations novas** — velocidade da Onda 3-Could (Integração & Valor) cresce.

## 3. Escopo Técnico Detalhado

1. **Migrations Flyway versionadas:** `V1__7_entidades.sql` (ou pequena sequência) com as 7 tabelas centrais — colunas conforme a [taxonomia §5.2](../../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md), `tenant_id NOT NULL` + FK em todas (complemento do [ENABLER-0004](ENABLER-0004-policies-rls-tenant.md)).
2. **Seeds determinísticos:** scripts idempotentes para os catálogos pequenos obrigatórios na Onda 1-Must (MVP mínimo) — STATUS_DESTINO (lifecycle), FRACAO_MATERIAL (verde/vermelho + corredo resíduo perigoso), FRACAO_RETIRADA (recuperado/destruído), CATEGORIA_ATIVO e LINHA_EEE (ex.: linha Verde).
3. **Policies aplicadas:** cada tabela nasce já com RLS habilitado (deploy conjunto com o [ENABLER-0004](ENABLER-0004-policies-rls-tenant.md)).
4. **Fluxo de evolução:** padronizar `flyway migrate` no boot do ambiente (Compose do ENABLER-0001) + convenção de nomenclatura de migrations.

> **Não está incluso:** dados de negócio de homologação (catálogo mínimo, defeitos, modelo serializado → [ENABLER-0010](ENABLER-0010-dados-iniciais-homologacao.md)) · tabelas de workflow (ETAPA/TRANSICAO → [ENABLER-0006](ENABLER-0006-workflow-tabela-configuracao.md)) · EVENTO_AUDITORIA (→ [ENABLER-0007](ENABLER-0007-auditoria-append-only.md)).

## 4. Critérios de Saída (Definition of Done)

- `flyway migrate` roda **do zero** em homologação e sobe as 7 tabelas + seeds sem erro.
- Seeds carregam os tipos da Onda 1-Must (MVP mínimo) (STATUS_DESTINO, FRACAO_MATERIAL, FRACAO_RETIRADA, CATEGORIA_ATIVO, LINHA_EEE) de forma **idempotente** (rodar 2× = mesmo estado).
- Schema revisado pelo arquiteto (coerência com a taxonomia §5.2).
- `tenant_id` + policy presentes em **toda** tabela criada (conferência item a item).
