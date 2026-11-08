# 📇 ADRs — Architecture Decision Records

> **Um arquivo por decisão** (`adr-<número>-<slug>.md`), índice único abaixo. Origem: dissolução do SAD waterfall (05-SAD) em documentos por necessidade — ver [../architecture.md](../architecture.md) · [../README.md](../README.md).

| ID | Decisão | Status | Data | Arquivo |
|---|---|---|---|---|
| ADR-001 | Monólito modular (Quarkus) antes de microserviços | 📝 PROPOSTA | 2026-10-14 | [adr-001-monolito-modular.md](adr-001-monolito-modular.md) |
| ADR-002 | Multi-tenancy por PostgreSQL RLS (`SET LOCAL app.current_tenant`) | ✅ Decidida (gate 9/9) | 2026-10-19 | [adr-002-rls-multi-tenant.md](adr-002-rls-multi-tenant.md) |
| ADR-003 | Workflow como máquina de estados configurável por tenant | ✅ Decidida (gate 9/9) | 2026-10-19 | [adr-003-workflow-configuravel.md](adr-003-workflow-configuravel.md) |
| ADR-004 | Hub de integração com ACL + Outbox/Inbox + idempotência | 📝 Proposta — base da decisão de integração (PENDENCY-0014) | 2026-10-14 | [adr-004-acl-outbox.md](adr-004-acl-outbox.md) |
| ADR-005 | Keycloak (OIDC) como IdP único para front e backend | ✅ Decidida (gate 9/9) | 2026-10-19 | [adr-005-keycloak-oidc.md](adr-005-keycloak-oidc.md) |
| ADR-006 | RabbitMQ (filas) no MVP; Kafka (eventos) em Onda 4 (Produto), via abstração | 📝 PROPOSTA | 2026-10-14 | [adr-006-rabbitmq-kafka.md](adr-006-rabbitmq-kafka.md) |
| ADR-007 | Evidência por imagem configurável + OCR opcional (object storage) | 📝 PROPOSTA | 2026-10-14 | [adr-007-evidencia-configuravel.md](adr-007-evidencia-configuravel.md) |
| ADR-008 | Read models / CQRS-lite para dashboards e relatórios | 📝 PROPOSTA | 2026-10-14 | [adr-008-read-models-cqrs.md](adr-008-read-models-cqrs.md) |
| ADR-009 | K8s/Istio/KEDA nos ambientes; Docker Compose no dev/Onda 1-Must (MVP mínimo) | 📝 PROPOSTA (parcialmente absorvida pelo ADR-012) | 2026-10-14 | [adr-009-k8s-istio-keda-compose.md](adr-009-k8s-istio-keda-compose.md) |
| ADR-010 | Dois níveis de dado: Material (SKU) × Material Serializado (unidade) | 📝 PROPOSTA | 2026-10-14 | [adr-010-dois-niveis-dado.md](adr-010-dois-niveis-dado.md) |
| ADR-011 | Motor de Recuperação de Valor: decisão determinística por rota + venda de peças/sucata | 📝 PROPOSTA | 2026-10-14 | [adr-011-motor-recuperacao-valor.md](adr-011-motor-recuperacao-valor.md) |
| ADR-012 | Stack da Onda 1-Must (MVP mínimo) (Java 25 + Quarkus · PostgreSQL 17 com RLS · Keycloak · workflow em tabela de configuração · Onda 1-Must (MVP mínimo) inteira em Docker Compose no servidor interno; DOKS/Kong/Istio/Redis = SaaS Onda 4 (Produto)/Onda 5 (Plataforma)) | ✅ Decidida (gate 9/9) | 2026-10-19 | [adr-012-stack-onda-1.md](adr-012-stack-onda-1.md) |
| ADR-013 | Frontend da Onda 1-Must (MVP mínimo): SPA (Vite + TanStack Router/Query, CSR puro — sem SSR/Next) | ✅ Decidida (spike ENABLER-0009) | 2026-10-19 | [adr-013-frontend-spa.md](adr-013-frontend-spa.md) |
| ADR-014 | Estratégia de repositórios (org fbso-techservice: platform-standards + produtos SaaS; "promover genérico / manter específico") | ✅ Decidida | 2026-11-06 | [adr-014-estrategia-repositorios.md](adr-014-estrategia-repositorios.md) |

> **NFRs atendidos:** ADR-005 → acesso/R1–R5+LGPD · ADR-002 → multi-tenant/Onda 2-Should (MVP completo) · ADR-004 → integrações/R17,R38–R48 · ADR-003 → operação/R20–R37 · ADR-008 → dados/R49–R57 · ADR-011 → valor/B-REQ-02/09/10 · ADR-013 → operação/R20–R37.
