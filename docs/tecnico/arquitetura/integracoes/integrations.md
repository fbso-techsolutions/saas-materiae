# 🔌 Integrações — hub (mapa das integrações da solução)

> O COMO de conectar — **API-First**: a API é o contrato único de integração. Cada sistema externo tem seu **adaptador (Anti-Corruption Layer)**, mapeamento e validações próprios — [ADR-004](../adrs/adr-004-acl-outbox.md).

| Campo | Valor |
|---|---|
| **Dono** | Eng — arquitetura de integrações |
| **Base** | [architecture.md](../architecture.md) · [ADR-004 (ACL + Outbox)](../adrs/adr-004-acl-outbox.md) · [diretrizes-arquitetura](https://github.com/fbso-techservice/platform-standards/blob/main/standards/architecture/diretrizes-arquitetura.md) |
| **Status** | 🚧 Em formação — **1 de 5** integrações documentadas |

## 1. Mapa de integrações

| # | Integração | Sistema externo | Direção | Req. | Documento | Status |
|---|---|---|---|---|---|---|
| 1 | **Cadastro mestre de materiais serializados** | Sistema de cadastro mestre (SAP, TOTVS, Senior, Sankhya ou interno — API-First genérica) | Consulta síncrona + devolutiva assíncrona | R17, R22, R48 | [integracao-cadastro-mestre](integracao-cadastro-mestre.md) · [contrato OpenAPI](contratos/openapi-cadastro-mestre.yaml) | ✅ PROPOSTA (2026-10-21) |
| 2 | Mestre de materiais (SKU) | Sistema mestre de materiais | Consulta + atualização | R47 | ⏳ a criar quando a entrega iniciar | 🚧 |
| 3 | Estoque avançado | WMS/EWM | Escrita/leitura (buscar/receber/devolver material) | R47 | ⏳ idem | 🚧 |
| 4 | Centro de reciclagem central | Hub logístico | Escrita/leitura (controle logístico online) | R38 | ⏳ idem | 🚧 |
| 5 | APIs de parceiros | Parceiros (recebimento, linha, laboratório, embalagem, expedição, pallet) | Entrada | R39–R46 | ⏳ idem | 🚧 |

## 2. Padrões transversais (valem para todas as integrações)

- **Contrato OpenAPI versionado** por integração, em [`contratos/`](contratos) — a API é o contrato único.
- **ACL:** o domínio **não** conversa com sistema externo — sempre via **porta (interface) + adaptador** (`MaterialRegistryPort`, `StockPort`, `LogisticsHubPort`, `PartnerIngestPort`) — [ADR-004](../adrs/adr-004-acl-outbox.md).
- **Saída:** Transactional **Outbox** · **Entrada:** **Inbox + `idempotency_key`** (R39–R46; idempotência da devolutiva do cadastro mestre = BR-1.4.7).
- **Resiliência:** fila + retry exponencial + dead-letter; **circuit breaker** por sistema externo; **reconciliação** periódica com alerta de divergência; recusa de dados inválidos/fora de ordem (R46).
- **Timeout/retry/fila:** seguem o **padrão do time técnico** — desvio só por regra explícita em FEATURES/US (decisão PENDENCY-0014, 2026-10-21).
- **Segurança:** autenticação OAuth2/OIDC + escopos por integração — ver [../../seguranca/README.md](../../seguranca/README.md).

## 3. Onde cada artefato vive

| Tipo | Pasta |
|---|---|
| Visão geral + navegação da arquitetura | [../architecture.md](../architecture.md) |
| Diagramas C4 (sistemas externos no contexto) | [../c4-context.md](../c4-context.md) |
| Contratos OpenAPI | [contratos/](contratos) |
| Decisões arquiteturais (ADRs) | [../adrs/](../adrs) |
| Modelagem de dados das integrações (datamapping) | [../datamapping.md](../datamapping.md) |
