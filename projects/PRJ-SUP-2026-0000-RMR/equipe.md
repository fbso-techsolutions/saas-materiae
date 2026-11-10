# 👥 Equipe do Projeto (Project Team) — RMR Reversa

> **Fonte única de pessoas e papéis** do projeto: **quem já participou** até o momento e **que time técnico a Onda 1-Must (MVP mínimo) precisa** (gate ② da Sprint 1). Regra da casa: **aponta, não copia** — o detalhe de cada decisão vive nos [checklists](#2-time-do-projeto--participantes-até-o-momento) e no [hub de pendências](pendencias.md). **Atualizar** quando alguém entrar, sair ou mudar de alocação.

| Campo | Valor |
|---|---|
| Projeto | RMR Reversa · PRJ-SUP-2026-0000-RMR |
| Status | 📝 **Rascunho** — §2 (nomes completos) e §3 preenchidos e **sincronizados**; **gate ② validado** (PENDENCY-0016 respondida em 2026-10-19). ✅ **Corte da Sprint 1 publicado e concluído** (2026-10-19 – 2026-10-30 — [plano](prj-produto/sprints/sprint-1-fundacao.md), review de encerramento em 30/10) |
| Atualizado | 2026-10-22 |
| Alimenta | **Gate ② da Sprint 1 (capacidade — [PENDENCY-0016](pendencias.md))** · donos das pendências · participantes dos checklists |

---

## 1. Como funciona

| Regra | Detalhe |
|---|---|
| **Papel × Pessoa** | cada linha tem o **papel** (estável) e a **pessoa** (nome) — vazio = a preencher |
| **Participação** | rastro de onde a pessoa/papel já apareceu no registro (checklists, pendências) — **aponta, não copia** |
| **Capacidade** | os números da Sprint 1 (qtd. de devs, duração, velocidade) moram na [§3](#3-time-técnico-necessário--gate-ii-de-capacidade) — respondidos ⇒ **PENDENCY-0016 ✅** ⇒ sprint pode abrir |
| **Donos de pendências** | todo dono precisa existir aqui como papel (ou pessoa); quem não estiver aqui não deve receber pendência |
| **Ritual** | ao entrar/sair alguém: atualizar §2/§3 + linha no [hub](pendencias.md) se afetar uma pendência |

---

## 2. Time do projeto — participantes até o momento

> Papéis extraídos do registro existente (3 checklists fechados + donos das pendências) e da alocação da Sprint 1 (§3.1). **Todos os nomes preenchidos** (2026-10-19, inclusive Marcos Praia — TI/cadastro mestre).

### 2.1 Negócio e operação

| Papel | Nome | Participação até agora | Origem (registro) |
|---|---|---|---|
| **PM/PO** | Joice Neves | Priorização, decisões de escopo, participante dos checklists de Operação/PO e de arquitetura | [checklist Operação/PO](prj-produto/discovery/checklist-operacao-po-onda-1.md) · [checklist arquitetura](prj-tecnico/checklist-arquitetura-onda-1.md) · [registro de decisões](prj-produto/backlog/DECISOES-BACKLOG.md) |
| **Operação / Oficina** | Bruna Santos | Decisões da Onda 1-Must (MVP mínimo) sobre embalagem/identificação (A1/A2) · dono de pendência aberta | [checklist Operação/PO](prj-produto/discovery/checklist-operacao-po-onda-1.md) · [PENDENCY-0013](pendencias.md) |
| **Suprimentos** | Roberta Castro | Requisitos de cadastro/taxonomia · co-dono de pendência aberta | [taxonomia](../../docs/negocio/taxonomia-entidades-cadastro-ativos.md) · [PENDENCY-0012](pendencias.md) |
| **TI — dono do sistema de cadastro mestre (sistema de origem)** | Marcos Praia | **Escopo:** administra o sistema de origem — contrato REST + ambiente/credenciais (PENDENCY-0014 ✅ · fechamento em PENDENCY-0020), regras de elegibilidade R17/R22/R48; **face de negócio = [Suprimentos](#21-negócio-e-operação)** (lei de formação dos identificadores/NDS — [catálogo](../../docs/negocio/taxonomia-entidades-cadastro-ativos.md), PENDENCY-0012). Sem participação em checklists ainda | [PENDENCY-0012](pendencias.md) · [PENDENCY-0020](pendencias.md) · [FEATURE-0001.0004 §6.1](prj-produto/features/FEATURE-0001.0004-validacao-identificador-cadastro-mestre.md) |
| **Jurídico** | Legisvaldo Nunes | Checklist de compliance 7/7 (retenção, PII, guarda) | [checklist jurídico](prj-negocio/requisitos/checklist-juridico-compliance.md) |
| **Compliance** | Gabriela Moraes | Wipe/sanitização, dispensa, licença, MTR (checklist 7/7) | [checklist jurídico](prj-negocio/requisitos/checklist-juridico-compliance.md) |
| **DPO** | Daniel Vini | PII/consentimento/repartição (checklist 7/7) | [checklist jurídico](prj-negocio/requisitos/checklist-juridico-compliance.md) |

### 2.2 Time de tecnologia (já envolvido)

| Papel | Nome | Participação até agora | Origem (registro) |
|---|---|---|---|
| **Tech lead** | Francisco Oliveira | **Gate de arquitetura 9/9** (stack, guardrails, ambiente, CI/CD) · dono da PENDENCY-0016 | [checklist arquitetura](prj-tecnico/checklist-arquitetura-onda-1.md) · [PENDENCY-0016](pendencias.md) |
| **Arquiteto de Soluções** | Bolismar da Silva | Stack Onda 1-Must (MVP mínimo), multi-tenancy/RLS, motor de workflow, auditoria | [checklist arquitetura](prj-tecnico/checklist-arquitetura-onda-1.md) · [ADR-012](../../docs/tecnico/arquitetura/adrs/adr-012-stack-onda-1.md) |
| **Segurança da Informação** | Daniel Vini | Auth/Keycloak (B1), auditoria (C3) · co-dono de pendência | [checklist arquitetura](prj-tecnico/checklist-arquitetura-onda-1.md) · [PENDENCY-0014](pendencias.md) |
| **Engenheiro de Dados** | Carlos Mattos | Modelo de dados da Onda 1-Must (MVP mínimo): 7 tabelas + seeds + base de tenant (A2) | [checklist arquitetura](prj-tecnico/checklist-arquitetura-onda-1.md) |
| **Infraestrutura / Cloud** | Lourival Louro | Ambiente da Onda 1-Must (MVP mínimo): Compose interno, homologação, backup (C1) | [checklist arquitetura](prj-tecnico/checklist-arquitetura-onda-1.md) |
| **Engenharia (devs)** | Bruno Oliveira, Manoel Carlos | Terminais/leitores (C2), CI/CD (C4), motor de workflow (B3) · núcleo de dev da Sprint 1 | [checklist arquitetura](prj-tecnico/checklist-arquitetura-onda-1.md) |
| **QA / Testes** | Patricia Varra | Alocada na Sprint 1 — plano de testes/automação da Onda 1-Must (MVP mínimo) | [§3.1](#3-time-técnico-necessário--gate-ii-de-capacidade) |

---

## 3. Time técnico necessário — gate ② de capacidade

> O que o **Onda 1-Must (MVP mínimo)** precisa de time para executar as **13 stories (IDs 0001–0013, convenção `US-FEAT-{feature}-{SSSS}`)** + 4 Architectural Runways (Keycloak, policies RLS, config de workflow, auditoria — ver [backlog](../../docs/produto/backlog/BACKLOG-LIST.md)) e, em seguida, o rolling wave da Onda 2-Should (MVP completo) (a partir de 0022).

### 3.1 Papéis e quantidades

| Papel | Qtd. | Quem (nome) | Alocação (%) | Observação |
|---|---|---|---|---|
| Tech lead | 1 | Francisco Oliveira | 100 | liderança técnica + aprovação de PRs (C4) |
| Arquiteto de Soluções | 1 | Bolismar da Silva | 100 | ADRs, revisão de desenho (pode ser 1ª linha junto com Tech lead) |
| Dev backend (Java/Quarkus) | 1 | Bruno Oliveira | 100 | núcleo da Onda 1-Must (MVP mínimo) — workflow, recebimento, expedição, travas LGPD |
| Dev frontend (React/TS) | 1 | Manoel Carlos | 100 | painel Kanban "sem mouse", telas de recebimento/expedição |
| Engenheiro de Dados | 1 | Carlos Mattos | 100 | Flyway: 7 tabelas + seeds + **policies de RLS** (B2) |
| Infra / DevOps | 1 | Lourival Louro | 100 | Compose (dev/homolog/prod), backup diário, pipeline CI/CD (C1/C4) |
| QA / Testes | 1 | Patricia Varra | 100 | plano de testes/automação da Onda 1-Must (MVP mínimo) — **definir no planning da Sprint 1** (cobertura de integração Quarkus + fluxos de teclado) |
| Segurança da Informação | 1 (pontual) | Daniel Vini | sob demanda | Keycloak/RBAC/perfis (B1) + auditoria append-only (C3) |

### 3.2 Parâmetros da Sprint 1

| Parâmetro | Valor |
|---|---|
| Duração da sprint | `2 semanas` (decidida — PENDENCY-0016) |
| Nº de devs alocados na Onda 1-Must (MVP mínimo) | `2` (Bruno Oliveira + Manoel Carlos) |
| Capacidade prevista | `14 SP/sprint` (2 devs × 8 horas × 10 dias úteis = 160 h × fator de foco 70% = 112 h líquidas, a 8 horas por ponto; **premissa do início do projeto**, medida na 1ª sprint — decisão 2026-10-22) · Job Size de Enabler é escala própria e não converte para SP ([Sprint 1 §6](prj-produto/sprints/sprint-1-fundacao.md)) |
| Data de início pretendida | `19/10/2026` |
| Corte da Sprint 1 | **Sprint 1 (19-30/10) = Fundação/Enablers**: **8 Enablers comprometidos** + 2 iniciados, zero features ([plano completo](prj-produto/sprints/sprint-1-fundacao.md)); **concluída em 30/10** |

> ✅ **Preenchido ⇒ PENDENCY-0016 respondida ⇒ Sprint 1 pode abrir** (gate ① de arquitetura já está fechado — [checklist](prj-tecnico/checklist-arquitetura-onda-1.md), 2026-10-19).

---

## 4. Donos de pendências (aponta → hub)

- **Abertas hoje:** [PENDENCY-0019](pendencias.md) (Operação/Oficina + Eng) e **PENDENCY-0020–0029** (triagem de 2026-10-23) — ~~PENDENCY-0012, PENDENCY-0013 e PENDENCY-0014~~ **respondidas em 2026-10-21**; donos e prazos sempre no **[hub](pendencias.md)** (fonte única; este doc só confirma que o papel existe aqui).
- **Ritual semanal:** rodar `scripts/check-pendencias.sh` — quem aparece lá precisa ter linha nesta [§2](#2-time-do-projeto--participantes-até-o-momento).

---

## 5. Pendências deste documento

1. ✅ **Nome do papel "TI — dono do sistema de cadastro mestre"** preenchido: **Marcos Praia** (2026-10-19) — escopo + face de negócio (Suprimentos) registrados na [§2.1](#21-negócio-e-operação); co-dono de [PENDENCY-0012](pendencias.md)/[PENDENCY-0014](pendencias.md).
2. ✅ **§2 × §3.1 sincronizados** (2026-10-19) — QA (Patricia Varra) incluída na §2; divergências Infra/Eng/Segurança resolvidas pelo PO.
3. ✅ **§3 preenchida e validada ⇒ [PENDENCY-0016](pendencias.md) respondida** (2026-10-19) — gate ② fechado. **Próximo passo:** corte da Sprint 1 em [produto/sprints/](prj-produto/sprints).
