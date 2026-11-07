# 📦 inventory.md — inventário de soluções sistêmicas envolvidas

## 1. Visão geral

| Item | Valor |
|------|-------|
| Projeto | PRJ-SUP-2026-0000-RMR · plataforma RMR (reparo, manutenção e reciclagem) |
| Escopo deste inventário | **Toda solução sistêmica** envolvida no projeto: sistemas externos, serviços internos de infraestrutura e alvos futuros — com papel, dono, contrato e documentação |
| Total mapeado | **12 soluções** — 1 interna · 5 externas · 4 infraestrutura · 1 identidade · 1 fonte documental |
| Contratos | [tecnico/arquitetura/integracoes/](arquitetura/integracoes) (hub + OpenAPI por integração) |
| Status | 📝 **v1 (2026-10-21)** |

> 🔴 **LACUNA GERAL:** 4 das 5 integrações externas ainda **não têm doc nem dono nomeado**; a área dona do cadastro mestre não confirmou o contrato (ver §6 — PENDENCY-0020 e PENDENCY-0027).

---

## 2. Estrutura — mapa de soluções

```
docs/tecnico/ (visão do que existe envolvido)
├── Sistema RMR (interno)                    ← a solução que estamos construindo
├── Sistemas externos (5)
│   ├── Cadastro Mestre de Materiais Serializados   (R17/R22/R48)
│   ├── Mestre de Materiais — SKU                   (R47)
│   ├── WMS/EWM — Estoque Avançado                  (R47)
│   ├── Centro de Reciclagem Central                 (R38)
│   └── APIs de Parceiros                            (R39–R46)
├── Identidade: Keycloak (IdP — ADR-005)
├── Fonte documental: Sistema NDS / Anvisa (atributo NDS)
└── Infraestrutura: PostgreSQL+RLS · RabbitMQ/Kafka · Object Storage
    └── Alvo futuro SaaS Onda 4 (Produto)/Onda 5 (Plataforma): DOKS · Kong · Istio · Redis (ADR-012)
```

---

## 3. Soluções sistêmicas

| # | Solução | Tipo | Papel no projeto | Dono | Contrato / Doc | Confiança |
|---|---------|------|------------------|------|----------------|-----------|
| 1 | **Sistema RMR** | Sistema interno | Cadastro, triagem, workflow, evidência, expedição (R1–R59) | Projeto (Suprimentos/TI) | [architecture.md](arquitetura/architecture.md) · [domain.md](domain.md) | 🟢 |
| 2 | **Cadastro Mestre de Materiais Serializados** | Sistema externo | Consulta de elegibilidade + recebimento de desfecho | **Área dona do cadastro mestre (a confirmar)** | [integracao-cadastro-mestre](arquitetura/integracoes/integracao-cadastro-mestre.md) · [OpenAPI](arquitetura/integracoes/contratos/openapi-cadastro-mestre.yaml) | 🟡 contrato PROPOSTA (fechamento pendente §6) |
| 3 | **Mestre de Materiais (SKU)** | Sistema externo | Consulta/atualização de material (R47) | A definir | [integrations §1](arquitetura/integracoes/integrations.md) | 🟡 sem doc individual |
| 4 | **WMS/EWM — Estoque Avançado** | Sistema externo | Buscar/receber/devolver material (R47) | A definir | [integrations §1](arquitetura/integracoes/integrations.md) | 🟡 sem doc individual |
| 5 | **Centro de Reciclagem Central** | Sistema externo | Controle logístico online (R38) | A definir | [integrations §1](arquitetura/integracoes/integrations.md) | 🟡 sem doc individual |
| 6 | **APIs de Parceiros** | Sistema externo | Entrada de eventos de parceiros (R39–R46) | Parceiros/Operação | [integrations §1](arquitetura/integracoes/integrations.md) | 🟡 sem doc individual |
| 7 | **Keycloak** | Serviço de identidade | IdP único OIDC, RBAC, perfis por tela (R1–R5) | Infra/TI | [ADR-005](arquitetura/adrs/adr-005-keycloak-oidc.md) · ENABLER-0003 | 🟢 decidido (gate 9/9) |
| 8 | **Sistema NDS / Anvisa** | Fonte documental | Origem do **atributo NDS** (autorização de importação) — consulta ao portal, **não é integração API** | Compliance | [regras-formacao-identificadores §6](../negocio/regras-formacao-identificadores.md) | 🟢 regra documentada |
| 9 | **PostgreSQL 17 + RLS** | Infraestrutura | Fonte da verdade multi-tenant (ADR-002), Flyway migrations | Eng de Dados | [ADR-002](arquitetura/adrs/adr-002-rls-multi-tenant.md) | 🟢 decidido |
| 10 | **RabbitMQ (→ Kafka em Onda 4 (Produto)/Onda 5 (Plataforma))** | Infraestrutura | Filas de integração/eventos, DLQ, retry (ADR-006) | Eng | [ADR-006](arquitetura/adrs/adr-006-rabbitmq-kafka.md) | 🟢 MVP · 🟡 Onda 4 (Produto)/Onda 5 (Plataforma) |
| 11 | **Object Storage (MinIO/S3)** | Infraestrutura | Evidências (binário) com URL assinada (ADR-007) | Eng | [ADR-007](arquitetura/adrs/adr-007-evidencia-configuravel.md) | 🟢 decidido |
| 12 | **Alvo SaaS Onda 4 (Produto)/Onda 5 (Plataforma)** (DOKS, Kong, Istio, Redis gerenciado) | Alvo futuro | Evolução da Onda 1-Must (MVP mínimo) (Compose) para SaaS | Tech lead/Arquiteto | [ADR-012](arquitetura/adrs/adr-012-stack-onda-1.md) · [ADR-009](arquitetura/adrs/adr-009-k8s-istio-keda-compose.md) | 🟡 decidido como alvo, fora da Onda 1-Must (MVP mínimo) |

---

## 4. Pontos de integração por solução (resumo)

| Solução | Direção | Operações | Requisitos |
|---|---|---|---|
| Cadastro Mestre | Consulta síncrona + devolutiva assíncrona | `GET /productStock?identifierType&identifierValue` · `PATCH /productStock/{id}` (Idempotency-Key) | R17, R22, R48 · BR-1.4.6/1.4.7 |
| Mestre de Materiais | Consulta + atualização | consulta material · atualiza status | R47 |
| WMS/EWM | Escrita/leitura | buscar/receber/devolver | R47 |
| Centro Central | Escrita/leitura | controle logístico online | R38 |
| Parceiros | Entrada | recebimento, linha, laboratório, embalagem, expedição, pallet | R39–R46 (Inbox + idempotência) |

> Padrões transversais (ACL, Outbox/Inbox, retry/DLQ, reconciliação): [integrations §2](arquitetura/integracoes/integrations.md).

## 5. Onde a informação vive

| Necessidade | Doc |
|---|---|
| Visão/navegação da arquitetura | [arquitetura/architecture.md](arquitetura/architecture.md) |
| Domínio e bounded contexts | [domain.md](domain.md) |
| Mapa de integrações + contratos | [arquitetura/integracoes/](arquitetura/integracoes) |
| Decisões (ADRs) | [arquitetura/adrs/INDEX.md](arquitetura/adrs/INDEX.md) |
| Regras de identificadores/NDS (négócio) | [regras-formacao-identificadores](../negocio/regras-formacao-identificadores.md) |

## 6. Lacunas e observações

- 🔴 **Área dona do cadastro mestre não confirmou o contrato** — OpenAPI é PROPOSTA; 3 pendências de fechamento em [integracao-cadastro-mestre §9](arquitetura/integracoes/integracao-cadastro-mestre.md) (TMF639 · desfechos BR-1.4.3 · URL/escopos). Prazo: **PENDENCY-0020** (2026-11-07).
- 🔴 **Sistema externo concreto não escolhido** — "API-First genérica" aceita SAP/TOTVS/Senior/Sankhya/interno (BR-1.4.6), mas **qual** será o da Onda 1-Must (MVP mínimo) não está decidido (**PENDENCY-0027**).
- 🟡 **4 integrações sem doc individual** (materiais, WMS, centro central, parceiros) — criar quando a entrega correspondente iniciar ([integrations §1](arquitetura/integracoes/integrations.md)) — **PENDENCY-0027**.
- 🟡 **Donos por solução** — itens 3–6 sem dono nomeado no inventário — **PENDENCY-0027**.
- 🟡 **PENDENCY-0019 aberta** — comportamento com cadastro mestre **indisponível** (fila × bloqueio) ainda não decidido; afeta o item 2 (prazo 2026-11-07).
- 🟢 **Keycloak/Postgres/Object Storage/RabbitMQ** — decididos no gate 9/9 e documentados como ADR.

## 7. Próximos passos

1. Fechar **3 pendências do contrato** com a área dona (integracao-cadastro-mestre §9) — **PENDENCY-0020**.
2. Decidir **PENDENCY-0019** (fila × bloqueio com API indisponível) — donos Operação/Oficina + Eng.
3. Nomear **donos** das soluções 3–6 e criar os docs individuais de integração quando as entregas começarem.
4. Atualizar este inventário a cada nova solução entre (checklist: §6 vira item de revisão).
