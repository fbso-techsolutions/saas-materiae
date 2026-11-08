# 🛠️ Enablers

> **Documentos individuais de Enabler** — cada frente de habilitação do projeto tem seu documento (escopo técnico, riscos, critério de saída, WSJF), no layout do [template Enabler · DoR](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/template-enabler-dor.md). Conceitos e categorias: [guia INVEST · Enablers · Spike](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md) (§4.5 = Enabler é item de backlog). **Visão de conjunto:** [inventário de Enablers iniciais](../../prj-produto/sprints/sprint-1-fundacao.md#1-inventário-dos-enablers) (Sprint 1) · **visão única de todo o trabalho do projeto:** [backlog](../../prj-produto/backlog/BACKLOG-LIST.md).

| # | Documento | Categoria | Habilita | Status |
|---|---|---|---|---|
| ENABLER-0001 | [Servidor interno + Docker Compose base](ENABLER-0001-servidor-interno-docker-compose.md) | Infraestrutura | Tudo (13 stories da Onda 1-Must (MVP mínimo)) | 📝 Rascunho |
| ENABLER-0002 | [Pipeline CI/CD trunk-based](ENABLER-0002-pipeline-ci-cd.md) | Infraestrutura | Cadência de todas as sprints | 📝 Rascunho |
| ENABLER-0003 | [Keycloak auto-hospedado + perfis](ENABLER-0003-keycloak-perfis.md) | Infra/Arquitetura | Login das 13 stories + FEATURE-0005.0005 (perfil `PERFIL-COMPLIANCE`) | 📝 Rascunho |
| ENABLER-0004 | [Policies de RLS + seed de tenant](ENABLER-0004-policies-rls-tenant.md) | Arquitetura | Tabelas de domínio (ADR-002) | 📝 Rascunho |
| ENABLER-0005 | [Esqueleto Flyway: 7 entidades + seeds](ENABLER-0005-flyway-entidades-seeds.md) | Arquitetura/Dados | FEATURE-0001.0001 · FEATURE-0005.0005 · F2.x · prepara FEATURE-0001.0003/FEATURE-0001.0005/F5.x | 📝 Rascunho |
| ENABLER-0006 | [Workflow em tabela de configuração](ENABLER-0006-workflow-tabela-configuracao.md) | Arquitetura | FEATURE-0002.0001 (stories 0004–0009) (ADR-003) | 📝 Rascunho |
| ENABLER-0007 | [Auditoria append-only](ENABLER-0007-auditoria-append-only.md) | Arq/Conformidade | Auditoria das 13 stories + FEATURE-0005.0005 | 📝 Rascunho |
| ENABLER-0008 | [Terminais: leitores + sem mouse](ENABLER-0008-terminais-leitores.md) | Infra + Spike | Stories 0004–0010 | 📝 Rascunho |
| ENABLER-0009 | [Decisão stack front: SPA × Next](ENABLER-0009-decisao-stack-front.md) | Exploração (Spike) | Todo o front | 🟡 Decisão ✅ [ADR-013](../../../../docs/tecnico/arquitetura/adrs/adr-013-frontend-spa.md) (2026-10-19) · scaffold ⏳ 21/10 |
| ENABLER-0010 | [Dados iniciais de homologação](ENABLER-0010-dados-iniciais-homologacao.md) | Infra/Dados | Demonstração de ponta a ponta | 📝 Rascunho |

**Documentos de priorização e execução:**

| Documento | O que responde | Status |
|---|---|---|
| [Avaliação WSJF dos Enablers iniciais](wsjf-enablers-iniciais.md) | Tabela comparativa A/B/C/CoD/Job Size/Score dos 10 Enablers + argumentação para a reunião de priorização | 📝 Proposta — calibrar na reunião |
| [DoR dos Enablers iniciais](dor-enablers.md) | Checklist de Definition of Ready (8 itens) aplicado a cada Enabler — o que falta para poder puxar para Sprint | 📝 Rascunho |

> 📌 **Como priorizar Enablers (WSJF):** a fórmula, a regra da granularidade por nível e o tratamento de Enablers/Spikes estão no [guia WSJF de priorização](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-wsjf-priorizacao.md); o template da tabela comparativa está no [template WSJF tabela](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/template-wsjf-tabela.md); o DoR, no [template Enabler · DoR](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/template-enabler-dor.md).

**Convenções desta pasta:** arquivo `ENABLER-{NNNN}-{nome-em-kebab}.md` · ID único e estável (não reutilizar número) · mudou um Enabler? Atualize o doc, o índice desta pasta, o [inventário](../../prj-produto/sprints/sprint-1-fundacao.md#1-inventário-dos-enablers) e o [PRD §6.2](../../PRD.md) no mesmo passo.
