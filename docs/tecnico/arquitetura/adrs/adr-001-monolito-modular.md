# ADR-001 — Monólito modular (Quarkus) antes de microserviços

| Campo | Conteúdo |
|---|---|
| **Data / Status** | 2026-10-14 · **PROPOSTA** |
| **Contexto** | Plataforma com 18 módulos de domínio (R1–R59), time pequeno (1 dev front + devs de negócio), Onda 1-Must (MVP mínimo) em servidor interno e prazo de Sprint 1. A escolha entre monólito, microserviços ou modular monolith condiciona tudo: deploy, observabilidade, consistência de dados e velocidade de evolução. |
| **Decisão** | **Monólito modular** (Quarkus) com **arquitetura hexagonal por módulo**, comunicação assíncrona por eventos (Outbox) e integração via adaptadores (ACL). Os módulos têm **fronteiras explícitas** e podem ser extraídos como microserviços **quando houver necessidade comprovada** — nunca antes. |
| **Justificativa** | 1) Time curto e Onda 1-Must (MVP mínimo) em Compose: um deploy unitário é ordens de magnitude mais simples que orquestração de serviços; 2) transações locais no PostgreSQL evitam consistência distribuída; 3) fronteiras explícitas + portas/adaptadores mantêm o **caminho de extração aberto** (não trava decisão futura); 4) event-driven assíncrono dá escalabilidade sem partir o deploy. |
| **Consequências** | Acoplamento é combatido por regras de ouro (ver [../architecture.md](../architecture.md) §3) e revisão de dependências entre módulos; observabilidade por módulo precisa nascer cedo (métricas por pacote — [../testing.md](../testing.md)); extração futura exige separar fila e esquema. |
| **Alternativas rejeitadas** | **Microserviços desde o início** — complexidade de rede/distribuição sem necessidade de escala provada; **monólito sem fronteiras** — garantiria velocidade inicial mas destruiria o caminho de extração e a clareza de domínio. |
| **Rastreio** | Todos os requisitos (base estrutural) · BRAINSTORM §6.3 · SAD §1/§2 · ADR-004 (ACL é consequência deste desenho) |
