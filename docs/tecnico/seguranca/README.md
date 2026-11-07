# 🔐 Segurança e Conformidade

> O COMO da segurança — implementação das exigências de negócio (LGPD, acesso, auditoria).

**Status:** ✅ **[SECURITY.md](SECURITY.md)** v1 (2026-10-21) — visão técnica completa (auth/Keycloak, RLS, STRIDE, auditoria, LGPD-técnico).

**Escopo (distribuído):**

- **Documento principal → [SECURITY.md](SECURITY.md)** — arquitetura de segurança, mecanismos por exigência, STRIDE, LGPD-camada-técnica e compliance ambiental (MTR/PNRS).
- **LGPD / sanitização certificada (B-REQ-05), retenção:** visão de **négócio** em [checklist-juridico-compliance](../../../projects/PRJ-SUP-2026-0000-RMR/prj-negocio/requisitos/checklist-juridico-compliance.md) · trava técnica por modelo em [../arquitetura/data-dictionary.md](../arquitetura/data-dictionary.md) §2.
- **Acesso (R1–R5):** decisão [ADR-005 (Keycloak/OIDC)](../arquitetura/adrs/adr-005-keycloak-oidc.md) · execução ENABLER-0003.
- **Multi-tenant (RLS):** [ADR-002](../arquitetura/adrs/adr-002-rls-multi-tenant.md).
- **Auditoria imutável (R59):** append-only em [../arquitetura/mer.md](../arquitetura/mer.md) §3.
- **Testes de segurança (ZAP + cross-tenant):** [../arquitetura/testing.md](../arquitetura/testing.md).
