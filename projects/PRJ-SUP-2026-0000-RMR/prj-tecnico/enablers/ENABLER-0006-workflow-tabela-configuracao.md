# 🛠️ ENABLER-0006 — Workflow em tabela de configuração (máquina de estados própria)

| Campo | Valor |
|---|---|
| **Categoria** | Arquitetura |
| **Origem** | **B3** (checklist de arquitetura) — ADR-003 confirmado (máquina de estados própria) e decisão 4 ("workflow vira tabela de configuração *desde já*") · antecipa o [PENDENCY-0003](../../pendencias.md) |
| **Habilita** | **FEATURE-0002.0001 inteira** (stories 0004–0009) + rota humana da Onda 1-Must (MVP mínimo) inteira; engine único do fluxo RMR |
| **Depende de** | [ENABLER-0005](ENABLER-0005-flyway-entidades-seeds.md) (tabelas do workflow, entidade 8–9 da taxonomia) · [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md) |
| **Dono sugerido** | Bolismar da Silva (arquiteto) + Bruno Oliveira (backend) |
| **Estimativa (Job Size)** | **3** *(proposta — consolidar no planning)* |
| **Status** | 📝 Rascunho (2026-10-19) · **DoR:** [checklist](dor-enablers.md) · **WSJF:** [avaliação](wsjf-enablers-iniciais.md) (4º lugar proposto) |

---

## 1. Visão Geral e Contexto

- **Categoria:** Arquitetura
- **Origem:** B3 (Checklist de Arquitetura) — ADR-003 (sem Flowable/Camunda: máquina de estados própria; workflow-persistido em tabelas próprias) e decisão 4: "*workflow vira tabela de configuração desde já, não depois*" (custo baixo no dia 1, refatoração caríssima quando a Onda 3-Could (Integração & Valor) chegar — ecoa o raciocínio do [ENABLER-0004](ENABLER-0004-policies-rls-tenant.md)).
- **Status de Bloqueio:** **Bloqueia FEATURE-0002.0001 por completo** — sem engine + config, as 6 stories do fluxo (triagem → parar em algum status) não têm contra o que ser construídas. É o coração técnico da rota humana.

## 2. Análise de Priorização (Métricas para WSJF)

- **Valor de Negócio / Redução de Risco:** **Coração do produto.** Habilita FEATURE-0002.0001 (6 das 13 stories da Onda 1-Must (MVP mínimo)). Reduz a risco de refatoração: com configuração em tabela, mudar etapa/transição (Onda 3-Could (Integração & Valor) e o PENDENCY-0003) vira **linha de dados**, não deploy + migração de estado embutido em código.
- **Habilitação de Oportunidade:** Builder de workflow da UI (Onda 3-Could (Integração & Valor)), estados por tipo de ativo (FEATURE-0005.0002/FEATURE-0005.0003) e integrações futuras passam a "falar" com a mesma tabela.

## 3. Escopo Técnico Detalhado

1. **Engine própria:** implementar máquina de estados enxuta (sem lib de BPM), com pré-condições, guarda de transição e efeitos — API única de transição.
2. **Tabelas de configuração:** ETAPA e TRANSICAO (entidades 8–9 da [taxonomia](../../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md) §5.1) carregando a **configuração mínima da Onda 1-Must (MVP mínimo)**: TRIAGEM → TESTE → REPARO → RECICLAGEM → RUN IN → EMBALAGEM → EXPEDIÇÃO → SUCATA.
3. **Validação server-side:** transição só acontece se pré-condições satisfeitas (ex.: BR-2.1.3 — reprovação exige registro de defeito) e papel autorizado (perfil [ENABLER-0003](ENABLER-0003-keycloak-perfis.md)).
4. **Registro obrigatório:** toda transição registrada automaticamente na auditoria ([ENABLER-0007](ENABLER-0007-auditoria-append-only.md)) — BR-2.1.2.
5. **Boot idempotente:** seed das etapas/transições da Onda 1-Must (MVP mínimo) junto com a migration.

> **Não está incluso:** builder de workflow na UI (Onda 3-Could (Integração & Valor) — PENDENCY-0003) · estados por tipo de ativo (FEATURE-0005.0002/FEATURE-0005.0003, Onda 2-Should (MVP completo)) · integração com máquina de estados externa.

## 4. Critérios de Saída (Definition of Done)

- **Trocar a config muda o fluxo sem deploy** — teste automatizado: adicionar/ajustar uma transição via seed altera os caminhos aceitos.
- Transição com pré-condição não satisfeita é **bloqueada com mensagem apontando o campo faltante** (Passou/Falhou).
- Toda transição aceita gera registro de auditoria automaticamente (sem chamada explícita do chamador).
- FEATURE-0002.0001 pode ser construída contra a API de transição (as stories 0004–0009 não precisam inventar fluxo próprio).
