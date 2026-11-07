# ADR-008 — Read models / CQRS-lite para dashboards e relatórios

| Campo | Conteúdo |
|---|---|
| **Data / Status** | 2026-10-14 · **PROPOSTA** |
| **Contexto** | R49–R57 exigem dashboards, relatórios e busca rápida sobre o histórico de movimentação — consultas analíticas que varrem muitas transições. Rodar tudo sobre as tabelas operacionais (OLTP) suja o desempenho do chão de fábrica. |
| **Decisão** | **CQRS-lite**: camada de **read models** (projeções) para consulta/relatório, alimentada pelos **eventos de domínio** (`StageTransition` etc.) via Outbox. Sem motor CQRS completo — projeções simples no mesmo PostgreSQL (views/tabelas de leitura). |
| **Justificativa** | 1) Separa custo de leitura do custo de escrita sem duplicar infraestrutura; 2) eventos já existem (regra de ouro #5) — projeção é consequência barata; 3) mesmo banco = transacionalidade simples e backup único; 4) caminho para Onda 4 (Produto)/Onda 5 (Plataforma) (Kafka → projeções dedicadas) aberto pela abstração (ADR-006). |
| **Consequências** | Latência de projeção (quase real-time, não imediata) precisa de UX que aceite; reconciliação de projeção vs. fonte (regra do hub); testes de projeção junto aos testes de evento. |
| **Alternativas rejeitadas** | **Consultas direto no OLTP** — lentidão de relatório dentro do horário de operação; **warehouse dedicado na Onda 1-Must (MVP mínimo)** — infraestrutura demais para o volume inicial. |
| **Rastreio** | R49–R57 · BRAINSTORM §9 · [ADR-006](adr-006-rabbitmq-kafka.md) · [ADR-004](adr-004-acl-outbox.md) |
