# 📝 Checklist de decisões — MVP (escopo, arquitetura de produto e recuperação de valor)

| Campo | Valor |
|---|---|
| **Objetivo** | Decidir as perguntas de produto que ainda não têm data de execução: escopo do MVP, integrações de produto, operação/ESG e recuperação de valor |
| **Participantes** | PM/PO (Joice Neves) · Operação/Oficina (Bruna Santos) · Arquiteto (Bolismar da Silva) · Segurança (Daniel Vini) · Compliance (Gabriela Moraes) · Suprimentos (Roberta Castro) · Jurídico (Legisvaldo Nunes) · Finanças |
| **Data de abertura** | 2026-10-23 |
| **Itens** | 12 mapeados · **2 decididos** (A2, B2) · **1 promovido ao hub** (A3) · **1 fora do escopo** (C2) · **1 em discussão** (B1) · **7 abertos** (A1, B3, C1, D1–D4) |
| **Fonte** | [BRAINSTORM §15](BRAINSTORM.md) (perguntas 6, 7, 10–18) · [taxonomia](../../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md) · [ADR-006](../../../../docs/tecnico/arquitetura/adrs/adr-006-rabbitmq-kafka.md) · [ADR-011](../../../../docs/tecnico/arquitetura/adrs/adr-011-motor-recuperacao-valor.md) |
| **Status do doc** | 📝 **Em formação (2026-10-23)** — itens de Onda 2-Should (MVP completo)/descoberta; não bloqueiam a Onda 1-Must (MVP mínimo) |

> **Como usar.** Uma linha por decisão. Preencher **Resposta**, marcar **Status** e manter **Dono + prazo**. Item que entrar no horizonte de execução (Onda 2-Should (MVP completo)) é **promovido ao [hub](../../pendencias.md)** com `PENDENCY-NNNN` — até lá, o controle é este checklist.

**Legenda de Status:** ⬜ Não respondida · ⏳ Em discussão · ✅ Decidida · ⬆️ Promovida ao hub · ❌ Fora do escopo (adiada)

> **Não estão aqui** (já decididas no BRAINSTORM §15): itens 1–5 (nomes, segmentos, licenciamento, norte de curto prazo, fatiamento Onda 1-Must (MVP mínimo)/Onda 2-Should (MVP completo)), 8 (RLS) e 9 (workflow configurável). Detalhe no próprio BRAINSTORM e nos ADRs.

---

## A. Escopo do MVP

### A1. Quantos modelos/fabricantes e variações de workflow no MVP
- **Pergunta:** qual o **catálogo mínimo** de modelos/fabricantes da Onda 1-Must (MVP mínimo) e da Onda 2-Should (MVP completo), e quais **variações de workflow** precisam existir? (a taxonomia já prevê 11 categorias/tipos e catálogo completo em FEATURE-0001.0003)
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** Operação/Oficina + Suprimentos · **Prazo:** 2026-12-15
- **Impacto:** dimensiona seeds do ENABLER-0005/0010 e o esforço de configuração de workflow.

### A2. Modelos de impressoras e leitores homologados
- **Pergunta:** quais modelos serão homologados? A PENDENCY-0018 decidiu **usar os equipamentos existentes** (leitor USB HID/Bluetooth + terminal da oficina) e **não comprar** leitores, terminal ou impressoras.
- **Resposta:** ✅ **Sem compra.** Usar os equipamentos existentes: o leitor atual que emula teclado e o terminal da oficina, validados no [ENABLER-0008](../../prj-tecnico/enablers/ENABLER-0008-terminais-leitores.md) conforme a [PENDENCY-0018](../../pendencias.md). Novos modelos entram pelo mesmo critério de validação HID USB/Bluetooth em Firefox e Chrome descrito no Enabler.
- **Status:** ✅ Decidida (2026-10-21) · **Dono:** Infraestrutura (Lourival Louro) · **Prazo:** n/a
- **Impacto:** fecha o [ENABLER-0008](../../prj-tecnico/enablers/ENABLER-0008-terminais-leitores.md) sem reabrir compra.

### A3. Importação em massa da watchlist
- **Pergunta:** planilha é prioridade? Qual formato e validação?
- **Status:** ⬆️ **promovida ao hub** — [PENDENCY-0023](../../pendencias.md) (dono Suprimentos/TI + PM/PO, prazo 2026-11-07)

---

## B. Arquitetura e integração (perspectiva de produto)

### B1. SSO com diretório corporativo do primeiro cliente
- **Pergunta:** o primeiro cliente exige **AD/LDAP** no go-live, ou o Keycloak local da Onda 1-Must (MVP mínimo) basta? O gate de arquitetura decidiu AD em **Onda 4 (Produto)/Onda 5 (Plataforma)** — confirmar que isso vale para o 1º contrato.
- **Resposta:** _a preencher_
- **Status:** ⏳ (Onda 1-Must (MVP mínimo) = Keycloak local; federação AD adiada para Onda 4 (Produto)/Onda 5 (Plataforma)) · **Dono:** Segurança (Daniel Vini) · **Prazo:** 2026-12-15
- **Impacto:** se o cliente exigir AD no go-live, vira requisito de contrato — não de arquitetura.

### B2. Mensageria — RabbitMQ × Kafka
- **Pergunta:** começar com **Outbox + RabbitMQ** ou já Kafka?
- **Resposta:** ✅ **RabbitMQ no MVP; Kafka como alvo Onda 4 (Produto)/Onda 5 (Plataforma)** — [ADR-006](../../../../docs/tecnico/arquitetura/adrs/adr-006-rabbitmq-kafka.md), confirmado no [inventory](../../../../docs/tecnico/inventory.md) item 10
- **Status:** ✅ Decidida · **Dono:** Arquiteto · **Prazo:** —
- **Impacto:** a mensageria do MVP está decidida e registrada no ADR-006.

### B3. GS1/EPCIS desde já
- **Pergunta:** adotar rastreabilidade padronizada GS1/EPCIS no MVP ou só registrar identificadores proprietários?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** Arquiteto + Tech lead · **Prazo:** 2026-12-15
- **Impacto:** se sim, muda o modelo de identificadores e a etiqueta (FEATURE-0002.0002); se não, vira evolução.

---

## C. Operação e dados

### C1. Parceiros (reparadoras/Assist) e maturidade para consumir API
- **Pergunta:** quem são os parceiros e qual o nível de maturidade deles para consumir API? Há parceiro sem integração possível (só planilha/portal)?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** PM/PO · **Prazo:** 2026-12-15
- **Impacto:** define o escopo das APIs de parceiros (R39–R46) e se a Onda 1-Must (MVP mínimo) precisa de entrada manual.

### C2. Metodologia de ESG/carbono
- **Pergunta:** qual metodologia adotar (GHG Protocol, inventário próprio, cálculo por fração)? Só se o add-on for priorizado.
- **Resposta:** _a preencher_
- **Status:** ❌ fora do escopo até o add-on ser priorizado · **Dono:** Compliance (Gabriela Moraes) · **Prazo:** 2026-12-15
- **Impacto:** nenhum na Onda 1-Must (MVP mínimo); define dados a coletar desde já se for priorizado.

---

## D. Recuperação de valor (peças e sucata)

> Base: [ADR-011](../../../../docs/tecnico/arquitetura/adrs/adr-011-motor-recuperacao-valor.md) — o motor existe como decisão, mas as regras de negócio abaixo não estão especificadas.

### D1. Canal de venda
- **Pergunta:** venda direta/leilão, contrato com recicladores ou **marketplace** (RMR Market)?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** PM/PO · **Prazo:** 2026-12-15
- **Impacto:** define se o motor de valor precisa de catálogo público, proposta e pedido.

### D2. Precificação
- **Pergunta:** peças por **% do valor de novo**; sucata por **kg/material**. Quem mantém a tabela e com que frequência?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** PM/PO + Suprimentos · **Prazo:** 2026-12-15
- **Impacto:** tabela de preços versionada + trilha de auditoria da alteração.

### D3. Garantia e classificação das peças vendidas
- **Pergunta:** peça vendida tem **garantia** e **classificação** (usada testada × recondicionada) com rastreio de origem?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** PM/PO + Jurídico · **Prazo:** 2026-12-15
- **Impacto:** campos no ativo/peça + termo de venda; pode virar trava de compliance.

### D4. Migração da “Regra dos 40%” para o motor de valor
- **Pergunta:** a Regra dos 40% migra para o **Motor de Recuperação de Valor**, incluindo receita de peças/sucata? Quem é o dono da FEATURE-0005.0006 nessa virada?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** PM/PO + Finanças/Controladoria · **Prazo:** 2026-12-15
- **Impacto:** substitui cálculo planilha por regra no motor — decidir antes da Onda 2-Should (MVP completo) de recuperação de valor.

---

## 4. Conclusão

| Campo | Preencher |
|---|---|
| Itens decididos | `2 de 12` (A2 e B2) |
| Itens promovidos ao hub | `1` (A3 = PENDENCY-0023) |
| Itens fora do escopo | `1` (C2) |
| Itens em discussão | `1` (B1) |
| Itens abertos | `7` (A1, B3, C1, D1–D4) |
| Promoções ao hub no gate da Onda 2-Should (MVP completo) | a definir quando a Onda 2-Should (MVP completo) for aberto |
| Próxima revisão | `2026-12-15` (ou no gate da Onda 2-Should (MVP completo)) |
