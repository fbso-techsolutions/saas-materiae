# ☁️ cloud — estratégia de nuvem e alvos Onda 4 (Produto)/Onda 5 (Plataforma)

| Campo | Valor |
|---|---|
| **Papel** — O QUE é | **Onde** pode morar o sistema por fase: posição sobre nuvem pública, critérios de escolha e alvos gerenciados. **Como** roda (topologia, serviços): [infrastructure.md](infrastructure.md) |
| **Fonte** | [ADR-012](adrs/adr-012-stack-onda-1.md) (Onda 1-Must (MVP mínimo) interno → DOKS/Kong/Istio/Redis = SaaS Onda 4 (Produto)/Onda 5 (Plataforma)) · [ADR-009](adrs/adr-009-k8s-istio-keda-compose.md) · guardrails do [BRAINSTORM §6](../../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/discovery/BRAINSTORM.md) (zero dependências externas · LGPD) |
| **Status** | ✅ v1 (2026-10-21) · 🟡 contratação da Onda 4 (Produto)/Onda 5 (Plataforma) não decidida |

## 1. Posição por fase

| Fase | Nuvem | Por quê |
|---|---|---|
| **Onda 1-Must (MVP mínimo)** | **Nenhuma nuvem pública** — servidor interno (Docker Compose) | guardrails: **zero dependências externas** + **LGPD** (dados evidência/ativo sob controle da área) + entrega em servidor interno |
| **Onda 4 (Produto)/Onda 5 (Plataforma) (SaaS)** | **Nuvem pública gerenciada** — alvo decidido: **DOKS (DigitalOcean K8s) + Kong + Istio + Redis gerenciado** | a Onda 1-Must (MVP mínimo) vira SaaS multi-tenant; orquestração gerenciada para escala por tenant/fila |

> 🟡 O alvo está **nomeado** (ADR-012) mas **não contratado**: fornecedor, região e custo são decisão de Onda 4 (Produto).

## 2. Critérios de escolha (quando abrir a Onda 4 (Produto))

1. **Residência/LGPD** — região com dados de evidências/ativos dentro do perímetro aceito; sub-processadores inventariados.
2. **Kubernetes gerenciado** (DOKS ou equivalente) — manter o alvo da ADR-009 sem operar cluster próprio.
3. **Custo previsível** — pagar por serviço consumido (KEDA/HPA reduz custo ocioso dos workers), evitar vendas de lock-in.
4. **Portabilidade** — mesma imagem OCI da Onda 1-Must (MVP mínimo); nada de serviço gerenciado específico dentro do código (12-factor).
5. **Objetos/backup** — object storage com versionamento + retenção coerente com a política de evidência ([ADR-007](adrs/adr-007-evidencia-configuravel.md)).

## 3. Mapa de serviços → fase

| Serviço | Onda 1-Must (MVP mínimo) (interno) | Onda 4 (Produto)/Onda 5 (Plataforma) (gerenciado) |
|---|---|---|
| Orquestração | Docker Compose | **DOKS** (K8s) + Istio ([ADR-009](adrs/adr-009-k8s-istio-keda-compose.md)) |
| Edge/ingress | nginx | **Kong** |
| Banco | PostgreSQL no Compose (volume + backup manual) | PostgreSQL gerenciado (HA + backups) |
| Cache/sessão | Redis no Compose | **Redis gerenciado** |
| Fila | RabbitMQ no Compose | RabbitMQ/Kafka gerenciado |
| Objetos | MinIO no Compose | Object storage (S3 compatível) |
| Identidade | Keycloak no Compose | Keycloak (mesma imagem) + federação AD (**Onda 4 (Produto)/Onda 5 (Plataforma)** — checklist jurídico/ENABLER-0003) |
| Autoscaling | — (fixo) | KEDA + HPA |

## 4. LGPD e nuvem

- Evidências (fotos) e dados de ativo **não** saem do perímetro na Onda 1-Must (MVP mínimo) — sem CDN/analytics de terceiros (guardrail).
- No Onda 4 (Produto)/Onda 5 (Plataforma): inventário de sub-processadores + URL assinada com escopo curto + sem PII em logs ([devops §4](devops.md)) — pauta de segurança em [../seguranca/SECURITY.md](../seguranca/SECURITY.md).
- Custos/contratos são decisão de negócio (não técnico) — registrar em BACKLOG quando a Onda 4 (Produto) abrir.

## 5. Próximos passos

1. 🟡 **Definir fornecedor/região da Onda 4 (Produto)/Onda 5 (Plataforma)** (comercial + LGPD) — antes do primeiro SaaS multi-tenant.
2. 🟡 Estimar custo mensal do alvo (§3) e comparar × servidor interno.
3. 🟢 Nada a decidir para a Onda 1-Must (MVP mínimo) — guardrail fechado no gate 9/9.
