# ADR-005 — Keycloak (OIDC) como IdP único para front e backend

| Campo | Conteúdo |
|---|---|
| **Data / Status** | 2026-10-14 (SAD v0.1) · ✅ **Decidida no gate de arquitetura em 2026-10-19** (PENDENCY-0015 — item B1 do [checklist](../../../../projects/PRJ-SUP-2026-0000-RMR/prj-tecnico/checklist-arquitetura-onda-1.md)) |
| **Contexto** | R1–R5 exigem login único, sessão única, inatividade, troca periódica de senha e reset com notificação — para perfis distintos (Operação, Compliance, Admin). Precisa ser **auto-hospedado** (Onda 1-Must (MVP mínimo) sem dependência externa; LGPD) e valer igual para SPA e API. |
| **Decisão** | **Keycloak como provedor de identidade (IdP) único** — OIDC. A **SPA** faz *login* e guarda o token; a **API** valida JWT via `quarkus-oidc` (recurso OAuth2). **RBAC** com papéis e telas por perfil; `tenant_id` extraído da claim (complementa [ADR-002](adr-002-rls-multi-tenant.md)). |
| **Justificativa** | 1) Todos os requisitos de identidade (R1–R5) vêm "de graça" e testados num padrão open source; 2) auto-hospedado = zero dependência externa na Onda 1-Must (MVP mínimo) + LGPD sob controle; 3) um único IdP evita federar identidades divergentes; 4) `quarkus-oidc` é integração de padrão, não código próprio de auth. |
| **Consequências** | Operação assume Keycloak no Compose (backup de realms, upgrade); perfis e telas por perfil viram configuração Keycloak + `identity`; ENABLER-0003 entrega realms/perfis; testes de segurança incluem cross-tenant/role ([../testing.md](../testing.md)). |
| **Alternativas rejeitadas** | **Auth própria (JWT manual)** — reimplementa reset/rotação/sessão com risco de falha de segurança; **IdP gerenciado (Auth0/Cognito)** — dependência externa vetada na Onda 1-Must (MVP mínimo) + LGPD; **SSO corporativo do cliente** — só em Onda 4 (Produto)/Onda 5 (Plataforma), como *federation* opcional no mesmo Keycloak. |
| **Rastreio** | R1–R5 · BRAINSTORM §6.8 · gate 9/9 (2026-10-19) · ENABLER-0003 (Keycloak + perfis Operação/Compliance) · [../../seguranca/SECURITY.md](../../seguranca/SECURITY.md) |
