# ADR-002 — Multi-tenancy por PostgreSQL RLS (`SET LOCAL app.current_tenant`)

| Campo | Conteúdo |
|---|---|
| **Data / Status** | 2026-10-14 (SAD v0.1) · ✅ **Decidida e estendida no gate de arquitetura em 2026-10-19** (PENDENCY-0015 — item C2 do [checklist](../../../../projects/PRJ-SUP-2026-0000-RMR/prj-tecnico/checklist-arquitetura-onda-1.md)) |
| **Contexto** | A plataforma é SaaS multi-tenant desde a concepção (Premissa 1): cada cliente (tenant) tem workflow, catálogos, etiquetas e dados próprios. Isolamento é requisito de segurança (LGPD) e de produto — e precisa valer **desde a Onda 1-Must (MVP mínimo)**, não depois. |
| **Decisão** | **`tenant_id` em todas as tabelas de domínio** + **Row-Level Security (RLS)** do PostgreSQL. A sessão recebe `SET LOCAL app.current_tenant = <id>` a cada requisição; o valor vem da **claim do JWT** (`tenant_id`), **nunca** do corpo da requisição. Sempre `SET LOCAL` (nunca `SET`) — a troca de tenant não vaza entre transações. |
| **Justificativa** | 1) Defesa em profundidade: mesmo bug de *query* no código devolve **0 linhas** de outro tenant; 2) enforcement no banco é independente da linguagem/framework; 3) `SET LOCAL` + transação = sem estado global; 4) o gate **confirmou e estendeu** a decisão à Onda 1-Must (MVP mínimo) inteira (não só ao SaaS Onda 4 (Produto)/Onda 5 (Plataforma)). |
| **Consequências** | Testes de integração **precisam** cobrir isolamento cross-tenant (ver [../testing.md](../testing.md)); consultas fora de transação falham por design; migrations (Flyway) devem criar policies RLS junto das tabelas; ENABLER-0004 nasce daqui. |
| **Alternativas rejeitadas** | **Isolamento só na aplicação** — um *query* esquecido vaza dado entre clientes; **schema por tenant** — migração e custo por cliente crescendo; **banco por tenant** — operação e backup inviáveis na Onda 1-Must (MVP mínimo). |
| **Rastreio** | R1–R5, Premissa 1 (SaaS) · BRAINSTORM Premissa 1/§6.4 · gate 9/9 (2026-10-19) · ENABLER-0004 (policies RLS + seed de tenant) · [../../seguranca/SECURITY.md](../../seguranca/SECURITY.md) |
