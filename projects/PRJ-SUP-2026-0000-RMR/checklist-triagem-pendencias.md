# 📝 Checklist de triagem — pendências fora do hub

| Campo | Valor |
|---|---|
| **Objetivo** | Triar os itens abertos identificados na varredura de documentação de 2026-10-22/23 e devolvê-los ao lugar certo: **hub** (com dono + prazo), **checklist temático** (Onda 2-Should (MVP completo)/descoberta) ou **encerrado** |
| **Responsáveis** | PM/PO (Joice Neves) + Tech lead (Francisco Oliveira) |
| **Data da triagem** | 2026-10-23 |
| **Itens** | 14 triados: **10 promovidos ao hub** (PENDENCY-0020…0029) · **3 mantidos** em checklists temáticos · **1 encerrado por decisão** (A2) · 4 “falsas pendências” encerradas |
| **Fonte** | Varredura de `docs/**/*.md` + `PRD.md` (link-checker: 0 links quebrados; `scripts/check-pendencias.sh`: 0 vencidas) |
| **Status do doc** | ✅ **Triagem concluída (2026-10-23)** — arquivar em 2026-11-23, quando as 10 promovidas já estiverem no ciclo do hub |

> **Como usar.** Uma linha por candidato. A coluna **Decisão** diz o que aconteceu com o item; **Destino** diz onde ele vive agora. Item promovido ao hub **não é copiado aqui** — o detalhe fica no doc de origem, a linha de controle fica em [pendencias.md](pendencias.md).

**Legenda de decisão:** ⬆️ Promovida ao hub · 🅿️ Mantida em checklist temático (Onda 2-Should (MVP completo)) · ✅ Já estava coberta · ❌ Encerrada sem ação

> ⚖️ **Regra de convivência:** **checklist decide, o hub controla.** Todo item do horizonte **Onda 1-Must (MVP mínimo)/Onda 2-Should (MVP completo)** ganha `PENDENCY-NNNN` com dono e prazo ISO no hub. Item de **Onda 2-Should (MVP completo)/descoberta** fica no checklist temático com dono e prazo — e é promovido ao hub quando entra no horizonte de execução.

---

## A. Horizonte Onda 1-Must (MVP mínimo)/Onda 2-Should (MVP completo) — promovidos ao hub

| # | Item | Origem (detalhe) | Dono | Prazo | Decisão | Destino |
|---|---|---|---|---|---|---|
| 1 | Fechamento do contrato do cadastro mestre com a área dona (TMF639 · desfechos BR-1.4.3 · URL/escopos OAuth) | [integracao-cadastro-mestre §9](../../docs/tecnico/arquitetura/integracoes/integracao-cadastro-mestre.md) | Eng + área dona | 2026-11-07 | ⬆️ | [PENDENCY-0020](pendencias.md) |
| 2 | Verificação do servidor interno da Onda 1-Must (MVP mínimo) (risco 5 da Sprint 1) | [Sprint 1 §7](prj-produto/sprints/sprint-1-fundacao.md) · [ENABLER-0001](prj-tecnico/enablers/ENABLER-0001-servidor-interno-docker-compose.md) | Lourival Louro + Marcos Praia | 2026-10-30 | ⬆️ | [PENDENCY-0021](pendencias.md) |
| 3 | Nomenclatura canônica `MODELO`/`ATIVO` × `MATERIAL`/`MATERIAL_SERIALIZADO` (bloqueia DDL da FEATURE-0001.0001) | [mer.md §4](../../docs/tecnico/arquitetura/mer.md) | Arquiteto | 2026-10-30 | ⬆️ | [PENDENCY-0022](pendencias.md) |
| 4 | Importação em massa da watchlist (planilha) | [US-FEAT-0001.0005-0020 §45](prj-produto/user-stories/US-FEAT-0001.0005-0020-cadastro-watchlist.md) | Suprimentos/TI + PM/PO | 2026-11-07 | ⬆️ | [PENDENCY-0023](pendencias.md) |
| 5 | Ritual de promoção homolog → produção da Onda 1-Must (MVP mínimo) | [devops §2](../../docs/tecnico/arquitetura/devops.md) | Tech lead + Infra | 2026-10-30 | ⬆️ | [PENDENCY-0024](pendencias.md) |
| 6 | Ferramenta de SAST/secret scan + cronograma do gate ZAP | [devops §1](../../docs/tecnico/arquitetura/devops.md) · [SECURITY §6](../../docs/tecnico/seguranca/SECURITY.md) | Tech lead + Segurança | 2026-11-06 | ⬆️ | [PENDENCY-0025](pendencias.md) |
| 7 | Dimensionamento do servidor e região/custo do alvo Onda 4 (Produto)/Onda 5 (Plataforma) | [checklist-arquitetura §C1](prj-tecnico/checklist-arquitetura-onda-1.md) | Infra | 2026-10-30 | ⬆️ | [PENDENCY-0026](pendencias.md) |
| 8 | 4 integrações sem doc/dono + escolha do sistema externo do cadastro mestre | [inventory §6](../../docs/tecnico/inventory.md) | Arquiteto | 2026-11-13 | ⬆️ | [PENDENCY-0027](pendencias.md) |
| 9 | Persistência do `MAC_ADDRESS` e colunas MTR/CDF no DDL | [data-dictionary §7](../../docs/tecnico/arquitetura/data-dictionary.md) · [datamapping §6](../../docs/tecnico/arquitetura/datamapping.md) | Eng + Eng de Dados | 2026-11-13 | ⬆️ | [PENDENCY-0028](pendencias.md) |
| 10 | Validação do padrão de identificação de entidades (7 itens) | [padrao-identificacao-entidades §4](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/padrao-identificacao-entidades.md) | Arquiteto + PO | 2026-11-07 | ⬆️ | [PENDENCY-0029](pendencias.md) |

---

## B. Onda 2-Should (MVP completo) / descoberta — mantidos em checklist temático

| # | Item | Origem | Dono (papel) | Decisão | Destino |
|---|---|---|---|---|---|
| 11 | Quantos modelos/fabricantes e variações de workflow no MVP | [BRAINSTORM §15](prj-produto/discovery/BRAINSTORM.md), pergunta 6 | Operação/Oficina + Suprimentos | 🅿️ | [checklist-decisoes-mvp §A1](prj-produto/discovery/checklist-decisoes-mvp.md) |
| 13 | SSO com AD corporativo · mensageria (RabbitMQ × Kafka) · GS1/EPCIS | [BRAINSTORM §15](prj-produto/discovery/BRAINSTORM.md), perguntas 10–12 | Segurança · Arquiteto | 🅿️ | [checklist-decisoes-mvp §B](prj-produto/discovery/checklist-decisoes-mvp.md) |
| 14 | Maturidade de parceiros · ESG/carbono · recuperação de valor (canal, preço, garantia, Regra dos 40%) | [BRAINSTORM §15](prj-produto/discovery/BRAINSTORM.md), perguntas 13–18 | PM/PO · Compliance · Finanças | 🅿️ | [checklist-decisoes-mvp §C/§D](prj-produto/discovery/checklist-decisoes-mvp.md) |

> **Por que não vão ao hub agora:** não bloqueiam Onda 1-Must (MVP mínimo) nem Onda 2-Should (MVP completo) e ainda não têm data de execução. Cada um já tem **dono e prazo** no checklist temático; a promoção ao hub acontece no gate da Onda 2-Should (MVP completo).

---

## C. Avaliados e encerrados (não viram pendência)

| Item | Por que não é pendência | Decisão |
|---|---|---|
| Compra e homologação de leitores, terminal e impressoras (item 12) | Resolvida em **PENDENCY-0018** e no checklist **§A2**: sem compra, equipamentos existentes; homologação de novos modelos segue o [ENABLER-0008](prj-tecnico/enablers/ENABLER-0008-terminais-leitores.md) | ✅ |
| Licença/bloqueio de recicladora, formato do certificado de wipe | Resolvidas no [checklist jurídico](prj-negocio/requisitos/checklist-juridico-compliance.md) (7/7) | ✅ |
| Watchlist — feature dona, boomerang, identificadores, kits | Respondidas no hub (PENDENCY-0001/0012/0013/0017) | ✅ |
| Stack da Onda 1-Must (MVP mínimo), RLS, Keycloak, workflow configurável | Gate de arquitetura 9/9 (PENDENCY-0015) + [ADR-012](../../docs/tecnico/arquitetura/adrs/adr-012-stack-onda-1.md) | ✅ |

---

## D. Achados de consistência (edição editorial — não são pendências)

Encontrados na mesma varredura, **sem dono/prazo** porque não exigem decisão: são correções de texto. **Aplicados em 2026-10-23**, em commit separado da triagem.

| # | Onde | Correção | Status |
|---|---|---|---|
| 1 | `PRD.md` §6.2 | Contadores do hub atualizados (11 no prazo · 5 adiadas · 13 respondidas) + link da triagem | ✅ |
| 2 | [requisitos-negocio.md](prj-negocio/requisitos/requisitos-negocio.md) | “3 eixos, 9 entidades” (eram 7 tabelas) e rastreabilidade B-REQ-04 → FEATURE-0005.0006 / B-REQ-05 → FEATURE-0005.0005 | ✅ |
| 3 | EPIC-0003 / EPIC-0004 | Corrigidos para “fora da Onda 1-Must (MVP mínimo), na Onda 2-Should (MVP completo)” — FEATURE-0003.0001 e FEATURE-0004.0001 são Onda 2-Should (MVP completo) no backlog | ✅ |
| 4 | [FEATURE-0001.0001 §2](prj-produto/features/FEATURE-0001.0001-recebimento-ativos.md) | Watchlist aponta para FEATURE-0001.0005 (PENDENCY-0001 ✅); §6 marcada como resolvida | ✅ |
| 5 | [FEATURE-0005.0005 §2](prj-produto/features/FEATURE-0005.0005-travas-lgpd-compliance.md) | MTR aponta para a decisão (§6, item 1) em vez de “pendência §6.1” | ✅ |
| 6 | [sprint-1-fundacao.md §1](prj-produto/sprints/sprint-1-fundacao.md) · [wsjf](prj-tecnico/enablers/wsjf-enablers-iniciais.md) | Remove “lead time de compra” — PENDENCY-0018 decidiu **sem compra**; risco é a homologação | ✅ |
| 7 | [checklist-arquitetura §C2](prj-tecnico/checklist-arquitetura-onda-1.md) | “hardware a comprar” → equipamentos existentes (PENDENCY-0018) | ✅ |
| 8 | [dor-enablers.md §3](prj-tecnico/enablers/dor-enablers.md) | Coluna de estimativa preenchida com os 10 Job Sizes consolidados (26 pts) | ✅ |
| 9 | `PRD.md` (Sprint 1) | “validar no planning D1” → D1 realizado em 19/10 · Job Sizes consolidados em 22/10 | ✅ |
| 10 | Docs de origem das novas pendências | `PENDENCY-0020…0029` citados em integração, inventory, sprint-1, mer, data-dictionary, datamapping, devops, SECURITY, enablers/wsjf, equipe, US-0020 e BRAINSTORM | ✅ |
| 11 | `PRD.md` (Enablers) | “DoR 7/8 (falta Estimável)” → **8/8** (consolidado em 2026-10-22) | ✅ |

---

## 4. Conclusão da triagem

| Campo | Resultado |
|---|---|
| Promovidas ao hub | `10` — PENDENCY-0020…0029 |
| Mantidas em checklists temáticos | `3` — Onda 2-Should (MVP completo)/descoberta |
| Encerradas por decisão | `1` — A2 (homologação de impressoras, leitores e terminal) |
| Encerradas sem ação | `4` grupos de falsas pendências |
| Correções editoriais aplicadas | `11` — ver §D (commit de consistência, 2026-10-23) |
| Itens fora do hub após a triagem | `0` no horizonte Onda 1-Must (MVP mínimo)/Onda 2-Should (MVP completo) |

**Próximo passo:** acompanhar as 10 no ritual semanal (`scripts/check-pendencias.sh`) e arquivar este checklist em **2026-11-23**.
