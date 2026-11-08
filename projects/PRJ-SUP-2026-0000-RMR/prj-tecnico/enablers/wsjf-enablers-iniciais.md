# 📊 Avaliação WSJF — Enablers iniciais (ENABLER-0001 … ENABLER-0010)

> **Fórmula:** WSJF = CoD ÷ Job Size · **CoD** = Valor de Negócio (A) + Criticidade de Tempo (B) + Redução de Risco / Oportunidade (C) · escala de Fibonacci (1, 2, 3, 5, 8, 13, 20). Padrão: [template WSJF tabela](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/template-wsjf-tabela.md) · método: [guia WSJF](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-wsjf-priorizacao.md) (SAFe).

| Campo | Valor |
|---|---|
| **Finalidade** | Documento de apoio à **reunião de priorização com stakeholders** — mostrar por que a infraestrutura/habilitação passa na frente de regras de negócio visíveis |
| **Papel dono** | PO/PM (pontuação de negócio) + Tech Lead (Job Size) — calibrados **em conjunto** |
| **Audience** | Stakeholders · Tech Lead · Eng |
| **Status** | 📝 **Proposta (2026-10-19)** — pontuações relativas, **consolidar na reunião**; muda o contexto, repontua |

---

## 1. Tabela comparativa de WSJF

| ID | Nome do Enabler | Valor de Negócio (A) | Criticidade de Tempo (B) | Redução de Risco / Oportunidade (C) | Custo do Atraso (CoD = A+B+C) | Tamanho / Esforço (Job Size) | Score WSJF (CoD ÷ Tamanho) | Posição |
|---|---|---|---|---|---|---|---|---|
| ENABLER-0001 | [Servidor interno + Docker Compose base](ENABLER-0001-servidor-interno-docker-compose.md) | 3 | 13 | 20 | 36 | 2 | **18.00** | 1º 🥇 |
| ENABLER-0008 | [Terminais: leitores + operação sem mouse](ENABLER-0008-terminais-leitores.md) | 5 | 13 | 8 | 26 | 2 | **13.00** | 2º 🥈 |
| ENABLER-0004 | [Policies de RLS + seed de tenant](ENABLER-0004-policies-rls-tenant.md) | 5 | 13 | 13 | 31 | 3 | **10.33** | 3º 🥉 |
| ENABLER-0006 | [Workflow em tabela de configuração](ENABLER-0006-workflow-tabela-configuracao.md) | 8 | 8 | 13 | 29 | 3 | **9.67** | 4º |
| ENABLER-0003 | [Keycloak + perfis Operação/Compliance](ENABLER-0003-keycloak-perfis.md) | 5 | 8 | 13 | 26 | 3 | **8.66** | 5º |
| ENABLER-0007 | [Auditoria append-only](ENABLER-0007-auditoria-append-only.md) | 3 | 8 | 13 | 24 | 3 | **8.00** | 6º |
| ENABLER-0005 | [Esqueleto Flyway: 7 entidades + seeds](ENABLER-0005-flyway-entidades-seeds.md) | 5 | 5 | 8 | 18 | 3 | **6.00** | 7º |
| ENABLER-0009 | [Decisão de stack de front (spike)](ENABLER-0009-decisao-stack-front.md) | 3 | 5 | 3 | 11 | 2 | **5.50** | 8º |
| ENABLER-0002 | [Pipeline CI/CD trunk-based](ENABLER-0002-pipeline-ci-cd.md) | 2 | 5 | 8 | 15 | 3 | **5.00** | 9º |
| ENABLER-0010 | [Dados iniciais de homologação](ENABLER-0010-dados-iniciais-homologacao.md) | 3 | 3 | 3 | 9 | 2 | **4.50** | 10º |

*Cada EN card traz a análise dos pilares justificada em "Análise de Priorização" — a tabela acima é a consolidação numérica.*

## 2. Argumentação prática para a reunião

- **Por que o [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md) é o primeiro (18.00)?** Maior score: **bloqueia todas as 13 histórias do ciclo Onda 1-Must (MVP mínimo)**. Se atrasar, o custo é catastrófico (nota 20 em Redução de Risco) e o esforço é baixo (nota 2) — perfil ideal de WSJF: grande dor, pequeno trabalho.
- **Por que o [ENABLER-0008](ENABLER-0008-terminais-leitores.md) aparece tão alto (2º), apesar de "só hardware"?** Criticidade de tempo 13: **homologação "antes da Sprint 1"** (sem compra — PENDENCY-0018) — se a decisão de leitor demorar, as stories 0004–0010 nascem sobre premissa não testada (refatoração de todas as telas). Job Size 2 (spike 1–2 dias) ainda potencializa o score.
- **Por que o [ENABLER-0003](ENABLER-0003-keycloak-perfis.md) (5º) passa na frente do [ENABLER-0002](ENABLER-0002-pipeline-ci-cd.md) (9º)?** O Keycloak garante **cumprimento de regra regulatória** (perfil Compliance, FEATURE-0005.0005/BR-5.5.9) desde o dia 1 — criticidade de tempo e risco de conformidade mais altos que os da automação de deploy (ENABLER-0002), que embora importante **pode esperar uma Sprint** a mais sem perda de negócio.
- **Por que o [ENABLER-0006](ENABLER-0006-workflow-tabela-configuracao.md) (4º) tem valor 8, o maior da tabela?** Habilita FEATURE-0002.0001 inteira (6 das 13 stories) — é o único Enabler que carrega uma feature de negócio inteira nas costas.
- **Por que spikes baratos ([ENABLER-0009](ENABLER-0009-decisao-stack-front.md), [ENABLER-0010](ENABLER-0010-dados-iniciais-homologacao.md)) não são os primeiros?** Job Size pequeno **não substitui dependência**: ENABLER-0009 só faz sentido com o scaffold rodando no ambiente do ENABLER-0001.

## 3. Score alto ≠ ordem de execução

O WSJF ordena **"o que vale mais a pena"**; o sequenciamento lógico ([guia §4.3](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)) ordena **"o que é possível executar"**. No Onda 1-Must (MVP mínimo), as duas ordens convergem com as dependências abaixo:

```
ENABLER-0001 (ambiente base) ──┬──> ENABLER-0003 (Keycloak no Compose) ──> ENABLER-0010 (usuários + seeds)
                        ├──> ENABLER-0004 (RLS/tenant) ──> ENABLER-0005 (migrations c/ policy) ──> ENABLER-0006 (workflow) ──> ENABLER-0007 (auditoria)
                        ├──> ENABLER-0002 (CI/CD → deploy em homolog)
                        ├──> ENABLER-0008 (terminais — independente; spike com equipamentos existentes)
                        └──> ENABLER-0009 (spike de front — independente)
```

*Dependências declaradas nos cards "Depende de". ENABLER-0008 e ENABLER-0009 são independentes de ENABLER-0001 para **decisão/homologação** — só o uso final depende do ambiente.*

## 4. Regras de uso

1. **Pontuar junto:** produto + técnica calibram os números **relativamente entre si** (não há ponto absoluto — [guia WSJF §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-wsjf-priorizacao.md)).
2. **Toda pontuação é proposta:** esta tabela entra na reunião como rascunho e sai revisada — registrar mudanças no Registro de Alterações.
3. **Se o contexto mudar** (risco novo, dependência removida, prazo alterado), repontuar — WSJF não é eterno.
4. **Cruzamento obrigatório com a matriz de decisão** do [guia §4.4](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md) como conferência (bloqueia entrega crítica ⇒ máxima).
