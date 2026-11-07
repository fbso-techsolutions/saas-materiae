# `infra/` — infraestrutura do RMR

Configuração de infraestrutura **específica do RMR** (herda da `platform`, não copia).

## Subpastas

| Pasta | Conteúdo |
|---|---|
| `docker-compose/` | Compose do MVP (dev, homolog, prod) no servidor interno |
| `helm/` | values específicos do RMR (herda charts de `platform/helm/`) |
| `keycloak/` | realm RMR: clients/roles específicos (estende `platform/keycloak/`) |

## Alvo

- **MVP (Onda 1):** Docker Compose em servidor interno.
- **SaaS (Onda 4/5):** K8s + Helm + ArgoCD — o estado desejado é observado pelo
  app-of-apps em `platform/gitops/`.
