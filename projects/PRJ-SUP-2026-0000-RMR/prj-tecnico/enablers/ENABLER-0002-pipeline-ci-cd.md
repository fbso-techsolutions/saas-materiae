# 🛠️ ENABLER-0002 — Pipeline CI/CD trunk-based

| Campo | Valor |
|---|---|
| **Categoria** | Infraestrutura |
| **Origem** | **C4** (checklist de arquitetura) — "Git + pipeline simples (build/test/deploy em homolog), trunk-based com PR review obrigatório; monorepo" |
| **Habilita** | Ritmo de **todas as sprints** — cadência e entrega automatizada |
| **Depende de** | [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md) (ambiente de homolog alvo do deploy) |
| **Dono sugerido** | Bruno Oliveira (backend) + Bolismar da Silva (arquiteto) |
| **Estimativa (Job Size)** | **3** *(proposta — consolidar no planning)* |
| **Status** | 📝 Rascunho (2026-10-19) · **DoR:** [checklist](dor-enablers.md) · **WSJF:** [avaliação](wsjf-enablers-iniciais.md) (9º lugar proposto) |

---

## 1. Visão Geral e Contexto

- **Categoria:** Infraestrutura
- **Origem:** C4 (Checklist de Arquitetura) — "Git + pipeline simples, trunk-based com PR review obrigatório; monorepo"
- **Status de Bloqueio:** **Habilita a cadência e o ritmo de entrega automatizado** de todas as sprints. Não bloqueia a 1ª story, mas sem ele o custo de cada entrega sobe (merge manual, deploy manual, retrabalho).

## 2. Análise de Priorização (Métricas para WSJF)

- **Valor de Negócio / Redução de Risco:** **Alto.** Reduz drasticamente o tempo de integração de código (lead time) e o risco de conflitos massivos de merge ("merge hell").
- **Nota técnica de risco:** o **build nativo com Mandrel é extremamente pesado** em CPU/memória — há risco de gargalo no servidor de CI; o cache de imagem é mitigação obrigatória desde o dia 1.

## 3. Escopo Técnico Detalhado

1. **Estrutura de repositório:** configurar **monorepo** contendo a pasta de documentação (`/docs`) e o código da aplicação no mesmo local.
2. **Políticas de branching:** configurar estratégia **trunk-based** com regras de proteção da branch `main` (exigência de Pull Request com pelo menos **1 aprovação obrigatória**).
3. **Pipeline automatizado:** configurar etapas automatizadas disparadas a cada merge/push na `main`:
   - Build → testes automatizados → **deploy em homologação**.
4. **Otimização de build:** configurar **cache de imagem e camadas do Mandrel** desde o início no servidor de CI/CD, para contornar o peso do build nativo (C4).

> **Não está incluso:** ambientes cloud/K8s (Onda 4 (Produto)/Onda 5 (Plataforma) — ADR-012), métricas de qualidade avançadas, deploy em produção.

## 4. Critérios de Saída (Definition of Done)

- Qualquer código integrado/aprovado na `main` é publicado no ambiente de homologação de forma **100% automatizada** (sem ação manual).
- O **cache de build está ativo e funcional**, evidenciado pela redução do tempo entre o primeiro e o segundo build executados.
- Regra de proteção da `main` ativa (PR com 1 aprovação é bloqueio obrigatório no repositório).
