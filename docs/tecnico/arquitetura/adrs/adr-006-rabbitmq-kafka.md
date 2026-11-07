# ADR-006 — RabbitMQ (filas) no MVP; Kafka (eventos) em Onda 4 (Produto), via abstração

| Campo | Conteúdo |
|---|---|
| **Data / Status** | 2026-10-14 · **PROPOSTA** |
| **Contexto** | Comunicação assíncrona é pilar do desenho: Outbox na saída, Inbox na entrada, workers de reconciliação e relatórios (R39–R48). Precisa de broker simples de operar na Onda 1-Must (MVP mínimo) (Compose) sem abrir mão de trocar de tecnologia depois. |
| **Decisão** | **RabbitMQ** como broker do MVP (filas clássicas, *dead-letter*, retry). **Kafka** fica previsto para **Onda 4 (Produto)/Onda 5 (Plataforma)** (eventos de alto volume), atrás de uma **abstração de publicação/consumo** no módulo `integration` — o domínio publica em *porta*, não em API de broker. |
| **Justificativa** | 1) RabbitMQ roda leve no Compose, com DLQ e *retry* nativos; 2) a abstração (porta + Outbox) torna a troca Rabbit→Kafka uma troca de adaptador; 3) volumes da Onda 1-Must (MVP mínimo) (dezenas de eventos/minuto) não justificam Kafka; 4) coerente com ADR-001 (monólito modular, extração só por necessidade comprovada). |
| **Consequências** | Sem garantia de ordem global no MVP (aceitável — a ordem é validada por negócio, R46); consumidores idempotentes obrigatórios (Inbox); monitoramento de profundidade de fila desde a Onda 1-Must (MVP mínimo) ([../devops.md](../devops.md)). |
| **Alternativas rejeitadas** | **Kafka desde a Onda 1-Must (MVP mínimo)** — operação pesada (cluster/ZooKeeper) para volume irrelevante; **sem broker (só HTTP assíncrono)** — perde DLQ/retry/backpressure e acopla sistemas externos. |
| **Rastreio** | R39–R48 · BRAINSTORM §6.5 · [ADR-004](adr-004-acl-outbox.md) · [../integracoes/integrations.md](../integracoes/integrations.md) §2 |
