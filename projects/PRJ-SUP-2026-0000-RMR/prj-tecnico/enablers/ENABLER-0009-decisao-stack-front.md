# 🛠️ ENABLER-0009 — Decisão de stack de front: SPA (Vite+TanStack) × Next.js

| Campo | Valor |
|---|---|
| **Categoria** | Exploração (Spike de decisão) |
| **Origem** | Follow-up de **C4** (checklist de arquitetura) — "decisão de front **antes de iniciar o front da Sprint 1**" · guardrail API-First + stack ADR-012 |
| **Habilita** | **Todo o front** das 13 stories da Onda 1-Must (MVP mínimo) (padrão de app, roteamento, testes, build no Compose) |
| **Depende de** | — (paralelo; o scaffold final consome o ambiente do [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md)) |
| **Dono sugerido** | Manoel Carlos (frontend) + Bolismar da Silva (arquiteto) |
| **Estimativa (Job Size)** | **2** *(proposta — consolidar no planning; spike timeboxed 1–2 dias)* |
| **Status** | 🟡 **Decisão tomada: SPA (Vite + TanStack) — [ADR-013](../../../../docs/tecnico/arquitetura/adrs/adr-013-frontend-spa.md) (2026-10-19)** · falta a **evidência executável** (scaffold no Compose, 21/10) para fechar o DoD · **DoR:** [checklist](dor-enablers.md) · **WSJF:** [avaliação](wsjf-enablers-iniciais.md) (8º lugar proposto) |

---

## 1. Visão Geral e Contexto

- **Categoria:** Exploração (Spike de decisão — [guia §3](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md))
- **Origem:** follow-up de C4 no checklist de arquitetura: a stack de front é a **última decisão aberta** antes do início do front; guardrails do projeto (API-First, SPA leve, entrega via Compose) precisam orientar a escolha.
- **Status de Bloqueio:** **Bloqueia o início de toda a construção de front.** Escolher errado (ou tarde) significa reescrever app shell, roteamento e chamadas de API — refatoração do trabalho inteiro da Onda 1-Must (MVP mínimo).

## 2. Análise de Priorização (Métricas para WSJF)

- **Valor de Negócio / Redução de Risco:** **Medio-alto.** O risco técnico é concreto: SSR/Server Actions de frameworks full-stack podem **furar o guardrail API-First** (lógica de negócio fora da API REST), quebrando a arquitetura e o teste automatizado. Spike barato (1–2 dias) destrói esse risco.
- **Habilitação de Oportunidade:** Com a decisão + scaffold aprovados, todas as telas da Onda 1-Must (MVP mínimo) nascem no padrão certo — velocity do front não é interrompida no meio da Onda 1-Must (MVP mínimo).

## 3. Escopo Técnico Detalhado

1. **Spike de decisão (timebox 1–2 dias):** comparar sob os **guardrails do projeto**:
   - **API-First:** o front consome **só** a API REST (sem regra de negócio fora da API);
   - **keyboard-first:** viabilidade de foco/atalhos gerenciados (React 19);
   - **entrega via Compose** do [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md) (build simples, servido estático);
   - opções avaliadas: **SPA (Vite + TanStack)** × Next.js → **✅ decidido: SPA (Vite + TanStack Router/Query)** em 2026-10-19, registrado como **[ADR-013](../../../../docs/tecnico/arquitetura/adrs/adr-013-frontend-spa.md)** (guardrails que decidiram: API-First · Compose/self-hosted sem cloud de front · 1 dev front · keyboard-first + Playwright).
2. **Saída do spike:** **ADR de 1 página** (contexto, decisão, consequências, alternativas) assinada por Tech Lead + Eng.
3. **Scaffold aprovado:** estrutura inicial do app (rotação de rotas, cliente de API, testes, lint) que **roda no Compose consumindo a API mockada** — é o ponto de partida das stories 0001–0013.
4. **Registro na arquitetura:** decisão atualiza o SAD/stack (ADR-012 fica com a escolha de front registrada).

> **Não está incluso:** design system completo (→ [UX/UI](../../../../docs/tecnico/ux-ui)) · construir telas de negócio (Sprint 1) · SSR/SEO (não é requisito — é ferramenta interna de operação).

## 4. Critérios de Saída (Definition of Done)

- **✅ ADR registrada:** [ADR-013](../../../../docs/tecnico/arquitetura/adrs/adr-013-frontend-spa.md) — SPA (Vite + TanStack) — contexto, decisão, consequências e alternativas (decidida 2026-10-19; assinatura Tech lead + Eng no record).
- **Scaffold roda no Compose** do [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md) chamando a API (mockada na ausência do backend) — evidência executável, não slide.
- Decisão **atualiza o SAD** e o README de front (uma fonte de verdade só).
- Timebox respeitado (1–2 dias — escopo decidido, não "pesquisa até achar").
