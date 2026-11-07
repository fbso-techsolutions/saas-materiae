# 🛠️ ENABLER-0001 — Servidor interno + Docker Compose base (ambientes)

| Campo | Valor |
|---|---|
| **Categoria** | Infraestrutura |
| **Origem** | **C1** (checklist de arquitetura) — "Docker Compose em servidor interno" · [ADR-012](../../../../docs/tecnico/arquitetura/adrs/adr-012-stack-onda-1.md) |
| **Habilita** | **Tudo** — as **13 stories** do ciclo Onda 1-Must (MVP mínimo) (0001–0013) dependem desse ambiente para rodar |
| **Depende de** | — (primeiro da cadeia) |
| **Dono sugerido** | Lourival Louro (Infra) + Bolismar da Silva (arquiteto) |
| **Estimativa (Job Size)** | **2** *(proposta — consolidar no planning)* |
| **Status** | 📝 Rascunho (2026-10-19) · **DoR:** [checklist](dor-enablers.md) · **WSJF:** [avaliação](wsjf-enablers-iniciais.md) (1º lugar proposto) |

---

## 1. Visão Geral e Contexto

- **Categoria:** Infraestrutura
- **Origem:** C1 (Checklist de Arquitetura) — "Docker Compose em servidor interno"
- **Status de Bloqueio:** **Bloqueador crítico.** Habilita a entrega de todo o ecossistema — todas as 13 stories do ciclo Onda 1-Must (MVP mínimo) dependem desse ambiente para rodar. Sem ele, nada do projeto acontece.

## 2. Análise de Priorização (Métricas para WSJF)

- **Valor de Negócio / Redução de Risco:** **Altíssimo.** Mitiga o risco de desalinhamento de ambiente e fornece o local centralizado de homologação e a trilha de auditoria mínima necessária para conformidade (C3).
- **Habilitação de Oportunidade:** Habilita **100% das histórias de usuário** subsequentes.

## 3. Escopo Técnico Detalhado

1. **Provisionamento:** provisionar e configurar máquina/servidor interno físico ou virtual dedicado.
2. **Orquestração base:** criar arquivo `docker-compose.yml` contendo:
   - Banco de dados PostgreSQL 17+;
   - Serviços base de rede e volumes persistentes.
3. **Ambiente de homologação:** garantir que o ambiente interno seja **espelhado** (configurações idênticas) ao ambiente alvo de produção futura.
4. **Rotina de backup:** criar script/cronjob para **backup diário automatizado** do PostgreSQL (trilha de auditoria como prova para o checklist C3).

> **Não está incluso:** Keycloak (→ [ENABLER-0003](ENABLER-0003-keycloak-perfis.md)), pipeline de deploy (→ [ENABLER-0002](ENABLER-0002-pipeline-ci-cd.md)), aplicações da aplicação (entram nas sprints).

## 4. Critérios de Saída (Definition of Done)

- O comando `docker compose up -d` **sobe todo o ambiente do zero** em homologação sem erros de dependência.
- A rotina de **backup diário** está documentada na wiki do time.
- Um **teste de restauração mínima** do banco de dados foi executado e validado com sucesso.
