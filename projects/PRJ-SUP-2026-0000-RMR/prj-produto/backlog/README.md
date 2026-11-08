# 📚 Backlog

> A **lista única** do trabalho executável ([BACKLOG-LIST](BACKLOG-LIST.md)), as **regras** que a mantêm, as **decisões** e o **escopo da Onda 1-Must (MVP mínimo)**.

| Documento | Conteúdo | Status |
|---|---|---|
| [BACKLOG-LIST.md](BACKLOG-LIST.md) | **Lista única** — 35 itens executáveis (21 user stories · 10 enablers · 4 architectural runways) + **pipeline** das 13 features ainda sem stories. Um item por linha, só com o essencial e o link do documento do item. | ✅ 2026-10-29 |
| [DECISOES-BACKLOG.md](DECISOES-BACKLOG.md) | **D-01 … D-14** — decisões de escopo, priorização e fluxo (2026-10-16/11-03), uma linha cada, com link ao detalhe | ✅ Registrado |
| [checklist-operacao-po-onda-1.md](checklist-operacao-po-onda-1.md) | **Checklist de reunião** com Operação/PO — 5 itens (PENDENCY-0004/PENDENCY-0005/PENDENCY-0006/PENDENCY-0009) com espaço para resposta/status/dono; fechar **antes da Sprint 2 (Onda 1-Must (MVP mínimo))** | ✅ Revisado — 5/5 decididas em 2026-10-16 |
| [wsjf-features-pipeline.md](../features/wsjf-features-pipeline.md) | **WSJF das 13 features do pipeline** (nível Programa) · tabela comparativa CoD ÷ Job Size para ordenar o detalhamento (rolling wave) na reunião de priorização | 📝 Proposta (2026-11-03) |

**Documentos vizinhos:** definição da Onda 1-Must (MVP mínimo) → [escopo-onda-1](../escopo-onda-1.md) · prioridades das [B-REQ](../../prj-negocio/requisitos/requisitos-negocio.md) · catálogo de features → [mapeamento de épicos](../rastreabilidade.md) · buckets do [BRAINSTORM §4.2](../discovery/BRAINSTORM.md) · capacidade → [equipe §3.2](../../equipe.md) · decisões que exigem alguém → [pendencias](../../pendencias.md).

---

## Regras da lista

### 1. O que entra

A lista tem **um item por linha** e opera no nível em que a sprint trabalha:

- **Entra como item:** **User Story** · **Enabler** · **Architectural Runway** · **Task** (saída do Planning) · **Ocorrência** (débito técnico · bug · incidente).
- **Entra no pipeline (não na tabela):** feature ainda **sem stories** — é escopo, não trabalho executável.
- **Não entra:** **Feature** e **Épico** (hierarquia, não item) · **decisão/pendência** que exige resposta de alguém → [hub](../../pendencias.md) (`PENDENCY-NNNN`).

**Por que a unidade é a user story:** é a única entidade com **estimativa** (SP) — a feature não tem. E uma sprint **pode não comportar todas as stories de uma feature**: a Onda 1-Must (MVP mínimo) tem **45 SP** para **14 SP por sprint**, ou seja ~4 sprints, não uma. Sem a story como unidade, o backlog não mostra carga.

### 2. Semântica das colunas

| Coluna | Regra |
|---|---|
| **Tipo** | `User Story` · `Enabler` · `Architectural Runway` · `Débito técnico` · `Bug` · `Incidente` (taxonomia em [padrão §2](https://github.com/fbso-techservice/platform-standards/blob/main/standards/engineering/padrao-identificacao-entidades.md#2-tabela-mestra-das-entidades)) |
| **ID** | ID da entidade, sem link — o link fica em `Contexto` |
| **Título** | descrição curta do item |
| **Contexto** | **só o link ao documento do item** (`User Story` · `Enabler` · `Architectural Runway`). Sem texto ao lado: a hierarquia vem do ID (`US-FEAT-{feature}-{SSSS}`) e o domínio da runway, do próprio card |
| **Est.** | Story → pontos (SP) · Enabler → Job Size (escala própria, **não converte** para SP) · Runway → `—` |
| **Dono** | pessoa/área que entrega · **nome completo** da pessoa (fonte única: [equipe](../../equipe.md)) · story sem dono até o planning (`—`) |
| **Entregue por** | Story e Enabler → **Sprint** que entrega, com **link ao documento da sprint** (`[S2 (02/11)](../sprints/sprint-2.md)`…) · Runway → **Enabler** que a entrega, com link ao card do enabler · `Onda 2-Should (MVP completo)` (rolling wave, sem sprint) → sem link |
| **Depende de** | Story → outra(s) **story** · Enabler → outro(s) **enabler** — sempre com o **nome do item + link** ao documento dele (ex.: `[0001 — Registrar recebimento de ativo na triagem](…)`) |
| **Travada por** | o que **impede construir/entregar** (enabler, pendência, bug) — não é dependência de negócio. **Ícone por linha:** 🔒 não resolvido · ✅ resolvido. O ID aponta para o **documento de detalhe** (a Origem no hub). Depois do corte da sprint, registra só o que ainda trava |
| **Status** | Camada grossa — ⬜ A fazer · 🔄 Em execução · ✅ Entregue · 🕓 Adiada · ❌ Cancelada (§3) |

**Princípio: coluna só para o que não é derivável.** Foi por isso que `Faixa` (Onda 1-Must (MVP mínimo)/Onda 2-Should (MVP completo)/Onda 3-Could (Integração & Valor)) saiu dos itens — ela repetia `Entregue por` (Onda 1-Must (MVP mínimo) × Onda 2-Should (MVP completo)) e, nos enablers, repetia a própria sprint e o status. A prioridade de origem vive no card/B-REQ e na `Faixa` do **pipeline**.

### 3. Status em duas camadas

A **lista** responde *onde o item está na gestão* com **5 estados**; o **board da sprint** responde *onde ele está na execução* com **11**. O board é um documento por sprint (`board-sprint-{NNNN}.md`): regras, WIP, fluxo por tipo e matriz de transição em [sprints/README §Board da sprint](../sprints/README.md#board-da-sprint); o da Sprint 1 é [board-sprint-0001](../sprints/board-sprint-0001.md).

| Status da lista | Significa | Corresponde no board a |
|---|---|---|
| ⬜ **A fazer** | Está na lista, ainda não puxado | `Backlog priorizado` · `Em Refinamento` · `Pronto p/ Dev` |
| 🔄 **Em execução** | Puxado, ainda não entregue | `Em Dev` · `Em Review` · `Em Correção` · `Em Testes` · `Em Homologação` · `Pronto p/ Deploy` · `Em Deploy` |
| ✅ **Entregue** | DoD cumprida e **em produção** (smoke test) | `Concluído` |
| 🕓 **Adiada** | Fora deste horizonte; pode voltar | — |
| ❌ **Cancelada** | Não será feito; o ID não é reutilizado | — |

**Runways e ocorrências** seguem o fluxo do seu tipo (runway: `Em execução → Em validação → Concluído`; bug/incidente: fluxo reduzido) — a correspondência grossa é a mesma: `Em execução`/`Em validação` → 🔄, `Concluído` → ✅. Fluxos por tipo: [sprints/README](../sprints/README.md#fluxo-por-tipo).

**Regras:**

- **`✅ Entregue` exige evidência** — DoD do card + smoke test em produção. Prazo vencido **não** é entrega.
- **Bloqueio não é status.** O item permanece no estado em que está e a trava vai para `Travada por` (🔒 não resolvido · ✅ resolvido) — assim ele não sai do fluxo e o tempo bloqueado não desaparece das métricas.
- **`🔵 Comprometido` e `🟡 Iniciado` saíram (2026-10-29).** O compromisso já está em `Entregue por` (`S1`…`S5`); "puxado e não entregue" é `🔄 Em execução`.
- **Enum fechado.** Só os 5 valores acima — "em ajustes", "quase pronto" e afins não existem.
- **Cada gate tem dono:** dev → review · revisor → testes · QA → homologação · PO/Operação → aceite · DevOps → deploy. Quem move o quê está na [matriz](../sprints/README.md#board-da-sprint).
- **Gate de documentação (DoR):** uma **user story** só é puxada para sprint/`Em Dev` quando o `Status` do **documento** da story estiver `✅ Revisado`/`Aprovado`/`Concluído` (documentação finalizada — [guia §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)). Story com doc em `Rascunho`/`Em formação` fica fora do fluxo de execução.
- **Migração:** os 35 itens foram remapeados em 2026-10-29 (21 `A fazer` · 14 `Em execução`); a confirmação item a item dos 14 da Sprint 1 foi fechada na review de 30/10 — [PENDENCY-0033](../../pendencias.md) ✅.

**Do vocabulário proposto ao implementado (2026-10-29):**

| Proposta original | Implementado | Por quê |
|---|---|---|
| `Backlog` (em documentação) | Fora da lista até ter card · `Backlog priorizado` | item em documentação **não entra na lista** — a regra de entrada exige card |
| `Pronto para Refinamento` | `Backlog priorizado` + `Em Refinamento` | WSJF é **priorização**; refinamento é o shaping do item |
| `Refinamento` (planning + tasks) | `Em Refinamento` → `Pronto p/ Dev` | o planning fecha o DoR e define tasks/dono/plano de teste |
| `Desenvolvimento` | `Em Dev` | nome de estado, não de fase |
| `Code Review` | `Em Review` | idem |
| `Correção` | `Em Correção` **com origem** | loop rastreável, volta ao gate que reprovou |
| `Testes/Homologação` | `Em Testes` + `Em Homologação` | donos diferentes (QA × PO/Operação) |
| `Pronto para Deploy` | `Pronto p/ Deploy` | — |
| `Deploy` | `Em Deploy` → `Concluído` | faltava o **terminal** (deploy é processo, não resultado) |
| — | `Bloqueado` (marcador) | usa `Travada por` (🔒/✅), não é coluna de status |

### 4. Pipeline de features sem stories

- Fecha a lista com as features ainda **não detalhadas em stories** e **sem card próprio** (rolling wave).
- Colunas: `Feature · Faixa · B-REQ · R · Travada por` — a `Faixa` (`Onda 1-Must (MVP mínimo)` / `Onda 2-Should (MVP completo)` / `Onda 3-Could (Integração & Valor)`) existe **só aqui**, porque essas features não têm sprint.
- **Regra de saída:** quando a feature for detalhada, ela sai do pipeline e entram as stories na tabela de itens. O pipeline não guarda histórico.

### 5. Ocorrências

- Débito técnico, bug e incidente entram na **mesma tabela de itens**, com o `Tipo` correspondente — quadro aberto desde o primeiro item.
- Se uma ocorrência travar um item, o ID dela vai para `Travada por` (um salto: aponta, não copia).
- Ocorrência que exige **decisão** de alguém não entra: vira [PENDENCY](../../pendencias.md).

### 6. Prioridade, horizonte e capacidade

- **Prioridade de origem:** `Onda 1-Must (MVP mínimo)` (Onda 1-Must (MVP mínimo)) · `Onda 2-Should (MVP completo)` (MVP) · `Onda 3-Could (Integração & Valor)` (Onda 3-Could (Integração & Valor)), herdada da B-REQ — aplicada nas [D-01 … D-14](DECISOES-BACKLOG.md). Não é coluna dos itens.
- **Horizonte:** `Entregue por` — `S1`…`S5` para a Onda 1-Must (MVP mínimo), `Onda 2-Should (MVP completo)` (rolling wave, sem sprint alocado) para o resto.
- **Capacidade:** **14 SP/sprint** ([equipe §3.2](../../equipe.md)) · sprint de 2 semanas · S1 19–30/10 · S2 02/11 · S3 16/11 · S4 30/11 · S5 14/12.
- **Fatiamento S2–S5 validado (2026-10-30):** S2 (0001–0004 · 14 SP) · S3 (0005–0007 · 10) · S4 (0008–0011 · 14) · S5 (0012–0013 · 7) — [PENDENCY-0032](../../pendencias.md); detalhe em [escopo-onda-1](../escopo-onda-1.md).

### 7. Manutenção

| Mudou | O que atualizar |
|---|---|
| Item novo (qualquer tipo) | Linha na tabela de itens, no mesmo passo |
| Feature detalhada em stories | Sai do pipeline; entram as stories |
| Ordem/corte | `Entregue por` (sprint) e, se for feature sem story, a `Faixa` do pipeline |
| Status mudou no board | Atualizar a camada grossa na lista, no mesmo passo (mapping em §3) |
| Escopo da Onda 1-Must (MVP mínimo) | [escopo-onda-1](../escopo-onda-1.md) + [PRD §6.2](../../PRD.md) |
| Decisão de escopo/priorização | Linha em [DECISOES-BACKLOG](DECISOES-BACKLOG.md) — não no corpo da lista |

**Regra de ouro:** a lista guarda **prioridade/status/link**; a especificação mora no documento do item. **Aponta, não copia.**

### 8. Critérios de priorização

1. **Prioridade da B-REQ dona** — Alta (MVP) × Média (Onda 3-Could (Integração & Valor)).
2. **Bucket do BRAINSTORM §4.2** — MVP Core / Stretch / Adiado.
3. **Fatiamento vertical** — priorizar o que fecha o ciclo do item ponta a ponta e o que tem maior risco técnico (workflow e compliance primeiro).
4. **Dependências externas** (integrações com sistemas chamados) podem ficar fora do **Onda 1-Must (MVP mínimo)**, mas não do **MVP**.

> 📌 **Priorização econômica (WSJF):** para ordenar itens por valor/urgência/risco vs. esforço, use o [guia WSJF de priorização](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-wsjf-priorizacao.md). Regra da granularidade: Features competem no nível Programa, Stories/Enablers no nível Time; e a alocação de capacidade protege a fatia de Enablers de fundação.

### 9. De onde veio cada coisa

O antigo `BACKLOG-LIST` (140 linhas, 6 seções) foi separado em 2026-10-29 para virar lista:

| Conteúdo antigo | Onde vive agora |
|---|---|
| §1 Critérios de priorização | este README (§8) |
| §2 Tabela priorizada de features | tabela de itens + pipeline do [BACKLOG-LIST](BACKLOG-LIST.md) |
| §3 Definição da fatia Onda 1-Must (MVP mínimo) | [escopo-onda-1](../escopo-onda-1.md) |
| §4 Decisões registradas | [DECISOES-BACKLOG](DECISOES-BACKLOG.md) (D-01…D-14) |
| §5 Próximo passo | [sprints/README](../sprints/README.md) |
| §6.1 Tipos e IDs | [padrão de identificação](https://github.com/fbso-techservice/platform-standards/blob/main/standards/engineering/padrao-identificacao-entidades.md) |
| §6.2 Enablers | [sprint-1-fundacao](../sprints/sprint-1-fundacao.md) |
| §6.3 Architectural Runways | [arquitetura/runways](../../prj-tecnico/runways/README.md) |
| §6.4 Quadros de débito/bug/incidente | tabela de itens do [BACKLOG-LIST](BACKLOG-LIST.md) |
