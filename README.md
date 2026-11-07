# RMR by FBSO

> **Tecnologia para dar uma segunda vida aos seus ativos.**

Plataforma de **reparo, manutenção e reciclagem** de ativos com economia circular via
logística reversa (triagem → oficina → reuso/reciclagem/descarte).

## Onde está o quê

| Caminho | Conteúdo |
|---|---|
| [docs/](docs) | **Produto** — visão, negócio, domínio, arquitetura, segurança (persistente) |
| [projects/](projects) | **Projetos** — um folder por entrega (PRD → negócio → produto → técnico) |
| [backend/](backend) | Backend Quarkus (monólito modular) |
| [frontend/](frontend) | Frontend React SPA |
| [infra/](infra) | docker-compose (MVP) + helm + keycloak |

## Stack (Onda 1-Must / MVP)

Java 25 + Quarkus (Mandrel) · PostgreSQL 17+ (RLS) · Flyway · React + TypeScript · Keycloak
auto-hospedado — MVP em Docker Compose. K8s + ArgoCD + Helm = alvo SaaS.

## Regras

- "Promover o genérico, manter o específico" — ver [platform/standards/](https://github.com/fbso-techservice/platform).
- Visão completa do produto: [docs/negocio/visao.md](docs/negocio/visao.md).
