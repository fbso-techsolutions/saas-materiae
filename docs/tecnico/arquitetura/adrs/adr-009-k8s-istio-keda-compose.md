# ADR-009 — K8s/Istio/KEDA nos ambientes; Docker Compose no desenvolvimento

| Campo | Conteúdo |
|---|---|
| **Data / Status** | 2026-10-14 · **PROPOSTA** — *parcialmente absorvida pelo [ADR-012](adr-012-stack-onda-1.md) (2026-10-19): na Onda 1-Must (MVP mínimo), **todos os ambientes** rodam em Docker Compose; K8s/Istio/KEDA permanecem como alvo Onda 4 (Produto)/Onda 5 (Plataforma)* |
| **Contexto** | Definir a topologia de ambientes: desenvolvimento local, homologação e produção, com e sem dependências externas. O Onda 1-Must (MVP mínimo) é entregue em servidor interno da área (guardrails: zero dependência externa, LGPD). |
| **Decisão** | **Desenvolvimento/testes:** Docker + Docker Compose (idêntico ao runtime da Onda 1-Must (MVP mínimo)). **Homolog/prod (Onda 4 (Produto)/Onda 5 (Plataforma)):** **Kubernetes + Istio** (mesh, ingress, mTLS) + **KEDA** (autoscaling de workers/filas). Ambiente como código, GitOps (ver DevOps). |
| **Justificativa** | 1) Compose = paridade dev×Onda 1-Must (MVP mínimo) sem orquestração; 2) K8s/Istio/KEDA é o padrão gerenciável para SaaS multi-tenant (escala por tenant/fila); 3) decisão em dois tempos preserva o guardrail da Onda 1-Must (MVP mínimo) sem rejeitar a evolução; 4) KEDA escala workers de Outbox/reconciliação que são intrinsecamente assíncronos. |
| **Consequências** | Duas topologias a manter (Compose + manifests) — mitigado por imagens OCI iguais; nada de especificidade K8s dentro do código da aplicação (12-factor). |
| **Alternativas rejeitadas** | **K8s desde a Onda 1-Must (MVP mínimo)** — orquestração prematura viola "zero dependências externas" da Onda 1-Must (MVP mínimo); **serviços PaaS gerenciados** — amarra a fornecedor e contraria a entrega em servidor interno. |
| **Rastreio** | BRAINSTORM §6/§8 · gate 9/9 via [ADR-012](adr-012-stack-onda-1.md) · infraestrutura: [../infrastructure.md](../infrastructure.md) · [../cloud.md](../cloud.md) |
