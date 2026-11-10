# 📚 Backlog do produto — a fila única

> Regras e semântica do [BACKLOG-LIST.md](BACKLOG-LIST.md): o que entra, as **15 colunas**, o ciclo de vida (`Check`) e a execução (`Status`). Âmbito **produto** — vale para todos os projetos.

## 1. O que entra

A lista tem **um item por linha** e opera no nível em que a sprint trabalha:

- **Entra como item:** **User Story** · **Enabler** · **Architectural Runway** · **Task** (saída do Planning) · **Ocorrência** (débito técnico · bug · incidente).
- **Entra como linha de demanda:** **Feature** ainda **sem stories**: entra na mesma tabela como `Tipo=Feature`, `Check=💡` (gatilho para o PM/PO escrever as stories).
- **Não entra:** **Épico** (hierarquia, não item) · **decisão/pendência** que exige resposta de alguém → hub de pendências do projeto.

**Por que a unidade é a user story:** é a única entidade com **estimativa** (SP) — a feature não tem. E uma sprint pode não comportar todas as stories de uma feature.

## 2. Semântica das colunas

| Coluna | Regra |
|---|---|
| **Check** | ciclo de vida (🚩💡👷🏁🚫): **derivado** de `Status` + `Entregue por` + `Tipo` (tabela abaixo); nunca preenchido à mão |
| **Projeto** | código + link do projeto (`PRJ-…`): origem do item (essencial com múltiplos projetos) |
| **Feature** | código + link da feature pai (`FEATURE-{épico}.{NNNN}`); enablers/runways ficam `—`; o épico fica codificado na feature (não há coluna `Épico`) |
| **Tipo** | `User Story` · `Enabler` · `Architectural Runway` · `Débito técnico` · `Bug` · `Incidente` · `Feature` (demanda): taxonomia em [padrão §2](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/padrao-identificacao-entidades.md#2-tabela-mestra-das-entidades) |
| **ID** | ID da entidade, sem link: o link fica em `Contexto` |
| **Título** | descrição curta do item |
| **Contexto** | link ao documento do item; em feature sem card, a **B-REQ/R** que ela satisfaz |
| **Est.** | Story → pontos (SP) · Enabler → Job Size (escala própria, **não converte** para SP) · Runway/Feature → `—` |
| **Dono** | pessoa/área que entrega · **nome completo** (fonte: equipe do projeto) · sem dono até o planning (`—`) |
| **Entregue por** | Story e Enabler → **Sprint** com **link** · Runway → **Enabler** que a entrega · Feature → **horizonte** (`Onda …`) · rolling wave sem link |
| **Depende de** | Story → outra(s) **story** · Enabler → outro(s) **enabler**: sempre com **nome + link** |
| **Travada por** | o que **impede construir/entregar** (enabler, pendência, bug): não é dependência de negócio. **Ícone:** 🔒 não resolvido · ✅ resolvido |
| **Status** | execução: ⬜ A fazer · 🔄 Em execução · ✅ Entregue · 🕓 Adiada · ❌ Cancelada (§3) |
| **Task** | código + link da task que resolveu/implantou o item (rolling wave `—`) |
| **Release** | código + link da release que resolveu/implantou o item (rolling wave `—`) |

**Regra de derivação do `Check`:**

| Check | Derivação |
|---|---|
| 🏁 Concluído | `Status` = ✅ |
| 🚫 Cancelado | `Status` = ❌ |
| 👷 Em implementação | tem sprint (`Entregue por` = S…) e `Status` ∈ {⬜, 🔄} |
| 💡 Em documentação | sem sprint (`Onda`/rolling wave) **ou** `Tipo=Feature` |
| 🚩 Não-iniciado | requisito sem épico (na rastreabilidade; não aparece na lista) |

**Princípio: coluna só para o que não é derivável.** O `Check` é uma exceção aparente — mas ele é **derivado automaticamente** (não é informação nova nem mantida à mão). A `Faixa` (horizonte) não é coluna de item: repete `Entregue por`.

## 3. Status (execução)

A lista responde *onde o item está na gestão* com **5 estados**; a execução fina fica no **board da sprint** (documento por sprint, no projeto).

| Status da lista | Significa |
|---|---|
| ⬜ **A fazer** | Está na lista, ainda não puxado |
| 🔄 **Em execução** | Puxado, ainda não entregue |
| ✅ **Entregue** | DoD cumprida e **em produção** (smoke test) |
| 🕓 **Adiada** | Fora deste horizonte; pode voltar |
| ❌ **Cancelada** | Não será feito; o ID não é reutilizado |

**Regras:**

- **`✅ Entregue` exige evidência** — DoD + smoke test em produção. Prazo vencido não é entrega.
- **Bloqueio não é status.** O item permanece no estado em que está e a trava vai para `Travada por` (🔒/✅).
- **Enum fechado.** Só os 5 valores acima.

## 4. Features demandadas (sem stories)

- Features ainda **não detalhadas em stories** entram **na mesma tabela** como linha `Tipo=Feature`, `Check=💡`.
- `Contexto` traz a `B-REQ/R` que a feature satisfaz; `Entregue por` traz o **horizonte** (`Onda …`).
- **Regra de saída:** quando a feature for detalhada, a linha dela é substituída pelas **stories** (que entram como item).

## 5. Ocorrências

- Débito técnico, bug e incidente entram na **mesma tabela**, com o `Tipo` correspondente.
- Se uma ocorrência travar um item, o ID dela vai para `Travada por` (um salto: aponta, não copia).
- Ocorrência que exige **decisão** de alguém não entra: vira pendência no hub do projeto.

## 6. Critérios de priorização

1. **Prioridade da B-REQ dona** — Alta (MVP) × Média (Onda 3).
2. **Bucket** — MVP Core / Stretch / Adiado.
3. **Fatiamento vertical** — priorizar o que fecha o ciclo do item ponta a ponta e o maior risco técnico.
4. **Dependências externas** — integrações podem ficar fora da Onda 1-Must, mas não do MVP.

> 📌 **Priorização econômica (WSJF):** para ordenar itens por valor/urgência/risco vs. esforço, use o [guia WSJF](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-wsjf-priorizacao.md).

## 7. Manutenção

- Item novo → linha na tabela, no mesmo passo.
- Feature detalhada → a linha `Tipo=Feature` é substituída pelas stories.
- Status mudou no board → atualizar a camada grossa na lista.

**Regra de ouro:** a lista guarda **prioridade/status/link**; a especificação mora no documento do item. **Aponta, não copia.**
