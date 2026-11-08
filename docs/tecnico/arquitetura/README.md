# 🏗️ Arquitetura — índice dos documentos

> **Arquivo principal:** [architecture.md](architecture.md) — visão geral, estilos, regras de ouro e navegação de tudo que existe aqui.
> **Decisões:** [adrs/](adrs) (um arquivo por ADR + [INDEX](adrs/INDEX.md)) · **Integrações:** [integracoes/](integracoes) (hub + contrato OpenAPI por sistema).

| Grupo | Arquivo | Papel | Status |
|---|---|---|---|
| **Principal** | [architecture.md](architecture.md) | Visão geral + navegação (substitui o SAD waterfall 05) | ✅ v1 (2026-10-21) |
| C4 | [c4-context.md](c4-context.md) · [c4-containers.md](c4-containers.md) · [c4-components.md](c4-components.md) · [c4-code-class.md](c4-code-class.md) | Modelo C4 níveis 1–4 | ✅ v1 (2026-10-21) |
| ADRs | [adrs/INDEX.md](adrs/INDEX.md) | Registro 001–014 — um arquivo por decisão | ✅ 14/14 (2026-10-21) |
| Integrações | [integracoes/integrations.md](integracoes/integrations.md) | Hub de integrações + [integracao-cadastro-mestre](integracoes/integracao-cadastro-mestre.md) + [contratos/](integracoes/contratos) + [checklist de fechamento](integracoes/checklist-fechamento-integracoes.md) | ✅ 1/5 (PROPOSTA) · contrato em fechamento |
| Dados | [mer.md](mer.md) · [erd.md](erd.md) · [data-dictionary.md](data-dictionary.md) · [datamapping.md](datamapping.md) | Modelo relacional · diagrama ER · dicionário · mapeamento p/ sistemas externos | ✅ v1 (2026-10-21) |
| Engenharia | [devops.md](devops.md) · [testing.md](testing.md) · [cloud.md](cloud.md) · [infrastructure.md](infrastructure.md) | CI/CD+SRE · testes · cloud (SaaS Onda 4 (Produto)/Onda 5 (Plataforma)) · infraestrutura/ambientes | ✅ v1 (2026-10-21) |
| — | [diretrizes-arquitetura.md](https://github.com/fbso-techservice/platform-standards/blob/main/standards/architecture/diretrizes-arquitetura.md) | Diretrizes base (API-First, `tenant_id`, SSO, APIs REST abertas) — migrado do PRD §5 | ✅ |
| — | [checklist-arquitetura-onda-1.md](../../../projects/PRJ-SUP-2026-0000-RMR/prj-tecnico/checklist-arquitetura-onda-1.md) | **Checklist de reunião** — Tech lead/Arquiteto: 9 decisões do gate Onda 1-Must (MVP mínimo) — [hub PENDENCY-0015](../../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md) | ✅ 9/9 (2026-10-19) |
| Runways | [runways/](../../../projects/PRJ-SUP-2026-0000-RMR/prj-tecnico/runways) | **Architectural Runways da Onda 1-Must (MVP mínimo)** — `ARCH-RUNWAY-0001…0004` (capacidade + origem + quem entrega); detalhe técnico no Enabler | ✅ 4/4 (2026-10-29) |

> **Segurança** vive em [../seguranca/SECURITY.md](../seguranca/SECURITY.md) · **domínio/inventário** em [../domain.md](../domain.md) e [../inventory.md](../inventory.md).
> **Sob demanda** (LLDs de feature · integrações 2–5): lista em [architecture.md §6](architecture.md) — nascem com a entrega.
> **Insumos:** [PEDIDO](../../../projects/PRJ-SUP-2026-0000-RMR/prj-negocio/discovery/PEDIDO.md) (o quê) · [BRAINSTORM](../../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/discovery/BRAINSTORM.md) (porquê) · esta pasta (como).
