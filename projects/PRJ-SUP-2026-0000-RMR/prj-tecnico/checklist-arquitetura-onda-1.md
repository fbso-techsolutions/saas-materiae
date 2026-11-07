# 📝 Checklist de reunião — Tech lead/Arquiteto (stack e arquitetura da Onda 1-Must (MVP mínimo))

| Campo | Valor |
|---|---|
| Objetivo | Fechar a **stack e as decisões de arquitetura da Onda 1-Must (MVP mínimo)** antes da Sprint 1 — fundamentos, guardrails que evitam refatoração e ambiente da oficina |
| Participantes | **Tech lead** · **Arquiteto** · *(opcional)* Eng, PO, Segurança |
| Data da reunião | `19/10/2026` (últimas respostas: 19/10/2026) |
| Itens | 9 de 9 **decididos** ✅ (§A Fundamentos · §B Guardrails · §C Ambiente e operação técnica) · **1 follow-up aberto** (§D — D2 SAST/secret scan) |
| Fonte | Pendência **PENDENCY-0015** do [hub](../pendencias.md) · [BRAINSTORM §6](../prj-produto/discovery/BRAINSTORM.md) (stack sugerida + abertos §6.4/§6.8) · [diretrizes-arquitetura.md](https://github.com/fbso-techservice/platform/blob/main/standards/architecture/diretrizes-arquitetura.md) · escopo da Onda 1-Must (MVP mínimo) em [escopo-onda-1](../prj-produto/escopo-onda-1.md) |
| Status do doc | ✅ **Revisado — decisões incorporadas a [ADR-012](../../../docs/tecnico/arquitetura/adrs/adr-012-stack-onda-1.md), [diretrizes](https://github.com/fbso-techservice/platform/blob/main/standards/architecture/diretrizes-arquitetura.md), [hub](../pendencias.md) e [decisão D-09](../prj-produto/backlog/DECISOES-BACKLOG.md) (2026-10-19)** |

> **Como usar:** uma linha por decisão. Preencher **Resposta** (decisão concreta), marcar o **Status** e assinalar quem ficou **Dono** de follow-ups. Decisões tomadas aqui **voltam para o SAD (05) como ADRs**, para [diretrizes-arquitetura.md](https://github.com/fbso-techservice/platform/blob/main/standards/architecture/diretrizes-arquitetura.md), para o [hub](../pendencias.md) (PENDENCY-0015) e para o [registro de decisões](../prj-produto/backlog/DECISOES-BACKLOG.md) — este checklist é só a ata de trabalho.

**Legenda de Status:** ⬜ Não respondida · ⏳ Em discussão · ✅ Decidida · ❌ Adiada (com nova data)

> ⛓️ **Restrições da Onda 1-Must (MVP mínimo) que orientam as sugestões:** **zero dependências externas** (DoD da [FEATURE-0002.0001](../prj-produto/features/FEATURE-0002.0001-painel-kanban-workflow.md)) · rota de decisão **humana** (sem motor) · operação **sem mouse** (DoD FEATURE-0002.0001/FEATURE-0002.0005) · API-First + `tenant_id` ([diretrizes](https://github.com/fbso-techservice/platform/blob/main/standards/architecture/diretrizes-arquitetura.md)).

---

## A. Fundamentos (stack e estrutura)

### A1. Stack da Onda 1-Must (MVP mínimo)
- **Pergunta:** confirmar a stack proposta no [BRAINSTORM §6.2](../prj-produto/discovery/BRAINSTORM.md) — **Java 21 + Spring Boot 3 · Spring Modulith · PostgreSQL + Flyway · React + TypeScript · REST/OpenAPI** — ou registrar alternativa (ex.: o time já domina outra). Alguma escolha viola o "zero dependências externas" da Onda 1-Must (MVP mínimo)?
- **Resposta (Tech lead/Arquiteto):** tabela abaixo — *reorganizada em 19/10/2026 com a classificação **Onda 1-Must (MVP mínimo) × SaaS** (conteúdo original preservado)*.

| Componente | Versão | Papel | Vale na Onda 1-Must (MVP mínimo)? |
|---|---|---|---|
| Java | 25 (LTS) · Mandrel 25 | Linguagem base, alta performance de threads | ✅ |
| Quarkus | 3.40.x (LTS) | Framework — baixíssimo consumo e inicialização instantânea | ✅ |
| GraalVM (Mandrel) | 25.0 | Compilador nativo — binários Linux ultraleves | ✅ (build) |
| PostgreSQL | 17+ | Banco de dados relacional principal | ✅ **com RLS** (ver B2) |
| Flyway | — | Migrações de schema | ✅ |
| React | 19+ | Frontend SPA | ✅ *(SPA = Vite + TanStack Router/Query — [ADR-013](../../../docs/tecnico/arquitetura/adrs/adr-013-frontend-spa.md))* |
| Keycloak | 26.x ou mais recente | IAM — autenticação, autorização, perfis (ver B1) | ✅ auto-hospedado |
| Kong | 3.x | API Gateway — rotas, rate limit por tenant, SSL | ❌ → **SaaS Onda 4 (Produto)/Onda 5 (Plataforma)** |
| Istio | 1.24.x ou mais recente | Service Mesh — mTLS, telemetria, tracing | ❌ → **SaaS Onda 4 (Produto)/Onda 5 (Plataforma)** |
| DOKS | DigitalOcean (gerenciado) | Kubernetes de produção | ❌ → **SaaS Onda 4 (Produto)/Onda 5 (Plataforma)** |
| Redis | 7.x | Cache distribuído, sessões | ❌ → **SaaS Onda 4 (Produto)/Onda 5 (Plataforma)** |

- **Decisão (19/10/2026):** **Onda 1-Must (MVP mínimo) roda em Docker Compose no servidor interno** (coerente com C1) com a base: **Java 25 + Quarkus (GraalVM Mandrel) · PostgreSQL 17+ com RLS · Flyway · React + TypeScript · Keycloak auto-hospedado**. **DOKS + Kong + Istio + Redis → alvo SaaS (Onda 4 (Produto)/Onda 5 (Plataforma))** — fora da Onda 1-Must (MVP mínimo), coerente com "zero dependências externas" e com o monólito modular (Onda 1-Must (MVP mínimo) a Onda 4 (Produto) do BRAINSTORM §6.3). Registrado como [**ADR-012**](../../../docs/tecnico/arquitetura/adrs/adr-012-stack-onda-1.md).
- **Status:** ✅ · **Dono:** Tech lead + Arquiteto de Soluções · **Prazo:** antes da Sprint 1
- **Impacto:** vira [**ADR**](../../../docs/tecnico/arquitetura/adrs/INDEX.md) (registrada em adrs/) e desbloqueia repositório/CI (C4).

### A2. Módulos e modelo de dados da Onda 1-Must (MVP mínimo)
- **Pergunta:** monólito modular ([BRAINSTORM §6.3](../prj-produto/discovery/BRAINSTORM.md)) — quais módulos **desde já** (sugeridos: `identity`, `asset`, `workflow`, `audit`)? E no modelo de dados: as **7 entidades** da [taxonomia](../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md) nascem todas na Onda 1-Must (MVP mínimo), ou só as que o fluxo da Onda 1-Must (MVP mínimo) usa (ATIVO + STATUS_DESTINO + seeds)?
- **Sugestão para a Onda 1-Must (MVP mínimo):** módulos mínimos; criar **as 7 tabelas com seeds** desde já — é barato agora e evita migração dolorosa quando FEATURE-0001.0003 (cadastros mestres), FEATURE-0005.0001/FEATURE-0005.0002 (desmonte) e FEATURE-0001.0005 (watchlist) entrarem (estrutura já decidida na PENDENCY-0002).
- **Resposta:** `módulos mínimos; criar **as 7 tabelas com seeds** desde já — é barato agora e evita migração dolorosa quando FEATURE-0001.0003 (cadastros mestres), FEATURE-0005.0001/FEATURE-0005.0002 (desmonte) e FEATURE-0001.0005 (watchlist) entrarem, importante ja ter a base de tenant preparada para as fases seguintes`
- **Status:** ✅ · **Dono:** Tech lead + Arquiteto de Soluções + Engenheiro de Dados · **Prazo:** antes da Sprint 1
- **Impacto:** define o esqueleto de migrations (Flyway) da Sprint 1.

## B. Guardrails (decisões que evitam refatoração)

### B1. Autenticação e perfis na Onda 1-Must (MVP mínimo)
- **Pergunta:** a Onda 1-Must (MVP mínimo) nasce com **SSO** (R2 + diretriz OIDC/Keycloak) ou com **login local**, dado o pré-requisito "zero dependências externas"? (aberto no [BRAINSTORM §6.8](../prj-produto/discovery/BRAINSTORM.md))
- **Sugestão para a Onda 1-Must (MVP mínimo):** login **local** com **RBAC mínimo** (perfis Operação e Compliance — exigidos pela [FEATURE-0005.0005](../prj-produto/features/FEATURE-0005.0005-travas-lgpd-compliance.md)) dentro de um módulo `identity` isolado, com **adapter SSO (OIDC) plugável** no MVP sem refatorar; R3–R5 (inativação, troca/reset de senha) já aplicados na Onda 1-Must (MVP mínimo).
- **Resposta:** `autenticação, autorização e perfis com **Keycloak**` **(auto-hospedado no Compose da Onda 1-Must (MVP mínimo) — usuários gerenciados no Keycloak; integração com diretório corporativo (AD) fica para Onda 4 (Produto)/Onda 5 (Plataforma))**
- **Status:** ✅ · **Dono:** Tech lead + Segurança da Informação · **Prazo:** antes da Sprint 1
- **Impacto:** Keycloak entra **auto-hospedado no Compose da Onda 1-Must (MVP mínimo)** (task na Sprint 1 — perfis Operação/Compliance); SSO satisfaz R2 desde a Onda 1-Must (MVP mínimo); integração com diretório corporativo fica como follow-up Onda 4 (Produto)/Onda 5 (Plataforma).

### B2. Multi-tenancy na Onda 1-Must (MVP mínimo)
- **Pergunta:** `tenant_id` nas tabelas desde o dia 1 (diretriz) — confirmar? E **RLS** do PostgreSQL na Onda 1-Must (MVP mínimo) ou só no SaaS? (aberto no [BRAINSTORM §6.4](../prj-produto/discovery/BRAINSTORM.md))
- **Sugestão para a Onda 1-Must (MVP mínimo):** `tenant_id` em todas as tabelas de domínio **sim** — custo quase zero no dia 1, refatoração caríssima depois — com seed de **1 tenant**; ~~RLS não na Onda 1-Must (MVP mínimo)~~.
- **Resposta:** `tenant_id em todas as tabelas de domínio sim` · **RLS na Onda 1-Must (MVP mínimo) — confirmado em 19/10/2026:** `PostgreSQL 17+ com RLS` ativado desde a Onda 1-Must (MVP mínimo) (policies + `SET LOCAL app.current_tenant` — mecanismo do **ADR-002**).
- **Status:** ✅ · **Dono:** Tech lead + Arquiteto de Soluções · **Prazo:** antes da Sprint 1
- **Impacto:** decisão que salva refatoração do Caminho C — **confirma e estende o ADR-002** (RLS) já previsto em [adrs/INDEX](../../../docs/tecnico/arquitetura/adrs/INDEX.md); migrations da Onda 1-Must (MVP mínimo) incluem policies de RLS (Architectural Runway da Sprint 1).

### B3. Motor de workflow na Onda 1-Must (MVP mínimo)
- **Pergunta:** máquina de estados **própria** (sem Flowable/Camunda na Onda 1-Must (MVP mínimo)) — confirmar? E as etapas/transições: **fixas em código** na Onda 1-Must (MVP mínimo) ou já em **tabela de configuração** (prepara a F2.x e a PENDENCY-0003 sem refatorar)?
- **Sugestão para a Onda 1-Must (MVP mínimo):** próprio; etapas e transições da Onda 1-Must (MVP mínimo) em **tabela de configuração mínima** — a FEATURE-0002.0001 já exige pré-condições validadas em **um único ponto** (BR-2.1.3); UI de workflow builder fica para Onda 2-Should (MVP completo).
- **Resposta:** `máquina de estados própria; etapas/transições em **tabela de configuração** desde a Onda 1-Must (MVP mínimo)` **(ambiguidade esclarecida em 19/10/2026 — vale tabela de configuração; a ADR-003 já previa "workflow configurável")**
- **Status:** ✅ · **Dono:** Tech lead + Arquiteto de Soluções · **Prazo:** antes da Sprint 1
- **Impacto:** configuráveis ⇒ **PENDENCY-0003 não vira refatoração** e FEATURE-0001.0002/F2.x herdam o motor; confirma **ADR-003**.

## C. Ambiente e operação técnica

### C1. Onde a Onda 1-Must (MVP mínimo) roda (deploy, homologação, backup)
- **Pergunta:** onde hospedar — **servidor interno** × cloud? Quem cuida do ambiente de **homologação** para a Operação testar a cada entrega? E o **backup** do banco?
- **Sugestão para a Onda 1-Must (MVP mínimo):** **Docker Compose em servidor interno** (zero dependências externas), com ambiente de homologação espelhado e **backup diário** do PostgreSQL (a trilha de auditoria é prova — ver C3).
- **Resposta:** `para a Onda 1-Must (MVP mínimo): Docker Compose em servidor interno (zero dependências externas), com ambiente de homologação espelhado e backup diário do PostgreSQL`
- **Status:** ✅ · **Dono:** Tech lead + Infraestrutura/Cloud · **Prazo:** antes da Sprint 1
- **Impacto:** define quem provisiona máquina, acessos e a rotina de deploy (C4) — e **confina a stack do A1** ao que roda em Compose (Kong/Istio/DOKS/Redis ficam de fora da Onda 1-Must (MVP mínimo)).

### C2. Terminais e leitores da oficina
- **Pergunta:** a Onda 1-Must (MVP mínimo) opera **sem mouse** (DoD FEATURE-0002.0001/FEATURE-0002.0005): qual **leitor de código** — USB HID (emula teclado) × Bluetooth? Qual navegador nos terminais da oficina? Smart card será **registro manual** na Onda 1-Must (MVP mínimo) (decisão A2 do [checklist Operação/PO](../prj-produto/backlog/checklist-operacao-po-onda-1.md)) — confirmar que nada exige driver/app.
- **Sugestão para a Onda 1-Must (MVP mínimo):** leitor **USB HID** (zero driver), **Chrome/Edge** atualizado; validar em **1 terminal real** da oficina antes da Sprint 1.
- **Resposta:** `Leitor de código? USB HID (emula teclado) e Bluetooth. Qual navegador nos terminais da oficina? Firefox e Google Chrome. Smart card será registro manual na Onda 1-Must (MVP mínimo).`
- **Status:** ✅ · **Dono:** Engenharia + Operação · **Prazo:** antes da Sprint 1
- **Impacto:** **sem compra** (PENDENCY-0018) — usar o leitor e o terminal existentes; as stories 0004–0010 dependem da homologação. *Nota:* leitor Bluetooth precisa parear **em modo HID** (não SPP) para emular teclado; validar **Firefox e Chrome** nos 2 navegadores no terminal real.

### C3. Auditoria imutável (mecanismo mínimo)
- **Pergunta:** a trilha de auditoria (BR-2.1.2, [FEATURE-0005.0005](../prj-produto/features/FEATURE-0005.0005-travas-lgpd-compliance.md), diretriz "todo movimento é um evento") — qual mecanismo na Onda 1-Must (MVP mínimo): **tabela append-only**? Logs? Precisa de garantia anti-edição (hash/encadeamento) já na Onda 1-Must (MVP mínimo)?
- **Sugestão para a Onda 1-Must (MVP mínimo):** tabela **append-only** (ator, data/hora, ação, identificador lido, dados relevantes) protegida **por app e por permissão de banco** (sem UPDATE/DELETE); hash/encadeamento e WORM storage como evolução pós-Onda 1-Must (MVP mínimo).
- **Resposta:** `tabela append-only (ator, data/hora, ação, identificador lido, dados relevantes) protegida por app e por permissão de banco (sem UPDATE/DELETE); hash/encadeamento e WORM storage como evolução pós-Onda 1-Must (MVP mínimo).`
- **Status:** ✅ · **Dono:** Arquiteto de Soluções + Segurança da Informação · **Prazo:** antes da Sprint 1
- **Impacto:** requisito **transversal** das 4 features da Onda 1-Must (MVP mínimo) — entra como Architectural Runway na Sprint 1.

### C4. CI/CD e repositórios
- **Pergunta:** pipeline mínimo: build + testes + **deploy automático em homolog** a cada merge? **Monorepo** (docs + código) × repositório separado? Quem aprova merge?
- **Sugestão para a Onda 1-Must (MVP mínimo):** Git + pipeline simples (build/test/deploy em homolog), **trunk-based** com PR review obrigatório; monorepo é suficiente para o tamanho do time.
- **Resposta:** `Git + pipeline simples (build/test/deploy em homolog), trunk-based com PR review obrigatório; monorepo é suficiente para o tamanho do time.`
- **Status:** ✅ · **Dono:** Tech lead · **Prazo:** antes da Sprint 1
- **Impacto:** ritmo de entrega das sprints — combinado antes de abrir a Sprint 1. *Nota:* build nativo (Mandrel) torna o build de imagem mais pesado — prever cache de imagem no pipeline.

---

## D. Operação — follow-ups do gate (abertos)

> As 9 decisões acima estão fechadas; estes 3 itens são **consequência delas** e ficaram sem dono/prazo no gate. Registrados no [hub](../pendencias.md) em 2026-10-23.

### D1. Ritual de promoção homolog → produção
- **Pergunta:** C4 deixou o deploy automático em **homologação**; produção ficou fora do ENABLER-0002. Quem promove, quando (por release? por demanda?), com qual aprovação e qual o rollback?
- **Resposta:** produção usa **ArgoCD** com **entrega contínua (por release ou por demanda)**.
- **Status:** ✅ · **Dono:** Tech lead + Infra · **Prazo:** 2026-10-30 · **Pendência:** [PENDENCY-0024](../pendencias.md)
- **Impacto:** sem ritual, o go-live vira ação manual não auditada — contradiz o modelo trunk-based.

### D2. SAST/secret scan e gate ZAP
- **Pergunta:** qual ferramenta de **SAST/secret scan** entra no pipeline (C4) e em que release roda o **gate ZAP + teste manual cross-tenant** ([testing §5](../../../docs/tecnico/arquitetura/testing.md))?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** Tech lead + Segurança · **Prazo:** 2026-11-06 · **Pendência:** [PENDENCY-0025](../pendencias.md)
- **Impacto:** security gate da 1ª release candidata a produção ([SECURITY §6](../../../docs/tecnico/seguranca/SECURITY.md)).

### D3. Dimensionamento do servidor e alvo Onda 4 (Produto)/Onda 5 (Plataforma)
- **Pergunta:** C1 decidiu **onde** roda, não **com quanto**. Qual o dimensionamento (CPU/RAM/disco) para a Onda 1-Must (MVP mínimo) — considerando build Mandrel + PostgreSQL + Keycloak no mesmo host? E qual região/custo do alvo Onda 4 (Produto)/Onda 5 (Plataforma) (DOKS/Kong/Istio/Redis)?
- **Resposta:** **Kubernetes + Helm** para padronização de memória/disco/processamento, junto com **ArgoCD** — permitindo ajustes rápidos mantendo os sistemas no ar continuamente.
- **Status:** ✅ · **Dono:** Infra · **Prazo:** 2026-10-30 (Onda 1-Must (MVP mínimo)) · **Pendência:** [PENDENCY-0026](../pendencias.md)
- **Impacto:** entra no risco 5 da [Sprint 1](../prj-produto/sprints/sprint-1-fundacao.md) junto com a verificação do servidor (PENDENCY-0021).

---

## 4. Conclusão da reunião

| Campo | Preencher |
|---|---|
| Pendências decididas hoje | `A1–A2 ✅ · B1–B3 ✅ · C1–C4 ✅ — 9/9 (últimas respostas em 19/10/2026)` |
| Mudanças de escopo (LC da Onda 1-Must (MVP mínimo)) | `Sem LC de features (13 stories inalteradas); +4 **Architectural Runways** na Sprint 1: Keycloak no Compose · policies de RLS · tabela de configuração de workflow · trilha de auditoria append-only` |
| ADRs a registrar no SAD (05) | `**ADR-012 criado** (stack da Onda 1-Must (MVP mínimo): Java 25 + Quarkus/Mandrel, PostgreSQL 17+ com RLS, Keycloak; Onda 1-Must (MVP mínimo) em Compose interno; DOKS/Kong/Istio/Redis = SaaS Onda 4 (Produto)/Onda 5 (Plataforma)) · confirma ADR-001 (monólito), ADR-002 (RLS), ADR-003 (workflow configurável), ADR-005 (Keycloak), ADR-009 (ambientes)` |
| Follow-ups (dono + prazo) | ~~React: confirmar SPA (Vite + TanStack Query) × Next.js~~ → **✅ decidido 2026-10-19: SPA (Vite + TanStack) = [ADR-013](../../../docs/tecnico/arquitetura/adrs/adr-013-frontend-spa.md)** (Server Actions do Next fogam do API-First; spike ENABLER-0009 entrega o scaffold até 21/10) · integração com diretório corporativo (AD) no Keycloak = Onda 4 (Produto)/Onda 5 (Plataforma) (Segurança) |
| Próxima reunião (se houver) | `não necessária — gate de arquitetura fechado; próximo gate = **capacidade do time**` |

**Após a reunião (feito em 2026-10-19):** ✅ decisões viraram [**ADR-012**](../../../docs/tecnico/arquitetura/adrs/adr-012-stack-onda-1.md) e ajustaram [diretrizes-arquitetura.md](https://github.com/fbso-techservice/platform/blob/main/standards/architecture/diretrizes-arquitetura.md) · ✅ **PENDENCY-0015 → ✅ no [hub](../pendencias.md)** · ✅ [decisão D-09](../prj-produto/backlog/DECISOES-BACKLOG.md) · checklist ✅ Revisado — falta **só a capacidade do time** para abrir a **Sprint 1** em [../../produto/sprints/](../prj-produto/sprints).
