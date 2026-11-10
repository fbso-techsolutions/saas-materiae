# 🗓️ Sprints

> Ciclo de planejamento e execução das sprints do projeto. **Estado atual:** **Sprint 1 — Fundação (19–30/10) concluída (review de 30/10)** · **Sprint 2 (02–13/11) em andamento** — stories 0001–0004 + conclusão de ENABLER-0006/0010, com fatiamento S2–S5 **validado**. A **posição item a item** está no [board da Sprint 2](board-sprint-0002.md).

| # | Documento | O que responde | Status |
|---|---|---|---|
| 1 | [Sprint 1 — Fundação (Enablers) · 19–30/10](sprint-1-fundacao.md) | Inventário dos Enablers iniciais (ENABLER-0001…ENABLER-0010 — o que cada um habilita, Job Size/WSJF, segunda onda) + corte da sprint (opção (c): 8 comprometidos + 2 iniciados), donos, prazos, caminho crítico, riscos e impacto no negócio (features começam na Sprint 2 — 02/11) · detalhamento individual: [tecnico/enablers/](../../prj-tecnico/enablers) | ✅ Concluída (2026-10-30) — 8 enablers 🔵 + 3 runways entregues; ENABLER-0006/0010 em continuidade na S2 |
| 2 | [Sprint 2 — 02/11](sprint-2.md) | Corte **proposto** (0001–0004 · 14 SP) + conclusão de ENABLER-0006/ENABLER-0010 · fatiamento em [escopo-onda-1.md](../escopo-onda-1.md) | ✅ Validado (2026-10-30) |
| 3 | [Sprint 3 — 16/11](sprint-3.md) | Corte **proposto** (0005–0007 · 10 SP) | ✅ Validado (2026-10-30) |
| 4 | [Sprint 4 — 30/11](sprint-4.md) | Corte **proposto** (0008–0011 · 14 SP) | ✅ Validado (2026-10-30) |
| 5 | [Sprint 5 — 14/12](sprint-5.md) | Corte **proposto** (0012–0013 · 7 SP) — fecha o ciclo da Onda 1-Must (MVP mínimo) | ✅ Validado (2026-10-30) |
| 6 | [Board — Sprint 1](board-sprint-0001.md) | **Camada fina do status**: posição, dono, próxima ação e evidência dos 14 itens (10 enablers + 4 runways) · posição confirmada na review de 30/10 ([PENDENCY-0033](../../pendencias.md) ✅) | ✅ Fechado (30/10) |
| 7 | [Board — Sprint 2](board-sprint-0002.md) | **Camada fina do status**: posição, dono, próxima ação e evidência dos 7 itens (4 stories + 2 enablers + 1 runway) · aberto no planning de 02/11 | 🔄 Em andamento (02–13/11) |

**Convenções desta pasta:** sprint = **2 semanas** (decidida com o PO — [PENDENCY-0016 ✅](../../equipe.md)); capacidade alocada conforme [guia ágil §4](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md) (capacity allocation + WSJF + dependências). Mudou um doc? Atualize este índice e o [PRD §6.2](../../PRD.md) no mesmo passo.

## Board da sprint

> A **camada fina** do status. O [BACKLOG-LIST](../../../../docs/produto/backlog/BACKLOG-LIST.md) mostra **5 estados de gestão**; o board mostra as **etapas de execução** de uma sprint, com dono, próxima ação e evidência. **Um documento por sprint:** `board-sprint-{NNNN}.md`.
> **Regra:** o board **não copia** a especificação — registra posição, dono, próxima ação e o link da evidência. Mudou a posição? Atualize o board **e** a camada grossa na lista, no mesmo passo ([mapping](../backlog/README.md#3-status-em-duas-camadas)).

### Etapas e critérios de saída

| # | Estado | Quem move para cá | Critério de saída (binário) |
|---|---|---|---|
| 0 | `Backlog priorizado` | PO | WSJF calculado + card existe |
| 1 | `Em Refinamento` | PO + Tech lead | AC binários, estimativa, dependências e dúvidas fechadas |
| 2 | `Pronto p/ Dev` | Tech lead (planning) | DoR + tasks + dono + plano de teste |
| 3 | `Em Dev` | dev (pull, respeitando WIP) | PR aberto + CI verde + AC demonstráveis |
| 4 | `Em Review` | dev (fim do desenvolvimento) | Aprovado, zero thread aberta |
| 5 | `Em Correção` | revisor · QA · PO · DevOps (quem reprovou) | Defeito fechado **e** gate de origem reexecutado |
| 6 | `Em Testes` | revisor (aprovação) | Plano executado, zero bloqueante |
| 7 | `Em Homologação` | QA (testes concluídos) | Aceite registrado com evidência (PO/Operação) |
| 8 | `Pronto p/ Deploy` | PO/Operação (aceite) | Release notes + artefato versionado |
| 9 | `Em Deploy` | DevOps (janela) | Smoke test em produção |
| 10 | `Concluído` | DevOps (smoke test verde) | DoD + evidência arquivada |

**Correção com origem:** todo item em `Em Correção` carrega a origem (`review` · `testes` · `homologação` · `deploy`) e **volta ao gate que reprovou** — nunca direto para `Em Dev`. Falha em `Em Deploy` → `Em Correção` + rollback.

### Fluxo por tipo

| Tipo | Fluxo | Observação |
|---|---|---|
| **User Story** | completo (0–10) | — |
| **Enabler** | completo, **sem** `Em Homologação` | usa `Em Homologação` só quando o DoD exige validação com Operação/usuário (ex.: spike) |
| **Architectural Runway** | próprio: `Backlog priorizado → Em execução → Em validação → Concluído` | `Concluído` só com o DoD do **enabler que entrega** fechado |
| **Débito técnico** | igual ao Enabler | — |
| **Bug** | `Backlog priorizado → Em Dev → Em Review → Em Testes → Pronto p/ Deploy → Em Deploy → Concluído` | sem refinamento; homologação só se visível ao usuário |
| **Incidente** | `Backlog priorizado → Em Dev → Em Review → Em Deploy → Concluído` | teste de regressão + postmortem no card |
| **Task** | `Planejada (Planning) → Em Dev → Em Review → Em Testes → Concluído` | derivada do item no Planning; deploy/homologação ficam no nível do **item** (story/enabler), não da task |

**Bloqueado não é coluna:** o item fica onde está e a trava vai para `Travada por` (lista) e para a evidência do board.

### WIP e fluxo

| Etapa | Limite |
|---|---|
| `Em Dev` | **2 por dev ativo** |
| `Em Review` | 2 |
| `Em Testes` | 2 |
| `Em Homologação` | 2 (disponibilidade do PO/Operação) |
| `Em Refinamento` | lote semanal (não é fila contínua) |

- **Pull, não push:** o dev puxa de `Pronto p/ Dev`; ninguém é alocado por cima do WIP.
- **Item parado > 3 dias úteis** ganha flag no board e entra na review.
- **Transição automática onde der:** CI/CD move `Em Dev → Em Review` (PR aberto) e `Em Deploy → Concluído` (deploy verde). Status digitado à mão envelhece.
- **Métricas na review:** lead time (entrada → `Concluído`), cycle time (`Em Dev` → `Concluído`), throughput, WIP age, **rework rate** (correções ÷ itens) e **escape rate** (bugs pós-deploy).
- **Jira (futuro):** o vocabulário nasce agnóstico; na migração, as etapas viram colunas e as regras de WIP/transição viram workflow.

### Formato do documento

**`## Itens`** — uma linha por item, com `Check` (ícone de andamento) e as colunas de gestão:

| Check | Item | Estado | Dono | Depende de | Tasks | Próxima ação | Evidência |
|---|---|---|---|---|---|---|---|
| 👷 | [US-FEAT-0002.0001-0004](../user-stories/US-FEAT-0002.0001-0004-painel-kanban.md) — Ver o painel Kanban com os itens por etapa | `Em Dev` | Manoel Carlos | — | — | Abrir PR | — |

**`## Tasks`** — seção separada (saída do Planning), uma linha por task:

| Check | Task | Origem | Status | Esforço (h) | Previsão início | Previsão término | Dono | Evidência |
|---|---|---|---|---|---|---|---|---|

**Regras de exibição:**
- **`Check`** (1ª coluna) = ícone de andamento: 💡 aguardando/ready · 👷 em execução · 🏁 concluído.
- **`Depende de`** e **`Origem`** = sempre **código + nome + link** do item referenciado — nunca o código solto.
- **`Tasks`** = IDs das tasks (`TASK-{NNNN}`) que atendem ao item.
- **`Esforço (h)`** = esforço estimado em **horas** no Planning — base para comparação futura (estimado × real).
- **`Dono`** = nome completo (fonte: [equipe](../../equipe.md)).

No topo: período, escopo, WIP e a nota de migração. No fim: fechamento da sprint com métricas e evidências.

## Estado e próximo passo

- **Sprint 1 (19–30/10)** — fundação: 4 Architectural Runways + 10 Enablers, zero features e zero stories. Gates ① (stack, 9/9) e ② (capacidade) fechados em 2026-10-19. **Concluída na review de 30/10:** 8 enablers 🔵 + 3 runways `✅ Entregue` ([board](board-sprint-0001.md) · [PENDENCY-0033](../../pendencias.md) ✅).
- **Sprint 2 (02–13/11)** — em andamento: 4 stories (0001–0004 · 14 SP) + conclusão de ENABLER-0006/0010 ([board](board-sprint-0002.md)).
- **Rolling wave:** Onda 1-Must (MVP mínimo) detalhado em stories (0001–0013) · Onda 2-Should (MVP completo) iniciado (FEATURE-0001.0003/0004/0005 → 0014–0021) · próximas Onda 2-Should (MVP completo) detalham na véspera da sprint (a partir de **0022**). Itens e pipeline: [BACKLOG-LIST](../../../../docs/produto/backlog/BACKLOG-LIST.md).
- ✅ **Validado (2026-10-30):** fatiamento da Onda 1-Must (MVP mínimo) em S2–S5 (45 SP ÷ 14 SP/sprint) — [escopo da Onda 1-Must (MVP mínimo)](../escopo-onda-1.md), [PENDENCY-0032](../../pendencias.md).
- ✅ Verificação do servidor executada (risco 5 da [Sprint 1 §4](sprint-1-fundacao.md) — PENDENCY-0021).
