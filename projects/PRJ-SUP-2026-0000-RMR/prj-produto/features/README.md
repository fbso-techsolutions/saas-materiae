# ✨ Features — detalhamento próprio

> Cada feature Onda 1-Must (MVP mínimo)/Onda 2-Should (MVP completo)/Onda 3-Could (Integração & Valor) ganha um **feature card**: objetivo, escopo, regras de negócio, fluxo, stories e definition of done. Índice geral: [mapeamento de épicos](../rastreabilidade.md).

> 📌 **Priorização de Features (nível Programa):** ordenar por valor/urgência/risco vs. esforço com o [guia WSJF de priorização](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-wsjf-priorizacao.md) · tabela das 13 features do pipeline: [wsjf-features-pipeline](wsjf-features-pipeline.md). Features competem só entre si (nunca com Stories).

| Documento | Épico | Prioridade | Status |
|---|---|---|---|
| [FEATURE-0001.0001-recebimento-ativos.md](FEATURE-0001.0001-recebimento-ativos.md) | 1 | Onda 1-Must (MVP mínimo) | 📝 Rascunho (2026-10-16) |
| [FEATURE-0001.0003-cadastros-mestres.md](FEATURE-0001.0003-cadastros-mestres.md) | 1 | Onda 2-Should (MVP completo) | 📝 Rascunho (2026-10-16) |
| [FEATURE-0001.0004-validacao-identificador-cadastro-mestre.md](FEATURE-0001.0004-validacao-identificador-cadastro-mestre.md) | 1 | Onda 2-Should (MVP completo) | 📝 Rascunho (2026-10-16) |
| [FEATURE-0001.0005-watchlist-triagem.md](FEATURE-0001.0005-watchlist-triagem.md) | 1 | Onda 2-Should (MVP completo) | 📝 Rascunho (2026-10-16) |
| [FEATURE-0002.0001-painel-kanban-workflow.md](FEATURE-0002.0001-painel-kanban-workflow.md) | 2 | Onda 1-Must (MVP mínimo) | 📝 Rascunho (2026-10-16) |
| [FEATURE-0002.0005-expedicao.md](FEATURE-0002.0005-expedicao.md) | 2 | Onda 1-Must (MVP mínimo) *(extraída da FEATURE-0002.0001 — PENDENCY-0004)* | 📝 Rascunho (2026-10-16) |
| [FEATURE-0005.0005-travas-lgpd-compliance.md](FEATURE-0005.0005-travas-lgpd-compliance.md) | 5 | Onda 1-Must (MVP mínimo) | 📝 Rascunho (2026-10-16) |

**Convenção:** `FEATURE-{épico}.{seq}-nome-da-feature.md` (ex.: [`FEATURE-0001.0001-recebimento-ativos.md`](FEATURE-0001.0001-recebimento-ativos.md)) — padrão: [identificação de entidades](https://github.com/fbso-techservice/platform-standards/blob/main/standards/engineering/padrao-identificacao-entidades.md) · referencia o épico, as B-REQs atendidas e as user stories derivadas (com critérios de aceite em [`../user-stories/`](../user-stories)).

**Progresso:** 🗂️ **Detalhamento dos cards Onda 1-Must (MVP mínimo) completo — 4 de 4** (FEATURE-0001.0001, FEATURE-0002.0001, **FEATURE-0002.0005**, FEATURE-0005.0005 — cards existem; **conteúdo em 📝 Rascunho**, ver coluna Status) · **Onda 2-Should (MVP completo): 3 de 13 detalhadas** (FEATURE-0001.0003, FEATURE-0001.0004, FEATURE-0001.0005 — triagem) · próximas em rolling wave, na véspera de entrarem em sprint (stories 0022+).

## Convenções do card (cabeçalho · travas · fluxo)

| Onde | Regra |
|---|---|
| **Cabeçalho** | Ordem: `Projeto` (sempre a 1ª linha) · Épico · demais campos · **🔒 Travada por** (antes de `Status`) · `Status` |
| **🔒 Travada por** | travamento de **entrega** (interno): só IDs linkados — `ENABLER-…` · `ARCH-RUNWAY-…` · `PENDENCY-…` · `BLOCKER-…` · `BUG-…` · `INCIDENT-…` — ou `— (livre)`. Semântica: `Depende de` = externos de negócio · `Travada por` = o que impede construir/entregar. Pendência resolvida sai da linha e fica no histórico da §6 do card; a linha lista só bloqueios abertos. |
| **Regra do 1 salto** | o card cita **1×** o travador; a cadeia (ex.: pendência que trava um enabler) vive no doc do ID. Pendência aberta que **não trava** o trabalho atual fica só no §6 |
| **Escopo** | conta enabler que destrava o **desenvolvimento** das stories; `ENABLER-0002` (cadência) e `ENABLER-0010` (dados de demo) **não** contam. Travas mapeadas só para a Onda 1-Must (MVP mínimo): features Onda 2-Should (MVP completo) citam apenas pendências abertas — **não inferir** enabler |
| **Fluxo (§4)** | callout `> 🟥` **no topo da seção**, só quando pendência/ocorrência **altera um passo** do fluxo — estado de entrega (enabler) não entra no fluxo |
| **Espelho** | [backlog](../backlog/BACKLOG-LIST.md) coluna `Travada por` = mesmos IDs (🔒 aberto · ✅ resolvido) — quem tem visão de backlog lê lá |
| **Atualização** | planning/refinement (D1) · ritual semanal do `scripts/check-pendencias.sh` · mudança de corte de enabler |

**Quem preenche:** PM/PO no refinement do card · espelho na §2 do backlog no mesmo passo.
