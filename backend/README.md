# `backend/` — Quarkus modular monolith

Backend do RMR: monólito modular Quarkus (18 módulos, 3 bounded contexts) com
arquitetura hexagonal por módulo.

## Stack

- Java 25 + Quarkus (GraalVM Mandrel)
- PostgreSQL 17+ com RLS (multi-tenant via `tenant_id`)
- Flyway (migrations em `src/main/resources/db/migration`)
- RabbitMQ (MVP) → Kafka (SaaS)

## Guardrails

Ver `platform-standards/standards/architecture/` (monólito modular, multi-tenant, eventos/Outbox).

## Módulos (bounded contexts)

- **Ciclo Reverso:** `workflow`, `triage`, `inspection`, `maintenance`, `recycling`,
  `packaging`, `shipping`
- **Núcleo:** `catalog`, `serialized-asset`, `watchlist`, `labeling`, `evidence`,
  `value-recovery`
- **Suporte:** `identity`, `tenancy`, `notification`, `integration`, `reporting`

> Referência: `docs/tecnico/domain.md` (migração pendente).
