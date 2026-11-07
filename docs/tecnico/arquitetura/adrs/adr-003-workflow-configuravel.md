# ADR-003 — Workflow como máquina de estados configurável por tenant

| Campo | Conteúdo |
|---|---|
| **Data / Status** | 2026-10-14 (SAD v0.1) · ✅ **Decidida no gate de arquitetura em 2026-10-19** (PENDENCY-0015 — item B3 do [checklist](../../../../projects/PRJ-SUP-2026-0000-RMR/prj-tecnico/checklist-arquitetura-onda-1.md)) |
| **Contexto** | Cada cliente tem etapas, transições, pré-condições e permissões de reparo diferentes (R14, R20). Difícil codar o fluxo fixo sem reescrita por cliente — e a Onda 1-Must (MVP mínimo) não pode esperar um *workflow builder* completo. |
| **Decisão** | Workflow como **máquina de estados configurável por tenant**, com definição em **tabela de configuração** (JSONB: estágios + transições) e motor que a interpreta. O **Onda 1-Must (MVP mínimo) usa fluxo fixo** (seed), mas a representação **já é a configurável** — nada de *hardcoded* de estágios. |
| **Justificativa** | 1) "Configuração acima de código" é o diferencial SaaS (Premissa 1); 2) a decisão **adianta a PENDENCY-0003** (níveis de reparo/permissões) — quando ela for retomada, a estrutura já existe; 3) mesma tabela suporta regra dos 40%, run in e qualquer fluxo novo sem deploy; 4) ENABLER-0006 implementa a base. |
| **Consequências** | Transições inválidas precisam de validação forte (pré-condições + RBAC); testes de motor cobrem matriz de transições ([../testing.md](../testing.md)); Fase de *workflow builder* visual fica para depois (PENDENCY-0003 permanece adiada fora da Onda 1-Must (MVP mínimo)/Onda 2-Should (MVP completo)-imediato). |
| **Alternativas rejeitadas** | **Fluxo fixo em código** — reescrita por cliente e deploy para mudança de etapa; **BPMN/engine externo** — dependência externa vetada na Onda 1-Must (MVP mínimo) + complexidade além do necessário. |
| **Rastreio** | R14, R20 · BRAINSTORM §4.1/§6.6 · gate 9/9 (2026-10-19) · ENABLER-0006 · [PENDENCY-0003](../../../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md) (adiada — retomada na configuração Onda 2-Should (MVP completo)) |
