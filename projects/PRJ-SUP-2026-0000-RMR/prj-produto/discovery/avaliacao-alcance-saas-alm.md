# 🔭 Avaliação de alcance — SaaS ALM de dois lados (candidatos de enriquecimento)

> **Natureza:** consolidação de **5 pontos candidatos** a enriquecer o domínio e o alcance do produto, levantados a partir de um documento de ideias que propõe posicionar a plataforma como **SaaS B2B de Asset Lifecycle Management (ALM) e economia circular, de dois lados** (proprietários de ativos + prestadores de serviço).
> **Regra de autossuficiência:** este documento é **autossuficiente** — não depende de nenhum arquivo da pasta `temporaria/`. Cada ponto traz toda a informação necessária para a decisão.
> **Vínculo com o hub:** cada ponto corresponde a uma pendência formal (**PENDENCY-0034 … PENDENCY-0038**) em [pendencias.md](../../pendencias.md).

| Campo | Valor |
|---|---|
| Projeto | PRJ-SUP-2026-0000-RMR · RMR Reversa (produto RMR Tech) |
| Contexto | Avaliar o que a visão "ALM de dois lados" traz de **novo** em relação ao planejamento canônico (PRD · BRAINSTORM · domain.md · épicos/features · ADRs) |
| Resultado do cruzamento | 5 pontos **novos** (agregam) · demais pontos da ideia **já estão cobertos** (multi-tenancy, modelo híbrido/dedicated, núcleo SaaS, monólito modular, eventos, API-first, "começar pelo domínio") |
| Status | 📝 Em formação (2026-11-03) |
| Dono | PM/PO · Tech lead · Arquiteto de Soluções (por pendência, ver §1–§5) |

## Resumo dos 5 pontos

| # | Ponto | Valor | Horizonte | Pendência |
|---|---|---|---|---|
| 1 | Separar **Owner × Custodian × Operator** no modelo de dados | 🟢 Alto (estrutural, barato) | Decidir antes do fim da Onda 1-Must (MVP mínimo) | [PENDENCY-0034](../../pendencias.md) |
| 2 | **Genealogia de componentes** (vínculo origem → reuso) | 🟢 Alto (diferencial de rastreabilidade) | Junto ao EPIC-0005 (Onda 2-Should (MVP completo)) | [PENDENCY-0035](../../pendencias.md) |
| 3 | **Prestador de serviço como 2º público** (SaaS de dois lados) | 🟡 Médio (2º GTM) | Validar em Onda 4 (Produto) | [PENDENCY-0036](../../pendencias.md) |
| 4 | **Estado do ativo ≠ estado da OS ≠ estado do componente** | 🟢 Princípio (baixo custo) + decisão de escopo ALM | Decidir no domínio | [PENDENCY-0037](../../pendencias.md) |
| 5 | **Manutenção preventiva/corretiva (CMMS)** como mercado adjacente | 🟡 Médio (mercado adjacente) | Onda 5 (Plataforma) / fora do roadmap principal | [PENDENCY-0038](../../pendencias.md) |

> **Não listados aqui de propósito:** os demais itens do documento de ideias (multi-tenancy com `tenant_id` + RLS, modelo híbrido shared/dedicated, núcleo SaaS independente, monólito modular, eventos de negócio com Outbox, stack de frontend React/TypeScript/Vite, sequência "começar pelo modelo de domínio") **já estão decididos ou documentados** no planejamento canônico — ver [ADR-002](../../../../docs/tecnico/arquitetura/adrs/adr-002-rls-multi-tenant.md), [ADR-001](../../../../docs/tecnico/arquitetura/adrs/adr-001-monolito-modular.md), [ADR-004](../../../../docs/tecnico/arquitetura/adrs/adr-004-acl-outbox.md), [ADR-012](../../../../docs/tecnico/arquitetura/adrs/adr-012-stack-onda-1.md), [domain.md](../../../../docs/tecnico/domain.md) e [BRAINSTORM §6](BRAINSTORM.md).

---

## 1. Separar Owner × Custodian × Operator (PENDENCY-0034)

**O que é.** No modelo de dados, não confundir **propriedade** com **posse física** ou **responsabilidade operacional**. Um ativo pode pertencer a uma organização e estar fisicamente sob custódia de outra, que executa a operação.

Exemplo concreto:

- Empresa A é **proprietária** de 500 notebooks.
- Empresa B **recebe** 100 notebooks para manutenção (custodiante temporário).
- Empresa C **recebe** 20 equipamentos para reciclagem (operador de reciclagem).

Conceitos a distinguir:

| Conceito | Responsabilidade |
|---|---|
| **Owner** | Proprietário do ativo |
| **Custodian** | Responsável pela custódia física |
| **Operator** | Organização que executa a operação |
| **Service Provider** | Prestador contratado |

**Por que importa.** Permite atender os dois públicos (proprietários e prestadores) com um único modelo, sem criar dois sistemas. É o habilitador técnico do SaaS de dois lados e da rastreabilidade entre organizações.

**Já coberto hoje.** O planejamento tem `Tenant`/`Organization`/`Partner` ([BRAINSTORM §8](BRAINSTORM.md) · [domain.md §3](../../../../docs/tecnico/domain.md)), e a [FEATURE-0004.0003](../features) toca transferência de custódia entre oficina e Service Desk. Mas a distinção **não é uma regra de primeira classe do domínio**.

**O que decidir.**
1. Elevar a distinção Owner/Custodian/Operator a **regra de ouro** do modelo de dados ([domain.md §3](../../../../docs/tecnico/domain.md) + [architecture.md §3](../../../../docs/tecnico/arquitetura/architecture.md)).
2. Definir entidades separadas do ativo: **`AssetOwnership`** (proprietário + vigência) e **`AssetCustody`** (custodiante + período), mantendo `ATIVO` (o item rastreado) independente de ambas.
3. Decidir o reflexo na **taxonomia de entidades do cadastro** ([taxonomia-entidades-cadastro-ativos.md](../../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md), hoje 3 eixos · 9 entidades).

**Destino se aprovado.** [domain.md](../../../../docs/tecnico/domain.md) §3 (conceitos) · [taxonomia-entidades-cadastro-ativos.md](../../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md) · regra de ouro em [architecture.md](../../../../docs/tecnico/arquitetura/architecture.md).

**Dono.** Arquiteto de Soluções + Suprimentos/TI. **Prazo.** 2026-11-27.

---

## 2. Genealogia de componentes (PENDENCY-0035)

**O que é.** Cada componente recuperado mantém o **vínculo com o ativo de origem**, e a plataforma rastreia o caminho completo do componente **mesmo quando reutilizado em outro equipamento**.

Exemplo:

- Ativo A (Notebook) é desmontado. A memória RAM recuperada vira o componente **RAM-000456**.
- **RAM-000456** é reutilizada no Notebook B.
- A plataforma mantém a **genealogia**: RAM-000456 originou-se do Ativo A e agora está no Ativo B.

**Por que importa.** É o diferencial de rastreabilidade: nenhum processo (manutenção, transferência, desmanche, destinação) apaga o histórico. Permite reconstruir a trajetória **operacional, econômica e ambiental** de cada peça.

**Já coberto hoje.** Desmanche/colheita ([FEATURE-0005.0001](../features)), estoques de peças ([FEATURE-0005.0002](../features)) e `Part`/`HarvestLot` no domínio ([BRAINSTORM §8](BRAINSTORM.md)). **Lacuna reconhecida:** [domain.md §5](../../../../docs/tecnico/domain.md) aponta "`value-recovery` — motor ainda não especificado a nível de domínio (só ADR-011 + backlog); refinar na feature B-REQ-09/10".

**O que decidir.**
1. Formalizar o vínculo origem → destino: entidade **`ComponentOrigin`/`RecoveredComponent`** com referência ao ativo de origem e ao ativo de destino.
2. Definir como **invariante** a regra "não é permitido perder o vínculo histórico com o ativo de origem".
3. Decidir o modelo de histórico (append-only, consistente com a trilha de auditoria e com o [ADR-011](../../../../docs/tecnico/arquitetura/adrs/adr-011-motor-recuperacao-valor.md)).

**Destino se aprovado.** [domain.md](../../../../docs/tecnico/domain.md) (`value-recovery`) · taxonomia de colheita/desmanche · ADR se necessário.

**Dono.** Arquiteto de Soluções + PM/PO. **Prazo.** 2026-11-27.

---

## 3. Prestador de serviço como 2º público (PENDENCY-0036)

**O que é.** Além das empresas proprietárias de ativos, o produto pode atender **prestadores de serviço** (oficinas, recuperadoras, recicladoras, logística reversa) que gerenciam ativos de terceiros. O planejamento atual é centrado na perspectiva do **proprietário** que devolve o ativo.

Funcionalidades que um prestador de serviço precisa e que hoje não estão modeladas:

- Cadastro de clientes e contratos.
- Catálogo de serviços.
- Orçamentos e aprovações.
- Recebimento com protocolo de entrada.
- Ordens de serviço com SLA.
- Controle de produtividade técnica.
- Devolução e histórico por cliente.

**Por que importa.** Abre um **2º GTM** (o prestador de serviço pode ser um tenant) e reforça o argumento de plataforma de dois lados com efeito de rede. Já existem sinais no planejamento: "reparadora pode virar tenant no SaaS" ([BRAINSTORM §2.3](BRAINSTORM.md)) e o Portal do Parceiro ([BRAINSTORM §11](BRAINSTORM.md)).

**Já coberto hoje.** Parcialmente: o parceiro aparece como "origem externa que envia dados por API" (R39–R46), não como **tenant/usuário do produto**.

**O que decidir.**
1. Validar o prestador de serviço como **segmento/persona alvo (Onda 4 (Produto))**, sem mudar o escopo da Onda 1-Must (MVP mínimo).
2. Mapear a "gestão de serviços" (clientes, contratos, orçamento, SLA, produtividade) como um possível módulo/épico futuro.
3. Confirmar que o modelo Owner/Custodian/Operator (PENDENCY-0034) é o habilitador técnico.

**Destino se aprovado.** [BRAINSTORM §2](BRAINSTORM.md) (personas/segmentos) · horizonte Onda 4 (Produto) ([BRAINSTORM §5](BRAINSTORM.md)) · eventual EPIC/feature.

**Dono.** PM/PO + Comercial. **Prazo.** 2026-12-18.

---

## 4. Estado do ativo ≠ estado da OS ≠ estado do componente (PENDENCY-0037)

**O que é.** Cada entidade tem seu **próprio ciclo de vida**. O estado do ativo não deve ser confundido com o estado da ordem de serviço nem com o estado do componente.

A ideia propõe uma máquina de estados de ciclo de vida do ativo com 14 estados (RECEIVED, REGISTERED, AVAILABLE, IN_USE, UNDER_MAINTENANCE, REPAIRED, TESTING, REACTIVATED, RETIRED, DISASSEMBLY_PENDING, DISASSEMBLING, RECYCLED, DISPOSED, SCRAPPED).

**Por que importa.** Evita acoplar o `StageTransition` do workflow (triagem → expedição) ao estado patrimonial do ativo. No modelo atual o item já chega "fora de uso"; um ciclo de vida mais amplo só faz sentido se o produto evoluir para **gestão de ativos em uso (ALM)**.

**Já coberto hoje.** O workflow configurável já é uma máquina de estados para o ciclo reverso ([BRAINSTORM §4.1](BRAINSTORM.md) · [domain.md §3](../../../../docs/tecnico/domain.md)); a watchlist cobre estados parciais (scrap/blacklist/boomerang).

**O que decidir.**
1. Explicitar o princípio "cada entidade tem seu próprio ciclo de vida" como **regra de domínio** (baixo custo).
2. Decidir se a máquina de estados de **14 estados do ciclo de vida do ativo** entra no roadmap ou fica fora (é escopo de ALM, não de logística reversa).

**Destino se aprovado.** [domain.md §3](../../../../docs/tecnico/domain.md) (princípio) + nota de que a máquina de estados completa é evolução ALM.

**Dono.** Arquiteto de Soluções. **Prazo.** 2026-11-20.

---

## 5. Manutenção preventiva/corretiva (CMMS) como mercado adjacente (PENDENCY-0038)

**O que é.** A ideia inclui gestão de manutenção **preventiva, corretiva, preditiva e emergencial** (planos de manutenção, ordens de serviço de manutenção, classificação de defeitos, testes funcionais).

**Por que importa.** Isso é **outro produto** (CMMS / gestão de ativos em uso), não logística reversa. Pode ser uma evolução de longo prazo ou um mercado adjacente, mas **não deve diluir o foco do MVP atual** (ciclo reverso).

**Já coberto hoje.** O ciclo reverso cobre manutenção **corretiva** apenas na forma de "reparo de item que retornou" (triagem → reparo → reciclagem). A manutenção **preventiva/preditiva de ativos em uso** não está no escopo.

**O que decidir.**
1. Registrar como **"mercado adjacente / evolução Onda 5 (Plataforma)"**, fora do roadmap principal.
2. Não escopar no MVP nem na Onda 2-Should (MVP completo) (evitar diluir o foco do ciclo reverso).

**Destino se aprovado.** [BRAINSTORM §5](BRAINSTORM.md) (horizontes) / parking lot ([BRAINSTORM §13](BRAINSTORM.md)).

**Dono.** PM/PO. **Prazo.** 2026-12-18.

---

## Convenção de resolução

Ao responder cada pendência, o **desfecho é promovido para o documento canônico** de destino indicado em "Destino se aprovado" e a linha do hub vira ✅ — seguindo o ciclo de vida padrão de [pendencias.md](../../pendencias.md). Nenhuma referência à pasta `temporaria/` é necessária ou permitida.
