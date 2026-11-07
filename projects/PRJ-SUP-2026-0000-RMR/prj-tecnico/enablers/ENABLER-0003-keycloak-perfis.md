# 🛠️ ENABLER-0003 — Keycloak auto-hospedado + perfis Operação/Compliance

| Campo | Valor |
|---|---|
| **Categoria** | Infraestrutura / Arquitetura |
| **Origem** | **B1** (checklist de arquitetura) — decisão arquitetural confirmada via **ADR-005** |
| **Habilita** | **Login de todas as 13 stories** da Onda 1-Must (MVP mínimo) + exigência regulatória do ciclo Onda 1-Must (MVP mínimo): **perfil Compliance (`PERFIL-COMPLIANCE`)** da FEATURE-0005.0005 (BR-5.5.9) + R2 (SSO) desde o primeiro dia |
| **Depende de** | [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md) (Keycloak entra no Compose) |
| **Dono sugerido** | Bruno Oliveira (backend) + Daniel Vini (segurança, pontual) |
| **Estimativa (Job Size)** | **3** *(proposta — consolidar no planning)* |
| **Status** | 📝 Rascunho (2026-10-19) · **DoR:** [checklist](dor-enablers.md) · **WSJF:** [avaliação](wsjf-enablers-iniciais.md) (5º lugar proposto) |

---

## 1. Visão Geral e Contexto

- **Categoria:** Infraestrutura / Arquitetura
- **Origem:** B1 (Checklist de Arquitetura) — decisão arquitetural confirmada via **ADR-005**
- **Status de Bloqueio:** **Bloqueia o início dos fluxos de login de todas as stories**, além de ser o pré-requisito para as exigências regulatórias do ciclo Onda 1-Must (MVP mínimo).

## 2. Análise de Priorização (Métricas para WSJF)

- **Valor de Negócio / Redução de Risco:** **Garantia imediata das regras de segurança regulatórias** — o perfil `PERFIL-COMPLIANCE` da FEATURE-0005.0005 (BR-5.5.9) e R2 (SSO) desde o primeiro dia do produto.
- **Estratégia de evolução:** a integração com o diretório corporativo (AD) está **fora de escopo**; este Enabler foca no **adapter OIDC plugável**, para que a integração com AD seja um follow-up simples no futuro (Onda 4 (Produto)/Onda 5 (Plataforma)).

## 3. Escopo Técnico Detalhado

1. **Deployment:** adicionar e configurar a imagem oficial do **Keycloak no `docker-compose.yml`** estruturado no [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md).
2. **Carga de dados base:** configurar usuários, credenciais e políticas iniciais direto no **realm de homologação**.
3. **Estrutura de perfis (roles):** criar e expor os perfis de acesso:
   - **Operação**
   - **Compliance**
4. **Políticas de segurança (R3–R5):** configurar regras de ciclo de vida de credenciais:
   - Inativação por ociosidade (**R3**);
   - Troca/reset obrigatório de senha no primeiro login (**R4/R5**).
5. **Desacoplamento técnico:** implementar o **adapter OIDC plugável** na aplicação frontend/backend para consumo do token JWT.

> **Não está incluso:** integração com AD corporativo (follow-up Onda 4 (Produto)/Onda 5 (Plataforma) — Segurança) · provisionamento de usuários finais da operação (cabe ao ENABLER-0010 em parte; gestão contínua é rotina).

## 4. Critérios de Saída (Definition of Done)

- O fluxo completo de **login via OIDC** funciona de ponta a ponta na aplicação.
- A aplicação **lê os escopos/roles do token e aplica o bloqueio em tela** — ex.: o botão/fluxo de "Certificação" está bloqueado se o usuário logado não possui o perfil **Compliance**.
- Regras R3–R5 configuradas e verificáveis no realm de homologação.
