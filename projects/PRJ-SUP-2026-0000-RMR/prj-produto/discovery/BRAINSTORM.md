# BRAINSTORM — Plataforma de Ciclo de Vida de Ativos (Reparo, Manutenção e Reciclagem)

> **Natureza do documento:** ideação / exploração de caminhos. **Não é especificação nem decisão final.**
> Tudo aqui é insumo para discussão. Itens marcados como **✅ Decidido** já têm direção fechada neste brainstorm; o restante é hipótese.

| Campo | Valor |
|---|---|
| Fonte | `docs/negocio/discovery/PEDIDO.md` (R1–R59) · [PRD.md](../../PRD.md) (Ágil, v1.0) · sessões de brainstorm |
| Autor | Sessão de brainstorm |
| Status | Ideação — alinhado ao `PRD.md`; evoluindo para épicos/features/user-stories |
| Objetivo | Avaliar caminhos possíveis de produto/solução, com MVP (*Minimum Viable Product*) como entrada e evoluções (web → mobile → SaaS) |
| Nomenclatura | **Projeto:** RMR Reversa · **Produto:** RMR Tech · **Sub-marca de venda:** RMR Market |

---

## 0. Como usar este documento

1. Leia a **§1 (Contexto)** e a **§2 (Tese)** para alinhar linguagem.
2. As **§3 (Caminhos estratégicos)** e **§14 (Matriz de decisão)** são o coração da avaliação.
3. A **§4 (MVP)** e a **§5 (Horizontes Onda 1-Must (MVP mínimo) → Onda 5 (Plataforma))** definem a evolução.
4. A **§15 (Perguntas em aberto)** lista o que ainda precisa de decisão humana.

Convenções: `✅ Decidido` = direção acordada nesta rodada · `🟡 Hipótese` = proposta a validar · `⬜ Aberto` = decisão pendente.

---

## 1. Contexto e leitura do pedido

### 1.1 Problema (como está no pedido)
A operação de reciclagem/reparo de equipamentos que retornam de campo usa uma **solução de mercado obsoleta**, **sem integração** com os sistemas de referência da empresa (cadastro mestre de materiais serializados, gestão de materiais e de estoque, centro de reciclagem central). O resultado é retrabalho, dados ilhados e pouca visibilidade.

### 1.2 Objetivo declarado
Software que registre, via número de controle (NDS) e identificadores únicos (IMEI/serial), os equipamentos que retornam de campo e **todo o processo pelo qual passam** — até voltarem ao mercado ou serem sucateados — gerando relatórios/dashboards e **integrado aos legados**.

### 1.3 Insights implícitos (o que o pedido revela nas entrelinhas)
- **O processo é uma espinha dorsal rígida** (R20): `triagem → teste inicial → reparo (opcional) → sucata (opcional) → reciclagem → run in → embalagem → expedição`, com leitura do item em cada etapa. No fluxo detalhado (R27/R29; ver §4.1), sucata é o destino do reparo quando o item é considerado "sem conserto". Isso é, na prática, uma **máquina de estados do item** com trilha de auditoria.
- **Há rastreabilidade ponta a ponta** como requisito real: etiqueta única (R24, R34, R59), pallet (R36), reconciliação de expedição (R37, R44). O pedido é, no fundo, um sistema de **rastreabilidade de logística reversa**.
- **Há um ecossistema externo** (fornecedores, reparadoras/recicladores, retailers, vendors, couriers e o centro de reciclagem central) que envia dados por API (R39–R46) e recusa informação inválida (R46). Ou seja: **integração não é acessório, é produto**.
- **Há forte interesse em indicadores** (R49–R55: aproveitamento, consumo de insumos, estoque entre etapas, volume por etapa). O valor percebido está tanto na operação quanto na **gestão por dados**.
- **Requisitos de acesso/governança** (R1–R5) indicam ambiente com **usuários internos e externos** e políticas de segurança — pré-requisito para multiusuário/multiempresa.

### 1.4 Premissas e decisões deste brainstorm

| # | Tema | Decisão | Impacto |
|---|---|---|---|
| Premissa 1 | Ambição | **✅ Interno primeiro, mas desvinculado da empresa — nasce genérico** | Domínio, nomes e arquitetura sem jargão proprietário; já preparado para virar produto/SaaS |
| Premissa 2 | Escopo do MVP | **✅ Fluxo completo de todas as etapas (R20)** | MVP é uma fatia vertical *profunda*, não horizontal |
| Premissa 3 | Stack | **✅ Java 25 + Quarkus + React** *(decisão Tech lead, ADR-012)* | Backend corporativo maduro p/ integrações (Java permanece); frontend SPA (*Single Page Application*) |
| Premissa 4 | Canal | **✅ Web responsiva no MVP; mobile/coletor depois** | Sem app/offline no MVP; prever PWA (*Progressive Web App*)/coletor em Onda 4 (Produto) |
| Premissa 5 | Evidência por imagem | **✅ Configurável** por cliente/modelo, por fases de aplicação e por finalidade (só evidência **ou** evidência + OCR/validação); **apenas serializados** | Reforça o motor de configuração (§6.6) e o argumento SaaS |
| Premissa 6 | Nomenclatura | **✅ Projeto:** RMR Reversa · **Produto:** RMR Tech · **Venda:** RMR Market | Marca e comunicação desbloqueadas (§2.5) |
| Premissa 7 | Recuperação de Valor | **✅ Novo eixo do ciclo:** desmanche + **venda de peças e sucata** para minimizar o prejuízo (ITAD / Asset Recovery) | Nova receita + motor de decisão de valor (§2.6, §9.1, §10) |

> **Implicação-chave de Premissa 1:** evitamos nomes e regras acoplados à empresa. Onde o pedido fala "NDS", "CSI", "SAP", "DLX/DHL", "RDP", o produto fala em **conceitos genéricos configuráveis**, com *aliases* por cliente. Ver §2.3 (glossário) e §2.4 (ecossistema de sistemas de referência).

---

## 2. Tese do produto

### 2.1 Do "sistema da SKY" para "plataforma de ciclo de vida de ativos"
A dor original é específica, mas o **núcleo é universal**: *toda empresa que recebe produto de volta do cliente e precisa triar, reparar, reciclar ou descartar, com rastreabilidade e integração.* Telecom é o primeiro caso, mas o mesmo núcleo serve a:

- Telecom / ISP (CPEs, modems, set-top boxes, roteadores)
- Varejo e e-commerce (trocas, devoluções, RMA)
- Eletroeletrônicos, eletrodomésticos, TI (refurb, trade-in)
- Fabricantes e assistências técnicas (garantia, reparo)
- Operadores logísticos (logística reversa terceirizada)
- Setor público / programas de descarte (e-waste)

**Tese:** construir um **núcleo genérico de gestão do ciclo de vida reverso do material** (triagem, reparo, reciclagem, destino), com **workflow configurável, rastreabilidade por identidade única e hub de integração** — entregando valor imediato para a operação atual, mas projetado desde o dia 1 para ser multi-cliente.

### 2.2 Categoria de mercado (para posicionar o produto)
Termos que o mercado usa e que ajudam no *pitch* e no roadmap:

| Categoria | Sigla | Encaixe |
|---|---|---|
| Reverse Logistics Management | RLM | Núcleo do produto |
| Returns Management / RMA | RMA | Fluxo de retorno e triagem |
| Repair / Refurbishment Management | — | Etapas de reparo e reciclagem |
| Circular Economy Platform | — | Visão ESG (*Environmental, Social and Governance*), reuso, sustentabilidade |
| Asset Lifecycle Management | ALM/ISO 55000 | Gestão do ativo ao longo da vida |
| IT Asset Disposition / Asset Recovery | **ITAD** | Recuperação de valor: reuso, revenda de peças, sucata (§2.6) |
| Traceability / Supply-chain events | **EPCIS/GS1** | Padrão de eventos de rastreabilidade (ver §7) |

**Posicionamento sugerido:** *"Plataforma de logística reversa e economia circular: da triagem ao destino final, com rastreabilidade total e integração ao seu ecossistema."*

### 2.3 Glossário generalizado (a "desvinculação" na prática)

| Termo no pedido | Papel / função | Conceito genérico no produto | Nome de mercado | Observação |
|---|---|---|---|---|
| NDS | Identificador de rastreio do item | **Código de rastreio do item** (`trackingCode`) | Serial / Asset Tag | Formação/regra configurável por cliente |
| CPE / equipamento | Item gerenciado | **Material serializado (unidade)** *ou* **Material (SKU)** se não serializado | Serialized Item / Material (SKU) | O produto rastreia os dois níveis — ver nota abaixo |
| IMEI / serial / smart card | Identificadores únicos | **Identificadores externos** (`externalIds[]`) | — | Lista extensível (IMEI, serial, GTIN, smart card) |
| CSI | Cadastro mestre dos materiais serializados; consulta de elegibilidade + devolutiva de sucesso/insucesso | **Sistema Mestre de Materiais Serializados** | Serialized Asset Registry / Installed Base / MDM de Materiais Serializados | **Nível: unidade.** Integração **bidirecional** (consulta **e** devolutiva) |
| SAP — papel "Sistema de Materiais" | Cadastro de cada produto como material; consulta/atualização de status | **Sistema Mestre de Materiais** | Material Master (MM) / MDM de Materiais / PIM | **Nível: SKU.** Consultar e atualizar status (reciclado ✅ / não ✅) |
| SAP — papel "Centro de Estoque Avançado" | Estoque avançado por parceiro (estoque de reciclagem); movimentação | **Sistema de Gestão de Estoque Avançado** | WMS / EWM (Extended Warehouse Management) | **Nível: SKU/quantidade.** Buscar/receber/devolver material |
| DLX / DHL | Nó central que recebe e distribui para todos os parceiros | **Centro de Reciclagem Central** | Reverse Logistics Hub / Central Returns Hub | Ponto central de entrada e roteamento a parceiros |
| RDP | Número de controle logístico | **Número de controle logístico** | — | Campo genérico |
| Assist / fornecedor | Origem externa que envia dados | **Parceiro externo / origem** | Supplier / 3PL | Recebe por API |
| Reparadora | Executor de reparo/reciclagem | **Parceiro de reparo/reciclagem** | Repair Vendor / Refurb Partner | Pode virar *tenant* no SaaS |
| OS | Ordem de serviço/reparo | **Ordem de serviço / reparo** (`WorkOrder`) | Work Order | Genérico |
| Triagem/etapas | Etapas do fluxo | **Estágios do workflow** | Stage / Step | Configuráveis por cliente |

> **Níveis de dados — Material (SKU) × Material Serializado (unidade):** o produto opera em **dois níveis**, e ambos os termos são válidos, cada um em seu contexto:
> - **Material (SKU)** — o produto/catálogo (nível de **definição**). Contexto do **Sistema Mestre de Materiais** e do **Sistema de Estoque**.
> - **Material Serializado (unidade)** — a peça individual rastreável por `trackingCode`/IMEI/serial (nível de **instância**). Contexto do **Sistema Mestre de Materiais Serializados**.
>
> Ou seja: "material" = SKU (SAP); "material serializado" = unidade (CSI).

#### 2.3.1 Catálogo de materiais: serializados × não serializados

A **natureza do material** define se o processo é por **unidade** ou por **quantidade**:

| Tipo | Exemplos | Como é tratado | Identificação no processo | Medida |
|---|---|---|---|---|
| **Serializado (unidade)** | decodificadores, modems, receptores, celulares, relógios, smartwatches, notebooks, desktops, tablets | **Unitário** — cada peça é um item rastreável | `trackingCode` (NDS) / IMEI / serial, conforme **lei de formação** | 1 (unidade) |
| **Não serializado** | antenas, cabos (internet/TV), fios, parafusos, LNBs, conectores | **Por quantidade** — não há código de material/unitário associado ao transporte/reciclagem | **Apontamento** (sem código individual) | **Unidade de medida**: un, m, kg, L, ... |

> **Consequências de projeto:**
> - **Etiquetas** com código (NDS) aplicam-se aos **serializados** (R24, R34, R59); os **não serializados** são apontados por **quantidade/UoM**.
> - **KPIs** (R49) precisam contar **unidades** (serializados) e **quantidades/UoM** (não serializados) — daí o pedido citar "peças realizadas (serializadas e não serializadas)".
> - O **workflow** (R20) roda nos **dois modos**: 1 leitura = 1 unidade (serializado) **ou** 1 apontamento de quantidade (não serializado).
> - O **`Material (SKU)`** carrega o atributo `tipo` (`serializado`/`não serializado`) e a **unidade de medida** padrão.
> - **Evidência por imagem (foto):** materiais **serializados** podem exigir **captura de foto/imagem que certifique o código** lido (`trackingCode`/IMEI/serial) — prova de identidade, auditoria e anti-fraude (evita troca de etiqueta, R59). **Não se aplica a não serializados** (não há código unitário a certificar). É **totalmente configurável** — ver §6.6.

### 2.4 Ecossistema de sistemas de referência (generalizado)

A nova solução **não substitui** os sistemas de referência — ela **orquestra o ciclo de reciclagem** e conversa com eles. Os papéis e as operações:

| Sistemas de referência | Papel | Operações que a nova solução realiza |
|---|---|---|
| **Sistema Mestre de Materiais Serializados** — *unidade* (papel do "CSI") | Controle unitário de cada material serializado sob a gestão de supply chain | **Consultar** se o item existe e pode entrar no processo de reciclagem; **devolver** o desfecho (reciclagem com sucesso / insucesso) |
| **Sistema Mestre de Materiais** — *SKU* (papel do "SAP" — material) | Cadastra cada produto como *material (SKU)* | **Consultar** dados do material; **atualizar/registrar** o status do material (reciclado ✅ / não ✅) |
| **Sistema de Gestão de Estoque Avançado** — *SKU/quantidade* (papel do "SAP" — estoque) | Estoque avançado por parceiro (o *estoque de reciclagem* é um dos pontos de início do processo) | **Buscar** material para reciclagem; **receber** material para reciclagem; **devolver** material reciclado com sucesso; **devolver** material não reciclado (insucesso); demais movimentos de estoque |
| **Centro de Reciclagem Central** — *unidade e SKU* (papel do "DLX/DHL") | Nó central que recebe todos os materiais e os distribui aos parceiros (recicladores, retailers, vendors, mini-centros de distribuição, couriers) | **Compor/consumir** o controle logístico online; **rotear** o item ao parceiro correto |

**Fluxo de alto nível (generalizado):**

```
                      ┌──────────────────────────────────────────────┐
   Estoque do         │   SISTEMA DE GESTÃO DE ESTOQUE AVANÇADO (WMS) │  ◀── busca/recebe/devolve
   parceiro ─────────▶│   (material para reciclagem)                 │
                      └──────────────────────────────────────────────┘
                                       │
                                       ▼
        ┌───────────────────────────────────────────────────────────────┐
        │        CENTRO DE RECICLAGEM CENTRAL  (recebe e distribui)     │
        └───────────────────────────────────────────────────────────────┘
             │                                     ▲
             ▼                                     │ desfecho (sucesso/insucesso)
   ┌───────────────────┐   consulta elegibilidade  │
   │  NOVA SOLUÇÃO     │ ─────────────────────────▶│  SISTEMA MESTRE DE
   │  (orquestra o     │ ◀─────────────────────────  MATERIAIS SERIALIZADOS
   │   ciclo reverso)  │   existe? pode reciclar?      + SISTEMA MESTRE DE
   └───────────────────┘   atualiza status do         MATERIAIS
                           material (reciclado ✅/❌)
```

> **Insight-chave:** o valor da nova solução está em **fechar o loop** — não basta consultar os sistemas de referência; é preciso **devolver o desfecho** (sucesso/insucesso e status do material) para manter cadastro mestre e estoque consistentes. Isso reforça a §6.5 (eventos + Outbox + reconciliação) e a §7 (hub de integração).

### 2.5 Nomes do projeto e do produto (✅ decidido)

| Nível | Nome | Papel |
|---|---|---|
| **Projeto / Programa (interno)** | **RMR Reversa** | *Sistema de Reparo, Manutenção e Reciclagem de Ativos com Economia Circular via Logística Reversa* |
| **Produto / Serviço (negócio)** | **RMR Tech** | Plataforma de Reparo, Manutenção e Reciclagem (marca de mercado) |
| **Sub-marca da venda** | **RMR Market** | Canal de venda de peças e sucata (recuperação de valor) |

> **Histórico de candidatos** (avaliados antes da decisão): Lifespan, ReFix, MaintCycle, Fix&Cycle, Loop, ReLoop, Ciclo, Volta, Revive, Continuum, ReVert, Circular, Nexo Circular, ReGen, Ecoré, entre outros. **Decisão:** adotar a família **RMR** (já usada no `docs/negocio/discovery/PEDIDO.md` e no `PRD.md`), mantendo consistência corporativa e rastreabilidade.

### 2.6 Eixo de Recuperação de Valor (venda de peças e sucata)

> 💡 **Origem:** ganho identificado no `PRD.md` §2.1 ("geração de receita acessória com a venda de componentes recondicionados ou sucatas triadas"). Categoria de mercado: **ITAD — IT Asset Disposition / Asset Recovery**.

**Objetivo:** minimizar o prejuízo causado pela quebra/obsolescência do ativo, **monetizando o que resta dele** — peças (reuso ou venda) e sucata (venda de material).

**Ciclo atualizado (com o novo eixo):**

```
[Ativo Fora de Uso]
      │  Logística Reversa (coleta + rastreamento)
      ▼
[Centro de Triagem]
      │
      ├── Manter Valor ───▶ [1. Manutenção/Reparo]        ──▶ Reuso Interno (economia)
      ├── Manter Valor ───▶ [2. Remanufatura]             ──▶ Reuso Interno (economia)
      ├── Recuperar Valor ▶ [4. Desmanche/Colheita Peças] ──▶ Estoque de Peças ─▶ (reuso interno | VENDA)
      ├── Reciclar ───────▶ [3. Reciclagem de Materiais]  ──▶ Estoque de Sucata ─▶ (VENDA por kg/un)
      └── Sem valor ──────▶ Descarte (compliance ambiental)
                                   │
                                   ▼
                    [Receita + Baixa Contábil + ESG]
```

> Os números são os **rótulos do ciclo** no `PRD.md` (§2.2): **1** Manutenção/Reparo · **2** Remanufatura · **3** Reciclagem de Materiais · **4** Desmanche/Colheita de Peças — por isso não seguem a ordem visual do diagrama.

**Dois produtos de saída com potencial de venda:**

| Saída | Natureza | Unidade | Destino |
|---|---|---|---|
| **Peças** (usada testada / recondicionada) | SKU + condição + garantia | unidade | Reuso interno **ou** venda |
| **Sucata** (material) | material + classe ambiental | **kg / un / m (UoM)** | Venda a recicladores |

> Reuso interno **não é receita** — é **economia** (evita compra). Venda externa é **receita acessória**. **Ambos reduzem o prejuízo.**

**Fluxo de venda ponta a ponta:**
```
Formar lote (peças/sucata) → Precificar → Ofertar (interno/externo) → Negociar/Vender
   → NF de saída → Baixa de estoque → Baixa patrimonial contábil → Receita + ESG
```
Travas **obrigatórias antes de vender**:
- **LGPD:** mídia de armazenamento (HD/SSD) exige **wipe/destruição + certificado** antes de vender peças/ativos (B-REQ-05).
- **Compliance ambiental:** **MTR** (Manifesto de Transporte de Resíduos) / **PNRS** + destinação a reciclador licenciado.

**Métrica do prejuízo (o que o Board quer ver):**
```
Prejuízo líquido do ativo =
   Valor de aquisição (ou residual contábil)
   − reuso interno evitado
   − receita de peças
   − receita de sucata
   + custos (reparo/desmanche/logística)

Taxa de Recuperação de Valor (%) = (reuso + peças + sucata) / valor de aquisição
```

> O **Motor de Recuperação de Valor** (evolução da "Regra dos 40%") decide entre reparo/remanufatura/desmanche/reciclagem/descarte considerando o **valor recuperável** de cada rota. Regras e fórmula detalhadas no [ADR-011 — Motor de Recuperação de Valor](../../../../docs/tecnico/arquitetura/adrs/adr-011-motor-recuperacao-valor.md).

---

## 3. Caminhos estratégicos (archetypes)

Avaliamos **5 caminhos** possíveis. A recomendação é o **Caminho C (Plataforma+Produto)**, com migração natural para **D (Marketplace)** em Onda 5 (Plataforma).

### Caminho A — Ferramenta interna pontual ("sistema da empresa")
- **O que é:** software sob medida só para a operação atual, sem pretensão de reuso.
- **Prós:** menor esforço inicial de generalização; foco absoluto na dor atual.
- **Contras:** contraria Premissa 1 (nascer genérico); retrabalho grande se depois quiser produto; acopla ao legado.
- **Veredito:** **descartado como fim**, mantido apenas como "primeiro caso de uso".

### Caminho B — Produto vertical de nicho (telecom/CPE)
- **O que é:** produto para o mercado de telecom (operadoras/ISP) com foco em CPE.
- **Prós:** narrativa clara, dores parecidas entre operadoras, ciclo de venda conhecido.
- **Contras:** mercado menor; risco de virar "só mais um sistema" se não generalizar o núcleo.
- **Veredito:** **bom como fase intermediária** (Onda 4 (Produto)), partindo do Caminho C.

### Caminho C — Plataforma horizontal de logística reversa (SaaS) ✅ recomendado
- **O que é:** núcleo genérico (workflow configurável + rastreabilidade + integração) vendido como SaaS multi-tenant; primeiro tenant é a operação atual.
- **Prós:** reuso amplo, receita recorrente, efeito de rede nos dados, alinhado a Premissa 1.
- **Contras:** exige investimento em produto/UX/onboarding/segurança multi-tenant; menor profundidade inicial em cada vertical.
- **Veredito:** **recomendado** — o MVP atende o caso atual, mas cada decisão de design assume multi-cliente.

### Caminho D — Plataforma + Marketplace de parceiros
- **O que é:** Caminho C + conexão de operadoras, reparadoras e recicladoras, com matching e comissionamento.
- **Prós:** monetização adicional, efeito de rede forte, dados de benchmark.
- **Contras:** alta complexidade (jurídico, reputação, qualidade de parceiros), precisa de massa crítica.
- **Veredito:** **horizonte Onda 5 (Plataforma)**, construído sobre C.

### Caminho E — Open-core / comunidade
- **O que é:** núcleo aberto (self-host) + módulos/enterprise pagos.
- **Prós:** adoção rápida, credibilidade técnica, feedback.
- **Contras:** monetização mais difícil; suporte e governança do aberto.
- **Veredito:** **alternativa** a considerar em Onda 4 (Produto)/Onda 5 (Plataforma) (há fit com o público técnico/ESG).

### 3.1 Tabela comparativa

| Critério | A — Interno | B — Vertical | C — Plataforma SaaS ✅ | D — Marketplace | E — Open-core |
|---|---|---|---|---|---|
| Alinhamento com Premissa 1 (genérico) | Baixo | Médio | **Alto** | Alto | Alto |
| Time-to-value inicial | Alto | Alto | Médio | Baixo | Médio |
| Potencial de receita | Nulo | Médio | **Alto** | Muito alto | Médio |
| Esforço de engenharia | Baixo | Médio | **Alto** | Muito alto | Alto |
| Esforço de produto/GTM | Nulo | Médio | **Alto** | Muito alto | Alto |
| Risco | Baixo | Médio | **Médio** | Alto | Médio |
| Recomendação | Fase 0 (caso de uso) | Onda 4 (Produto) | **Núcleo** | Onda 5 (Plataforma) | Onda 4 (Produto)/Onda 5 (Plataforma) (opção) |

---

## 4. O MVP

### 4.1 A espinha dorsal: workflow como máquina de estados
O MVP (Premissa 2) é o **fluxo completo R20**, então o coração é o **motor de workflow**:

```
[TRIAGEM] ─▶ [TESTE INICIAL] ─▶ [REPARO]* ─▶ [RECICLAGEM] ─▶ [RUN IN] ─▶ [EMBALAGEM] ─▶ [EXPEDIÇÃO]
                                   │                                                         │
                                   └▶ [SUCATA]*                                            (fim)
   * etapas opcionais
   Cada transição registra: ator, data/hora, local, leitura do identificador (NDS/IMEI)
   Serializados: + captura de foto/imagem do código (evidência de identidade)
```

> **Sucata:** no R20 ela aparece na sequência entre reparo e reciclagem; no fluxo detalhado (R27/R29 — e no [card FEATURE-0002.0001](../features/FEATURE-0002.0001-painel-kanban-workflow.md)) ela é **destino final do reparo** ("sem conserto"), não etapa subsequente ao reparo.

**Decisão de design central:** as etapas **não devem ser hard-coded**. Elas são um **workflow configurável por cliente** (nomes, ordem, transições permitidas, telas/campos por etapa, permissões). Isso serve tanto ao requisito atual (R14: alterar fluxo de permissões conforme defeito) quanto à generalização (Premissa 1) e ao SaaS (Onda 4 (Produto)).

### 4.2 Escopo do MVP por bucket (mapeando os R1–R59)

**MVP Core** (obrigatório para o fluxo ponta a ponta funcionar):

| Grupo | Requisitos | Nota |
|---|---|---|
| Usuários e acesso | R1, R2, R3, R4, R5 | Perfis, telas por perfil, login único, política de senha, reset |
| Cadastros mestres | R6–R16 | Defeitos, local danificado, causa raiz, serviços, sucata, HDD, reciclagem, modelos, materiais/insumos |
| Validação de dispositivo | R17 | Consulta ao **Sistema Mestre de Materiais Serializados** — via adaptador |
| Classificação | R18 | Níveis de reparo/reciclagem por parceiro/origem |
| Workflow | R20 | Motor de estados + auditoria por etapa |
| Triagem | R21–R25 | NDS, modelo, NF, controle logístico, blacklist/scrap/boomerang, etiqueta única, destino |
| Teste inicial | R26, R27 | Defeito constatado + roteamento |
| Reparo (OS) | R28, R29 | Ordem de serviço completa + destino |
| Reciclagem | R30, R31 | Serviço cosmético + operador |
| Run in | R32 | Aprovação/reprovação + retorno |
| Embalagem | R33–R35 | Operador, etiqueta final, smart card |
| Expedição | R36, R37 | Pallet ID + NF de saída |
| Busca rápida | R56, R57 | Por NDS/IMEI e por OS |
| Etiquetas | R58, R59 | Layouts + controle de impressão única/reimpressão com senha |
| Evidência de identidade (ideia) | — | Captura de **foto/imagem que certifica o código** — **apenas serializados**; prova/anti-fraude. **Configurável** por cliente/modelo, fases e finalidade (evidência × OCR/validação) — §6.6 |
| Dashboards básicos | R49–R55 (versão mínima) | Ao menos volume por etapa e aproveitamento |
| Recuperação de Valor (novo) | (proposto) | **Desmanche/colheita de peças**, estoques de **peças** e **sucata** e **motor de recuperação de valor** (§2.6); a **venda** entra em Onda 3-Could (Integração & Valor)/Onda 4 (Produto) |

**MVP Stretch** (desejável no MVP se houver folga):
- R19 (blacklists) — pode entrar no core apenas como cadastro (relação de NDSs a identificar na triagem).
- R49–R55 em versão completa (atualização "online", janelas último hora/dia/semana/mês).
- R38 (integração com o **Centro de Reciclagem Central**) se estiver viável no prazo.

**Fora do MVP** (explicitamente adiado → ver Onda 3-Could (Integração & Valor)/Onda 4 (Produto)):
- R39–R46 (APIs de fornecedores) — no MVP, entrada via tela; APIs entram em Onda 3-Could (Integração & Valor).
- R47 (gestão de materiais e de estoque) e R48 (devolutiva ao **Sistema Mestre de Materiais Serializados**) — adaptadores em Onda 3-Could (Integração & Valor).
- Relatórios avançados com filtros combinados (R55 completa).
- **Venda de peças e sucata** (precificação, catálogo/marketplace, NF) — o MVP **registra** desmanche e estoques; a **venda** entra em Onda 3-Could (Integração & Valor)/Onda 4 (Produto) (§2.6).
- Mobile/offline e visão multi-tenant self-service (Onda 4 (Produto)).

### 4.3 Critérios de sucesso do MVP
- Um item consegue percorrer **todas as etapas** com rastreabilidade completa (quem/quando/onde) e sem "buraco" de informação.
- Etiquetas **não duplicam** e a reimpressão é auditável (R59).
- A triagem **recusa/reconhece** itens inválidos ou em lista (blacklist/scrap/boomerang).
- Indicadores mínimos de volume e aproveitamento são confiáveis.
- A operação **abandona a planilha/sistema atual** para o fluxo coberto.
- A **recuperação de valor** (peças/sucata) é registrada e visível, reduzindo o **prejuízo líquido** por ativo (§2.6).

> ⚠️ **Alerta de escopo:** o MVP escolhido (R20 completo) já é ambicioso: cobre ~45 (estimativa) dos 59 requisitos em profundidade. Recomenda-se internamente fatiar em **Onda 1-Must (MVP mínimo)** (sete etapas, de triagem a expedição, com sucata como ramo de descarte e 1 modelo) e **Onda 2-Should (MVP completo)** (todas as variações, dashboards e integrações). Ver §16.

---

## 5. Horizontes de evolução (Onda 1-Must (MVP mínimo) → Onda 5 (Plataforma))

| Horizonte | Tema | Foco | Resultado esperado |
|---|---|---|---|
| **Onda 1-Must (MVP mínimo) e Onda 2-Should (MVP completo) — Operação** | *Funcionar ponta a ponta* | Workflow completo, cadastros, etiquetas, validação de dispositivo, dashboards básicos | Sistema substitui o atual; operação confiável e rastreável |
| **Onda 3-Could (Integração & Valor)** | *Conectar e recuperar valor* | APIs de parceiros (R39–R46), materiais/estoque (R47), devolutiva ao cadastro mestre (R48), Centro de Reciclagem Central (R38), relatórios avançados (R55), **venda de peças/sucata (RMR Market)** | Zero digitação manual; **receita acessória de peças/sucata** |
| **Onda 4 (Produto)** | *Multi-cliente e self-service* | Multi-tenancy, onboarding, workflow self-service, mobile/coletor + offline, billing, analytics avançado, SSO (*Single Sign-On*)/API pública, **marketplace de peças/sucata** | Vira SaaS vendável para outras operações |
| **Onda 5 (Plataforma)** | *Ecossistema e inteligência* | Marketplace de reparadoras, IA preditiva, ESG/carbono, Digital Product Passport, extensões/SDK, benchmark | Efeito de rede e novas receitas |

**Detalhamento por horizonte**

- **Onda 1-Must (MVP mínimo) e Onda 2-Should (MVP completo):** §4 (inclui o **registro** de desmanche/estoques de peças e sucata; a **venda** entra em Onda 3-Could (Integração & Valor)).
- **Onda 3-Could (Integração & Valor):** APIs dos parceiros com contrato versionado, fila e reconciliação; integração com o **Sistema Mestre de Materiais** e o de **Estoque Avançado** para movimento de estoque/NF; devolutiva ao **Sistema Mestre de Materiais Serializados** (sucesso/insucesso, sucateado/expedido); **Centro de Reciclagem Central** para controle logístico; **Recuperação de Valor:** desmanche/colheita, estoques de peças e sucata, precificação e **venda** (NF).
- **Onda 4 (Produto):** cada cliente tem workflow, catálogos e *aliases* próprios; onboarding sem intervenção; app Android/coletor com sincronização offline; portal do parceiro (a "reparadora" vira usuário externo com acesso restrito); API pública documentada; **marketplace de peças e sucata (RMR Market)**.
- **Onda 5 (Plataforma):** recomendação automática reparo-vs-sucata, previsão de boomerang, passaporte digital do produto, relatórios ESG (evitação de resíduos/CO₂), marketplace conectando demanda e capacidade de reparo.

---

## 6. Arquitetura e tecnologia (Java/Quarkus + React)

### 6.1 Princípios
1. **Núcleo genérico, integrações isoladas** — o domínio não conhece os sistemas de referência (cadastro mestre, materiais, estoque, centro de reciclagem); eles são adaptadores.
2. **Configuração acima de código** — workflow, catálogos, etiquetas e telas por perfil são dados, não *if* no código.
3. **Multi-tenant-ready desde o dia 1** — mesmo que o MVP tenha 1 tenant.
4. **Trilha de auditoria imutável** — todo movimento de item é um evento.
5. **Evolução incremental** — partir do mínimo necessário e extrair complexidade só quando doer.

### 6.2 Stack

> 🔄 **Decisão (ADR-012):** o **Onda 1-Must (MVP mínimo)** adota **Java 25 + Quarkus (Mandrel)**, **PostgreSQL 17+ com RLS (*Row Level Security*) desde a Onda 1-Must (MVP mínimo)** e roda **inteiro em Docker Compose (servidor interno)**; **DOKS/Kong/Istio/Redis → alvo SaaS (Onda 4 (Produto)/Onda 5 (Plataforma))**. Fonte: [checklist-arquitetura-onda-1](../../prj-tecnico/checklist-arquitetura-onda-1.md).

| Camada | Escolha | Por quê |
|---|---|---|
| Backend | **Java 25 + Quarkus** | Maduro, corporativo, ótimo para integrações; startup instantâneo e build nativo (Mandrel) |
| Módulos | **Quarkus (monólito modular)** | Fronteiras de módulo explícitas |
| Persistência | **PostgreSQL 17+ com RLS** + Flyway | Confiável, JSONB p/ campos flexíveis, **RLS ativo desde a Onda 1-Must (MVP mínimo)** (ADR-002) |
| ORM | JPA/Hibernate + JDBC onde performance importar | — |
| Mensageria/eventos | Outbox → **RabbitMQ/Kafka** quando escalar | Desacopla integrações |
| Workflow | **Máquina de estados própria + tabela de configuração** *(Flowable/Camunda só se BPMN for exigido)* | Configuração acima de código; adianta a PENDENCY-0003 |
| Relatórios/etiquetas | **JasperReports** (ZPL/PDF) | Layouts de etiqueta por equipamento/parceiro |
| Frontend | **React + TypeScript** (Vite), TanStack Router/Query, design system | SPA responsiva (Premissa 4) |
| Auth | **Keycloak + quarkus-oidc** | SSO, MFA (*Multi-Factor Authentication*), RBAC (*Role-Based Access Control*), políticas de senha/sessão — **auto-hospedado na Onda 1-Must (MVP mínimo)** |
| API | REST (OpenAPI) — GraphQL só se surgir necessidade real | Contrato documentado e integração direta |
| Observabilidade | OpenTelemetry + Prometheus/Grafana/Loki | Diagnóstico de integrações |
| Deploy | **Onda 1-Must (MVP mínimo): Docker Compose em servidor interno**; SaaS Onda 4 (Produto)/Onda 5 (Plataforma): DOKS + Kong + Istio (+ Redis) | Evolução gradual (ADR-012) |

### 6.3 Do monólito modular aos serviços
- **Onda 1-Must (MVP mínimo) a Onda 4 (Produto):** **monólito modular** (módulos: `asset`, `workflow`, `catalog`, `repair`, `packaging`, `shipping`, `value-recovery`, `identity`, `integration`, `reporting`). Menor custo operacional e operação mais direta para a equipe.
- **Onda 4 (Produto)/Onda 5 (Plataforma):** extrair apenas o que precisa escalar ou isolar (ex.: `integration`, `reporting`, `notification`), guiado por dados — não por moda.

### 6.4 Multi-tenancy (preparação para SaaS)
- **Estratégia:** `tenant_id` em todas as tabelas + **RLS do PostgreSQL** (isolamento por linha). Schema-per-tenant fica como opção para clientes "enterprise".
- **Configuração por tenant:** workflow, catálogos, aliases de termos, layouts de etiqueta, políticas de acesso, branding (white-label).
- **Domínios:** subdomínio ou caminho por tenant (`cliente.app...`).
- ✅ **Decidido (2026-10-19):** RLS ativo desde a Onda 1-Must (MVP mínimo), com `tenant_id` em todas as tabelas e policies de isolamento por linha. O modelo nasce multi-tenant-ready; schema-per-tenant fica como opção para clientes enterprise. Ver [ADR-002](../../../../docs/tecnico/arquitetura/adrs/adr-002-rls-multi-tenant.md).

### 6.5 Eventos e integração
- Padrão **Outbox + Inbox** para garantir consistência entre transação e evento.
- **Idempotência** obrigatória nas APIs de recebimento (R39–R46) — chave natural + hash de payload.
- **Anti-Corruption Layer**: cada legado tem seu adaptador, com mapeamento e validação próprios.
- **Validação de lei de formação** (R46) como regra de domínio reutilizável.
- **Reconciliação** periódica com o cadastro mestre de materiais serializados, a gestão de materiais/estoque e o centro de reciclagem central (job de conferência e alerta de divergência).

### 6.6 Configurabilidade (chave do produto genérico)
- **Workflow builder** (etapas/transições/permissões).
- **Form builder** por etapa (quais campos aparecem).
- **Catálogos** de defeito/causa/serviço/insumo por tenant.
- **Etiquetas** (templates) por modelo/parceiro.
- **Dicionário de termos** para renomear conceitos (NDS→"código", Reparadora→"parceiro", etc.).
- **Política de evidência por imagem** — por **cliente** e por **produto/modelo** (e por fase): **(a)** obrigatória ou opcional; **(b)** em **quais fases** se aplica; **(c)** finalidade — **somente evidência** (foto arquivada junto ao histórico) ou **evidência + OCR/validação** (confere se a foto bate com o código lido). Aplica-se apenas a materiais **serializados**. Motivo de ser configurável: **potencial SaaS** (clientes com políticas diferentes).

### 6.7 Frontend (web responsiva no MVP)
- Telas de operação **otimizadas para terminal + leitor de código** (input focado, atalhos, sem mouse).
- Painéis com atualização "online" (polling no MVP; WebSocket/SSE depois).
- Componentização do workflow para renderizar etapas conforme configuração do tenant.

### 6.8 Segurança e conformidade
- **LGPD**: minimização de dados, base legal, retenção, auditoria, anonimização em analytics.
- **RBAC + telas por perfil** (R1), **login único** (R2), **inativação automática** (R3), **troca de senha periódica** (R4), **reset com notificação** (R5).
- **Trilha de auditoria** imutável de toda movimentação e impressão de etiqueta.
- ⬜ **Aberto:** haverá SSO com o diretório corporativo do primeiro cliente (AD/Azure AD)?

### 6.9 Caminho mobile/offline (Premissa 4)
- **Onda 1-Must (MVP mínimo) e Onda 2-Should (MVP completo):** web responsiva; leitores USB/Bluetooth conectados a terminais.
- **Onda 4 (Produto):** **PWA** primeiro (custo baixo) e, se o chão de fábrica exigir, **app nativo Android** com fila offline e sincronização idempotente (resolver conflitos por evento, não por estado).
- **Regra de ouro:** a operação offline deve registrar **eventos** (leituras/transições), nunca "sobrescrever estado" — facilita conciliação.

---

## 7. Estratégia de integração (o "produto dentro do produto")

| Sistema/Parceiro | Direção | Requisitos | Padrão de abordagem |
|---|---|---|---|
| Sistema Mestre de Materiais Serializados (ex-CSI) | Consulta + devolutiva | R17, R22, R48 | Adapter de leitura + evento de saída (sucesso/insucesso, sucateado/expedido) |
| Sistema Mestre de Materiais (ex-SAP) | Consulta + atualização | R47 | Consultar/atualizar status do material (reciclado ✅ / não ✅) |
| Sistema de Gestão de Estoque Avançado (ex-SAP) | Escrita/Leitura | R47 | Buscar/receber/devolver material; movimento de estoque e NF; idempotência + reconciliação |
| Centro de Reciclagem Central (ex-DLX/DHL) | Escrita/Leitura | R38 | Composição de controle logístico online; roteamento a parceiros |
| Parceiro de recebimento | Entrada | R40 | API de recebimento (NF, material, qtd, NDS, serial, datas) |
| Linha de reciclagem | Entrada | R41 | API de teste/falha/scrap/troca de peças |
| Laboratório | Entrada | R42 | API de técnico/defeito/causa/serviço |
| Embalagem | Entrada | R43 | API de smart card/fonte |
| Expedição | Entrada | R44 | API de NF de saída/sucata |
| Pallet ID | Entrada | R45 | API de composição de pallet |
| (Todos) | Validação | R46, R39 | Recusa de dados inválidos/fora de ordem; contrato versionado |

**Padrões transversais propostos**
- **Contrato versionado** (OpenAPI) + sandbox para parceiros.
- **Fila + retry + dead-letter** para não perder evento de parceiro.
- **Reconciliação e alertas** de divergência (estoque, NF, pallet).
- **Padrão de mercado para rastreabilidade:** avaliar alinhamento a **GS1/EPCIS** (eventos de supply chain) e códigos **GS1 (SSCC/GTIN/DataMatrix)** — diferencial competitivo em Onda 4 (Produto)/Onda 5 (Plataforma).
- **Nota fiscal/logística:** avaliar UBL/EDIFACT se surgirem clientes com exigência fiscal/logística mais forte.

---

## 8. Modelo de domínio (esboço conceitual)

**Agregados e entidades principais:**

- **Tenant** — cliente/organização (mesmo que 1 no MVP).
- **Material (SKU)** — o produto/catálogo (nível de **definição**): código, descrição, fabricante, fornecedor, **regra de formação do código**, atributo `tipo` (`serializado` / `não serializado`) e **unidade de medida** padrão. Espelha o *Sistema Mestre de Materiais*.
- **Material Serializado (unidade)** — a peça individual rastreável (nível de **instância**): `trackingCode` (NDS), `externalIds[]` (IMEI/serial/smart card), estágio atual, histórico; referencia **1 Material (SKU)**. Ex.: decodificadores, modems, receptores, celulares, relógios, smartwatches, notebooks, desktops, tablets. Espelha o *Sistema Mestre de Materiais Serializados*.
- **Apontamento de material não serializado** — registro de **quantidade** por **unidade de medida** (un, m, kg, L...), **sem código unitário** no transporte/reciclagem. Ex.: antenas, cabos, fios, parafusos, LNBs, conectores. O mesmo workflow aceita os dois modos (unidade × quantidade).
- **Movimento de estoque** — quantidade por SKU/UoM e por parceiro. Espelha o *Sistema de Gestão de Estoque Avançado*.
- **Recuperação de Valor (§2.6)** — `Part` (peça: SKU + condição + garantia), `HarvestLot` (lote de colheita/desmanche), `ScrapMaterial` (sucata por material/**UoM**), `PriceTable` (precificação), `SaleOrder` (venda), `Buyer` (comprador), `DataDestructionCertificate` (LGPD), `AccountingWriteOff` (baixa patrimonial contábil).
- **Catalog** — DefectType, DamageLocation, RootCause, ServiceType, NoFixReason, RepairLevel.
- **Insumo/Consumível (material de consumo)** — tampa, painel, cabos, fontes, antena; com **BOM** de componentes substituídos. *Não confundir com "Material (SKU)": aqui é o item consumido no reparo.*
- **WorkflowDefinition + WorkflowInstance** — etapas, transições, campos e permissões por etapa; instância por item (unidade serializada ou lote de SKU).
- **StageTransition (evento)** — ator, data/hora, local, leitura do identificador. *Núcleo da auditoria.*
- **Evidência (mídia/imagem)** — fotos/imagens anexadas ao item **serializado** e/ou à transição (ex.: triagem, embalagem) para **certificar o código** lido (`trackingCode`/IMEI/serial). Auditoria e anti-fraude. **Configurável** por cliente/modelo: obrigatoriedade, fases de aplicação e finalidade (evidência × OCR/validação — §6.6). **Não se aplica a não serializados**.
- **WorkOrder (OS)** — técnico, início/fim, defeito, local, componente, causa raiz, serviço/sem conserto.
- **LabelTemplate + LabelPrintLog** — controle de impressão única e reimpressão auditada.
- **Package/Pallet + Shipping** — palletId, itens, NF de saída, data.
- **WatchList** — blacklist/scrap/boomerang (contagem de retornos).
- **Identity** — User, Role, Profile, ScreenAccess, SessionPolicy.
- **Integration** — ExternalRefs, Inbox/Outbox, SyncLog, DivergenceAlert.
- **Reporting** — views materializadas/KPIs.

**Padrões de domínio:**
- Estado do item = **projeção** dos eventos de transição (event sourcing leve na trilha, sem necessariamente event-sourcing completo).
- Toda etapa tem **pré-condições** (ex.: só expede se passou por run in) validadas em um único ponto.
- **WatchList** consultada na triagem e alimentada automaticamente (ex.: boomerang por contagem de retornos).

---

## 9. Dados, analytics e IA

### 9.1 KPIs do pedido (R49–R55) organizados
- **Triagem:** pallets, peças serializadas (**unidade**) × não serializadas (**quantidade/UoM**) — última hora/dia/semana/mês.
- **Processo:** volume por etapa; estoque entre etapas (por modelo/fabricante).
- **Qualidade/economia:** aproveitamento (% reciclagem/reparo/sucata por modelo, por parceiro, consolidado); consumo de insumos (tampas/painéis).
- **Recuperação de valor (§2.6):** taxa de recuperação de valor (%), receita de peças, receita de sucata, **prejuízo líquido** por ativo/modelo, % de peças colhidas × descartadas.
- **Rastreabilidade/auditoria:** tempo por etapa (lead time), retrabalho, reincidência (boomerang).

### 9.2 Oportunidades de IA (Onda 4 (Produto)/Onda 5 (Plataforma))
| Ideia | Descrição | Valor |
|---|---|---|
| OCR/leitura de etiqueta e NF | Digitalizar entrada sem digitação | Reduz erro e tempo |
| Certificação de código por imagem | Foto do código na triagem; OCR confirma que a imagem corresponde ao `trackingCode`/IMEI lido | Integridade/anti-fraude |
| Triagem visual | Foto do item classifica dano estético/defeito | Acelera triagem |
| Recomendação reparo × sucata | Decisão por custo-benefício e histórico | Economia |
| Predição de causa raiz | Padrões de falha por modelo/lote | Qualidade/fornecedor |
| Previsão de boomerang/reincidência | Antecipar retornos | Planejamento |
| Previsão de demanda/estoque | Equilibrar etapas | Eficiência |
| Detecção de fraude/troca de etiqueta | Anomalias em leitura/duplicidade | Integridade |
| Copilot do operador | Assistente no fluxo | Produtividade |
| Benchmark anônimo entre tenants | Percentis de aproveitamento | Valor SaaS |

> Regra: **IA só depois de dados confiáveis e eventos bem modelados** (§8). Sem trilha de eventos, não há modelo.

---

## 10. Modelo de negócio e monetização (SaaS)

Ideias de monetização (Onda 4 (Produto)+):

| Modelo | Descrição | Prós | Contras |
|---|---|---|---|
| Assinatura por usuário | Por seat/mês | Direto de cobrar | Penaliza operações grandes |
| Por volume processado | Por item/unidade processada | Escala com valor | Precisa medição confiável |
| Por módulos/recursos | Workflow, integração, analytics | Flexível | Complexidade de pacotes |
| Tiers | Starter/Pro/Enterprise | Claro ao mercado | Precisa de limites bem definidos |
| Marketplace (comissão) | Conexão operadora↔reparadora (Onda 5 (Plataforma)) | Receita de rede | Depende de massa |
| Serviços de integração | Setup/conectores sob medida | Receita imediata | Não escala sozinho |
| Add-on ESG/carbono | Relatórios e passaporte digital | Alto valor estratégico | Precisa metodologia auditável |
| **Venda de peças e sucata** (RMR Market) | Receita acessória — *Asset Recovery/ITAD* | **Reduz o prejuízo do ativo**; nova linha de receita | Exige precificação, LGPD e compliance ambiental (§2.6) |

**Recomendação inicial:** **Tier + volume processado** (base recorrente + escala com uso), com integrações como pacote Enterprise.

---

## 11. Ecossistema e extensibilidade (Onda 5 (Plataforma))

- **Portal do parceiro** (reparadoras/recicladoras como usuários externos com acesso restrito).
- **API pública + SDK** para parceiros enviarem dados (evolução natural de R39–R46).
- **Webhooks** para eventos (item expedido, sucateado, reprovado no run in).
- **Marketplace** de serviços de reparo/reciclagem com matching e reputação.
- **Marketplace de peças e sucata (RMR Market)** — venda de componentes recondicionados e materiais (ITAD / recuperação de valor — §2.6).
- **White-label** para operadores que queiram a plataforma com a própria marca.
- **Loja de extensões/relatórios** (templates de etiqueta, conectores).

---

## 12. Riscos, trade-offs e mitigações

| Risco | Impacto | Mitigação |
|---|---|---|
| Escopo do MVP (R20 completo) estourar | Alto | Fatiar em Onda 1-Must (MVP mínimo)/Onda 2-Should (MVP completo); congelar variações; sprints com demonstração ponta a ponta |
| Acoplamento a legados frágeis | Alto | Anti-corruption layer; filas; reconciliação; contratos versionados |
| "Nascer genérico" virar over-engineering | Médio | Genérico no **modelo/configuração**, direto na implementação; evitar abstrações especulativas |
| Multi-tenant prematuro custa caro | Médio | Custo aceito no gate de arquitetura; RLS ativo desde a Onda 1-Must (MVP mínimo) evita retrabalho, com `tenant_id` em todas as tabelas e policies revisadas no ENABLER-0004 ([ADR-002](../../../../docs/tecnico/arquitetura/adrs/adr-002-rls-multi-tenant.md)) |
| Usabilidade no chão de fábrica | Alto | Design focado em leitor/atalhos; testar com operadores reais cedo |
| LGPD/dados sensíveis | Alto | Minimização, auditoria, RBAC, anonimização |
| Sair de "sistema interno" → SaaS (GTM) | Alto | Tratar como produto: onboarding, docs, suporte, pricing (§10) |
| Concorrência (RMA/RL existentes) | Médio | Diferenciar em workflow configurável + rastreabilidade + integração + ESG |
| Hardware (impressoras/leitores) e ambientes | Médio | Homologar equipamentos; camada de abstração de impressão |
| Dependência de um único cliente no início | Médio | Manter o núcleo genérico; buscar 2º caso de uso ainda em Onda 4 (Produto) |
| Venda de peças/sucata: **LGPD e ambiental** | Alto | **Sanitização certificada de mídia (wipe lógico ou destruição física)** antes de vender; **MTR/PNRS**; reciclador licenciado (§2.6) |
| Precificação e **qualidade** de peças revendidas | Médio | Tabela de preços + classificação/condição + garantia; **testar antes de listar** |
| **Prejuízo contábil × receita acessória** | Médio | Baixa patrimonial rastreável + conciliação com Finanças (§2.6) |

**Trade-offs centrais a explicitar:**
- **Genérico × Enxuto:** configurar workflow é poderoso, mas custa mais que hard-code. No MVP, configurar apenas o necessário.
- **Monólito × Microsserviços:** monólito modular ganha da Onda 1-Must (MVP mínimo) à Onda 4 (Produto); extrair só com evidência.
- **Web × Mobile:** web responsiva cobre o MVP; offline é complexo — adiar até haver dor comprovada.
- **Produto × Projeto:** quanto mais cedo tratar como produto, mais retorno futuro, mas mais disciplina agora.

---

## 13. Parking lot (ideias avaliadas e adiadas)

- **EPCIS/GS1** como padrão de eventos de rastreabilidade (diferencial, Onda 4 (Produto)/Onda 5 (Plataforma)).
- **Digital Product Passport** (passaporte digital do produto) — tendência regulatória (UE/ESPR), Onda 5 (Plataforma).
- **Relatórios ESG/carbono** (evitação de resíduos e emissões) — add-on, Onda 5 (Plataforma).
- **Blockchain** para cadeia de custódia — avaliado e **descartado** no curto prazo (custo/benefício baixo vs. trilha de auditoria tradicional).
- **Gêmeo digital (digital twin)** do item — Onda 5 (Plataforma), após dados confiáveis.
- **Marketplace de peças/insumos** — **promovido**: a venda de peças e sucata passou a integrar a estratégia (§2.6, Onda 3-Could (Integração & Valor)/Onda 4 (Produto)); no parking lot fica apenas a vertente de **insumos entre tenants** (Onda 5 (Plataforma)).
- **App do cliente final** (consumidor devolve equipamento) — fora do escopo atual.
- **Integração com transportadoras além da atual** — Onda 4 (Produto)/Onda 5 (Plataforma) (abstrair "parceiro logístico").

---

## 14. Matriz de decisão (opções × critérios)

Escala 1–5 (5 = melhor). Só para orientar a conversa. As médias da última linha são **aproximadas, sem pesos publicados** — os critérios têm apenas peso qualitativo (alto/invertido) entre parênteses.

| Critério (peso) | A Interno | B Vertical | C Plataforma ✅ | D Marketplace | E Open-core |
|---|---|---|---|---|---|
| Alinhamento Premissa 1 — genérico (alto) | 1 | 3 | **5** | 5 | 4 |
| Time-to-value (alto) | 4 | 4 | 3 | 1 | 3 |
| Potencial de receita (alto) | 1 | 3 | **4** | 5 | 3 |
| Esforço de engenharia (invertido) | 5 | 4 | 3 | 2 | 2 |
| Esforço de produto/GTM (invertido) | 5 | 4 | 3 | 1 | 2 |
| Risco (invertido) | 5 | 4 | 3 | 2 | 3 |
| **Média aproximada (sugestão)** | 2,9 | 3,7 | **3,6** | 2,7 | 2,9 |

> **Leitura:** o Caminho C é o melhor equilíbrio entre ambição e viabilidade; B é o degrau intermediário; D é a evolução de longo prazo. A é apenas o "caso de uso inicial".

---

## 15. Perguntas em aberto / decisões pendentes

> ✅ = decidida · *itálico* = dono por papel atribuído em 2026-10-22 (papéis em [equipe](../../equipe.md)) · o detalhe mora no doc dono de cada decisão. **Itens 6 e 10–18** estão detalhados no [checklist de decisões do MVP](checklist-decisoes-mvp.md); o item 7 foi fechado pela PENDENCY-0018.

**Produto e estratégia**
1. ✅ **Nomes definidos** (Premissa 6): Projeto **RMR Reversa** · Produto **RMR Tech** · Venda **RMR Market** (§2.5). ✅ **Disponibilidade confirmada (2026-10-22):** registro disponível como empresa, site e domínio `.com.br`.
2. ✅ **Respondida (2026-10-22):** segundo segmento-alvo = **Telecom, Varejo, Lojistas, Shoppings, Construtoras, Parques, Setor Público e Escolas/Faculdades/Universidades**.
3. ✅ **Respondida (2026-10-22):** licenciamento **híbrido**.
4. ✅ **Respondida (2026-10-22):** norte de curto prazo em 3 fases: **1) operação estável e funcional; 2) operação impecável; 3) produto replicável**.

**MVP**
5. ✅ **Decidido (2026-10-16):** fatiar em **Onda 1-Must (MVP mínimo)/Onda 2-Should (MVP completo)**. Os cortes e a priorização vivem em `docs/produto/backlog/BACKLOG-LIST.md` (Onda 1-Must (MVP mínimo) = FEATURE-0001.0001 + FEATURE-0002.0001 + FEATURE-0002.0005 + FEATURE-0005.0005; Onda 2-Should (MVP completo) = restante do MVP). A composição foi complementada pela decisão 8 do backlog ao extrair a expedição para FEATURE-0002.0005.
6. No MVP, quantos modelos/fabricantes e quais variações de workflow precisam existir? *Dono: Operação/Oficina (Bruna Santos), com Suprimentos.*
7. ✅ **Respondida (2026-10-21):** impressoras, leitores e terminal. **Sem compra**: usar os equipamentos existentes (leitor USB HID/Bluetooth e terminal da oficina). A homologação de novos modelos segue o critério do [ENABLER-0008](../../prj-tecnico/enablers/ENABLER-0008-terminais-leitores.md) e a decisão registrada na [PENDENCY-0018](../../pendencias.md).

**Arquitetura e integração**
8. ✅ **Decidida (2026-10-19):** RLS multi-tenant ativo desde a Onda 1-Must (MVP mínimo) (gate de arquitetura 9/9, [ADR-002](../../../../docs/tecnico/arquitetura/adrs/adr-002-rls-multi-tenant.md)).
9. ✅ **Decidida (2026-10-19):** motor de workflow próprio, configurável por tabela, sem Flowable/Camunda na Onda 1-Must (MVP mínimo) ([ADR-003](../../../../docs/tecnico/arquitetura/adrs/adr-003-workflow-configuravel.md)).
10. SSO com diretório corporativo do primeiro cliente? *Dono: Segurança da Informação (Daniel Vini).*
11. ✅ **Decidida (ADR-006):** MVP com **Outbox + RabbitMQ**; Kafka como alvo Onda 4 (Produto)/Onda 5 (Plataforma) — [ADR-006](../../../../docs/tecnico/arquitetura/adrs/adr-006-rabbitmq-kafka.md) · [checklist §B2](checklist-decisoes-mvp.md).
12. Alvo de rastreabilidade padronizada (**GS1/EPCIS**): adotar desde já? *Dono: Arquiteto de Soluções (Bolismar da Silva), com Tech lead.*

**Operação e dados**
13. Quem são os parceiros (reparadoras/Assist) e qual o nível de maturidade para consumir API? *Dono: PM/PO (Joice Neves).*
14. Metodologia de ESG/carbono (se o add-on for priorizado). *Dono: Compliance (Gabriela Moraes).*

**Recuperação de valor (venda de peças e sucata, §2.6)**
15. Canal de venda: venda direta/leilão, contrato com recicladores ou **marketplace** (RMR Market)? *Dono: PM/PO (Joice Neves).*
16. Precificação: peças por % do valor de novo; sucata por kg/material: quem mantém a tabela? *Dono: PM/PO (Joice Neves), com Suprimentos (Roberta Castro).*
17. Peças vendidas terão **garantia/classificação** (usada testada × recondicionada) e rastreio de origem? *Dono: PM/PO (Joice Neves), com Jurídico (Legisvaldo Nunes).*
18. A **Regra dos 40%** migra para o **Motor de Recuperação de Valor** (incluindo receita de peças/sucata)? (§2.6) *Dono: PM/PO (Joice Neves), com Finanças/Controladoria (donos da FEATURE-0005.0006).*

---

## 16. Próximos passos sugeridos

1. ✅ **Nome e tese fechados** — Projeto **RMR Reversa** / Produto **RMR Tech** (§2.5); posicionamento em **ITAD / economia circular** (§2.2).
2. **Detalhar o MVP em fatias** (Onda 1-Must (MVP mínimo)/Onda 2-Should (MVP completo)) com critérios de aceite por etapa do workflow (R20).
3. **Provar o fluxo ponta a ponta** com 1 modelo de material e telas-configuráveis mínimas (risco maior: motor de workflow e etiquetas).
4. **Prototipar a integração com o Sistema Mestre de Materiais Serializados (ex-CSI)** e o contrato de 1 API de parceiro (R40) para validar o hub de integração.
5. **Validar usabilidade no chão de fábrica** com operadores reais (leitor + terminal).
6. **Definir modelo de dados multi-tenant** e as configs por tenant (workflow/catálogos/etiquetas/aliases).
7. **Decidir GTM/pricing** (§10) — mesmo que grosseiro — para não "construir produto e descobrir mercado".
8. **Registrar o que vira visão/produto**: a partir deste brainstorm, produzir um documento de **Visão de Produto** e depois **backlog** estruturado.
9. **Detalhar a Recuperação de Valor** (§2.6): regras do **Motor de Recuperação de Valor**, tabela de preços, fluxo de venda e travas de LGPD/ambiental (decisão registrada em [ADR-011](../../../../docs/tecnico/arquitetura/adrs/adr-011-motor-recuperacao-valor.md)).

> **Nota sobre a esteira Kairós (skills `krs-*` disponíveis):** quando a ideação virar demanda formal, dá para encadear `extracao → charter → planilha → maturidade → BRD → FRD`. Este `BRAINSTORM.md` serviria de insumo de contexto, não substitui esses artefatos.

