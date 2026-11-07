# 🗂️ Board — Sprint 2 (Onda 1-Must · 0001–0004) · 02/11 – 13/11/2026

> **O que é:** a **camada fina** de status da Sprint 2 — 7 itens (4 user stories + 2 enablers em continuidade + 1 architectural runway). A camada grossa está no [BACKLOG-LIST](../backlog/BACKLOG-LIST.md); as regras do fluxo, em [sprints/README §Board da sprint](README.md#board-da-sprint).
> **Planejamento (02/11):** corte validado ([PENDENCY-0032](../../pendencias.md) ✅) — stories 0001–0004 (14 SP) + conclusão de ENABLER-0006 (04/11) e ENABLER-0010 (05/11), herdados da Sprint 1. **Donos das stories propostos** conforme [equipe §3.1](../../equipe.md) (Bruno Oliveira = backend · Manoel Carlos = frontend) — confirmar no planning.
> **Legenda `Check`:** 💡 aguardando/ready · 👷 em execução · 🏁 concluído.

| Campo | Valor |
|---|---|
| **Sprint** | 02/11 – 13/11/2026 · 10 dias úteis |
| **Escopo** | 4 stories (0001–0004 · 14 SP) + 2 enablers em continuidade + 1 runway |
| **WIP `Em Dev`** | **1** (Bruno Oliveira 1 · Manoel Carlos 0) · limite 2/dev |
| **Runways** | fluxo próprio (não consomem WIP de dev) |
| **Atualizado** | 2026-11-05 |

## Itens

| Check | Item | Estado | Dono | Depende de | Tasks | Próxima ação | Evidência |
|---|---|---|---|---|---|---|---|
| 👷 | [US-FEAT-0001.0001-0001](../user-stories/US-FEAT-0001.0001-0001-registro-recebimento-ativo.md) — Registrar recebimento de ativo na triagem | `Em Dev` | Bruno Oliveira | — | — | Abrir PR | — |
| 💡 | [US-FEAT-0001.0001-0002](../user-stories/US-FEAT-0001.0001-0002-defeito-reclamado-recebimento.md) — Registrar defeito reclamado no recebimento | `Pronto p/ Dev` | Bruno Oliveira | 0001 | — | Puxar para `Em Dev` após 0001 | — |
| 💡 | [US-FEAT-0001.0001-0003](../user-stories/US-FEAT-0001.0001-0003-direcionamento-para-proxima-etapa.md) — Direcionar o item para a próxima etapa após a triagem | `Pronto p/ Dev` | Bruno Oliveira | 0001 | — | Puxar para `Em Dev` após 0001 | — |
| 💡 | [US-FEAT-0002.0001-0004](../user-stories/US-FEAT-0002.0001-0004-painel-kanban.md) — Ver o painel Kanban com os itens por etapa | `Pronto p/ Dev` | Manoel Carlos | ENABLER-0006 | — | Aguardar ENABLER-0006 | — |
| 👷 | [ENABLER-0006](../../prj-tecnico/enablers/ENABLER-0006-workflow-tabela-configuracao.md) — Workflow em tabela de configuração | `Em Review` | Bolismar da Silva + Bruno Oliveira | — | — | Linkar PR + teste verde + deploy em homolog | [DoD parcial](https://docs.google.com/spreadsheets/d/1ufP1F5zNVEi0znMOKg3xmKoB271qlol6LwfSnirLaxs/edit?usp=drive_link) |
| 👷 | [ENABLER-0010](../../prj-tecnico/enablers/ENABLER-0010-dados-iniciais-homologacao.md) — Dados iniciais de homologação | `Em Review` | Patricia Varra + Carlos Mattos | — | — | Linkar PR + teste verde + deploy em homolog | [DoD parcial](https://docs.google.com/spreadsheets/d/1GIMZP6OHZQ0ioaotS80gJcjbtyugbVpQ3iGNhum0cg8/edit?usp=drive_link) |
| 👷 | [ARCH-RUNWAY-0003](../../prj-tecnico/runways/ARCH-RUNWAY-0003-workflow-tabela-configuracao.md) — Tabela de configuração de workflow | `Em execução` | Bolismar da Silva + Bruno Oliveira (via ENABLER-0006) | ENABLER-0006 | — | Aguardar DoD do ENABLER-0006 | — |

**Resumo:** `Em Dev` 1 (story) · `Em Review` 2 (ENABLER-0006/0010) · `Em execução` (runway) 1 (workflow) · `Pronto p/ Dev` 3 · `Concluído` 0 · `Em Testes` 0 · bloqueados 0.

**Compromisso da sprint:** `14 SP` (stories) · `Job Size 5` (enablers) · `159h` (tasks).

## Tasks (saída do Planning)

> **Tasks do Planejamento.** Definidas no Planning: cada item (story/enabler/runway/débito/bug/incidente) é decomposto em `TASK-{NNNN}` (global). O deploy/homologação fica no nível do **item** que originou a task, não da task. Base: tabela da [matriz de rastreabilidade](../rastreabilidade.md).

| Check | Task | Origem | Status | Esforço (h) | Previsão início | Previsão término | Dono | Evidência |
|---|---|---|---|---|---|---|---|---|
| 💡 | TASK-0001 — Engine de máquina de estados + API de transição | [ENABLER-0006 — Workflow em tabela de configuração](../../prj-tecnico/enablers/ENABLER-0006-workflow-tabela-configuracao.md) | `Planejada` | 12 | — | — | Francisco Oliveira (+ Bolismar da Silva, revisão) | — |
| 💡 | TASK-0002 — Tabelas ETAPA/TRANSICAO + configuração mínima | [ENABLER-0006 — Workflow em tabela de configuração](../../prj-tecnico/enablers/ENABLER-0006-workflow-tabela-configuracao.md) | `Planejada` | 4 | — | — | Bruno Oliveira (+ Carlos Mattos) | — |
| 💡 | TASK-0003 — Validação server-side (pré-condições + perfis) | [ENABLER-0006 — Workflow em tabela de configuração](../../prj-tecnico/enablers/ENABLER-0006-workflow-tabela-configuracao.md) | `Planejada` | 8 | — | — | Francisco Oliveira | — |
| 💡 | TASK-0004 — Integração da auditoria automática | [ENABLER-0006 — Workflow em tabela de configuração](../../prj-tecnico/enablers/ENABLER-0006-workflow-tabela-configuracao.md) | `Planejada` | 4 | — | — | Bruno Oliveira | — |
| 💡 | TASK-0005 — Seed idempotente das etapas/transições | [ENABLER-0006 — Workflow em tabela de configuração](../../prj-tecnico/enablers/ENABLER-0006-workflow-tabela-configuracao.md) | `Planejada` | 2 | — | — | Bruno Oliveira | — |
| 💡 | TASK-0006 — Testes automatizados (DoD) | [ENABLER-0006 — Workflow em tabela de configuração](../../prj-tecnico/enablers/ENABLER-0006-workflow-tabela-configuracao.md) | `Planejada` | 8 | — | — | Patricia Varra | — |
| 💡 | TASK-0007 — Seed do catálogo mínimo (defeitos + serviços) | [ENABLER-0010 — Dados iniciais de homologação](../../prj-tecnico/enablers/ENABLER-0010-dados-iniciais-homologacao.md) | `Planejada` | 5 | — | — | Carlos Mattos | — |
| 💡 | TASK-0008 — Seed do modelo serializado + flag de mídia | [ENABLER-0010 — Dados iniciais de homologação](../../prj-tecnico/enablers/ENABLER-0010-dados-iniciais-homologacao.md) | `Planejada` | 3 | — | — | Carlos Mattos | — |
| 💡 | TASK-0009 — Usuários de homolog no Keycloak | [ENABLER-0010 — Dados iniciais de homologação](../../prj-tecnico/enablers/ENABLER-0010-dados-iniciais-homologacao.md) | `Planejada` | 2 | — | — | Patricia Varra (+ Carlos Mattos) | — |
| 💡 | TASK-0010 — Script de carga + documentação README | [ENABLER-0010 — Dados iniciais de homologação](../../prj-tecnico/enablers/ENABLER-0010-dados-iniciais-homologacao.md) | `Planejada` | 3 | — | — | Carlos Mattos | — |
| 💡 | TASK-0011 — Validação (item ponta a ponta + login) | [ENABLER-0010 — Dados iniciais de homologação](../../prj-tecnico/enablers/ENABLER-0010-dados-iniciais-homologacao.md) | `Planejada` | 4 | — | — | Patricia Varra | — |
| 💡 | TASK-0012 — Backend — registrar recebimento (item TRIAGEM + obrigatórios + duplicidade + auditoria) | [US-FEAT-0001.0001-0001 — Registrar recebimento de ativo na triagem](../user-stories/US-FEAT-0001.0001-0001-registro-recebimento-ativo.md) | `Planejada` | 16 | — | — | Bruno Oliveira | — |
| 💡 | TASK-0013 — Frontend — tela de recebimento (leitor focado, sem mouse) | [US-FEAT-0001.0001-0001 — Registrar recebimento de ativo na triagem](../user-stories/US-FEAT-0001.0001-0001-registro-recebimento-ativo.md) | `Planejada` | 8 | — | — | Manoel Carlos | — |
| 💡 | TASK-0014 — Testes — 4 cenários | [US-FEAT-0001.0001-0001 — Registrar recebimento de ativo na triagem](../user-stories/US-FEAT-0001.0001-0001-registro-recebimento-ativo.md) | `Planejada` | 8 | — | — | Carlos Mattos | — |
| 💡 | TASK-0015 — Backend — associar defeito reclamado (catálogo mínimo) | [US-FEAT-0001.0001-0002 — Registrar defeito reclamado no recebimento](../user-stories/US-FEAT-0001.0001-0002-defeito-reclamado-recebimento.md) | `Planejada` | 8 | — | — | Bruno Oliveira | — |
| 💡 | TASK-0016 — Frontend — seleção do defeito (teclado) | [US-FEAT-0001.0001-0002 — Registrar defeito reclamado no recebimento](../user-stories/US-FEAT-0001.0001-0002-defeito-reclamado-recebimento.md) | `Planejada` | 4 | — | — | Manoel Carlos | — |
| 💡 | TASK-0017 — Testes — 3 cenários | [US-FEAT-0001.0001-0002 — Registrar defeito reclamado no recebimento](../user-stories/US-FEAT-0001.0001-0002-defeito-reclamado-recebimento.md) | `Planejada` | 4 | — | — | Patricia Varra | — |
| 💡 | TASK-0018 — Backend — transição TRIAGEM → TESTE/SUCATA (engine ENABLER-0006) | [US-FEAT-0001.0001-0003 — Direcionar o item para a próxima etapa após a triagem](../user-stories/US-FEAT-0001.0001-0003-direcionamento-para-proxima-etapa.md) | `Planejada` | 12 | — | — | Francisco Oliveira | — |
| 💡 | TASK-0019 — Backend — trava LGPD na rota de sucata (BR-1.1.7) | [US-FEAT-0001.0001-0003 — Direcionar o item para a próxima etapa após a triagem](../user-stories/US-FEAT-0001.0001-0003-direcionamento-para-proxima-etapa.md) | `Planejada` | 8 | — | — | Bolismar da Silva | — |
| 💡 | TASK-0020 — Frontend — escolha da rota (teclado) | [US-FEAT-0001.0001-0003 — Direcionar o item para a próxima etapa após a triagem](../user-stories/US-FEAT-0001.0001-0003-direcionamento-para-proxima-etapa.md) | `Planejada` | 4 | — | — | Manoel Carlos | — |
| 💡 | TASK-0021 — Testes — 4 cenários | [US-FEAT-0001.0001-0003 — Direcionar o item para a próxima etapa após a triagem](../user-stories/US-FEAT-0001.0001-0003-direcionamento-para-proxima-etapa.md) | `Planejada` | 8 | — | — | Patricia Varra | — |
| 💡 | TASK-0022 — Frontend — painel Kanban (colunas, cartões, polling, teclado) | [US-FEAT-0002.0001-0004 — Ver o painel Kanban com os itens por etapa](../user-stories/US-FEAT-0002.0001-0004-painel-kanban.md) | `🔒 Bloqueada (ENABLER-0006)` | 16 | — | — | Manoel Carlos | — |
| 💡 | TASK-0023 — Testes — 3 cenários | [US-FEAT-0002.0001-0004 — Ver o painel Kanban com os itens por etapa](../user-stories/US-FEAT-0002.0001-0004-painel-kanban.md) | `🔒 Bloqueada (ENABLER-0006)` | 8 | — | — | Patricia Varra | — |

**Total de esforço:** `159h` (23 tasks).

## Capacidade

| Recurso | Papel | Horas (tasks) | Disponibilidade | Saldo |
|---|---|---|---|---|
| Francisco Oliveira | Tech lead | 32h | ~34h | +2h |
| Bruno Oliveira | Backend | 34h | ~34h | 0h |
| Manoel Carlos | Frontend | 32h (16h 🔒) | ~34h | +2h |
| Patricia Varra | QA | 34h (8h 🔒) | ~34h | 0h |
| Carlos Mattos | Dados | 19h | ~34h | +15h |
| Bolismar da Silva | Arquiteto | 8h | ~34h | +26h |

> Disponibilidade = 6 dias úteis restantes × ~5,6h líquidas/dia (8h × 70% foco). 🔒 = horas em tasks bloqueadas por ENABLER-0006 (deferidas até o enabler terminar). SP é do **item** (seção `## Itens`); horas são do **recurso** (aqui).

## Fechamento (review de 13/11)

- [ ] Confirmar a posição dos 7 itens e **anexar a evidência** (PR, teste, script).
- [ ] Mover para `Concluído` só com **DoD do card + smoke test**; refletir na camada grossa ([BACKLOG-LIST](../backlog/BACKLOG-LIST.md)) para `✅ Entregue`.
- [ ] Registrar **métricas**: itens concluídos / total · lead time · cycle time · throughput · WIP age · rework rate · escape rate.
- [ ] Abrir o board da Sprint 3 (`board-sprint-0003.md`) no planning de 16/11.

> 🔁 **Regra viva:** mudou a posição de um item? Atualize este board **e** a camada grossa ([BACKLOG-LIST](../backlog/BACKLOG-LIST.md)) no mesmo passo. Semana a semana: `scripts/check-pendencias.sh`.
