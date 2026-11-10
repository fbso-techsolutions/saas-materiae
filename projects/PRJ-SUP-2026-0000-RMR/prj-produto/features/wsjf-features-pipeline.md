# 📊 Avaliação WSJF · Features do pipeline (nível Programa)

> **Fórmula:** WSJF = CoD ÷ Job Size · **CoD** = Valor de Negócio (A) + Criticidade de Tempo (B) + Redução de Risco / Oportunidade (C) · escala de Fibonacci (1, 2, 3, 5, 8, 13, 20). Método e regra da granularidade (nunca misturar Features com Stories): [guia WSJF de priorização](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-wsjf-priorizacao.md). Irmão desta tabela: [WSJF dos Enablers](../../prj-tecnico/enablers/wsjf-enablers-iniciais.md).

| Campo | Valor |
|---|---|
| **Finalidade** | Documento de apoio à **reunião de priorização** · ordenar as **13 features do pipeline** (ainda sem stories) por valor econômico antes de detalhá-las (rolling wave) |
| **Papel dono** | PM/PO (pontuação de negócio) + Arquiteto/Tech Lead (Job Size relativo) · calibrados **em conjunto** |
| **Audience** | PM/PO · Arquiteto · stakeholders da reunião |
| **Status** | 📝 **Proposta (2026-11-03)** · pontuações relativas, **consolidar na reunião**; muda o contexto, repontua |

---

## 1. Tabela comparativa de WSJF

| ID | Feature | Valor de Negócio (A) | Criticidade de Tempo (B) | Redução de Risco / Oportunidade (C) | Custo do Atraso (CoD = A+B+C) | Tamanho / Esforço (Job Size) | Score WSJF (CoD ÷ Tamanho) | Posição |
|---|---|---|---|---|---|---|---|---|
| FEATURE-0004.0001 | Botão 1-clique Service Desk → triagem | 8 | 5 | 3 | 16 | 3 | **5.33** | 1º 🥇 |
| FEATURE-0001.0002 | Motor de cálculo de viabilidade (custo reparo × valor de mercado) | 8 | 5 | 8 | 21 | 5 | **4.20** | 2º 🥈 |
| FEATURE-0005.0006 | Baixa patrimonial contábil | 5 | 8 | 8 | 21 | 5 | **4.20** | 3º 🥉 |
| FEATURE-0005.0001 | Desmanche / colheita de peças | 13 | 8 | 8 | 29 | 8 | **3.63** | 4º |
| FEATURE-0005.0002 | Estoques de peças e sucata | 8 | 5 | 5 | 18 | 5 | **3.60** | 5º |
| FEATURE-0002.0003 | Busca rápida por identificador/OS | 5 | 3 | 2 | 10 | 3 | **3.33** | 6º |
| FEATURE-0005.0003 | Motor de Recuperação de Valor (viabilidade por rota) | 13 | 5 | 8 | 26 | 8 | **3.25** | 7º |
| FEATURE-0003.0001 | Catálogo de reuso (busca e reserva) | 13 | 5 | 5 | 23 | 8 | **2.88** | 8º |
| FEATURE-0005.0004 | Venda (catálogo, precificação, NF) | 13 | 3 | 3 | 19 | 8 | **2.38** | 9º |
| FEATURE-0002.0002 | Etiquetas e controle de impressão | 5 | 3 | 3 | 11 | 5 | **2.20** | 10º |
| FEATURE-0002.0004 | Dashboards e indicadores | 5 | 2 | 2 | 9 | 5 | **1.80** | 11º |
| FEATURE-0004.0002 | Busca de ativos para swap | 5 | 2 | 2 | 9 | 5 | **1.80** | 12º |
| FEATURE-0004.0003 | Workflow de transferência de custódia | 5 | 2 | 2 | 9 | 5 | **1.80** | 13º |

*Features do pipeline (sem card próprio) · fonte: [mapeamento de épicos](../rastreabilidade.md) e [BACKLOG-LIST §Pipeline](../../../../docs/produto/backlog/BACKLOG-LIST.md#pipeline-de-features-sem-stories). As features já em sprint (FEATURE-0001.0001 · 0002.0001 · 0002.0005 · 0005.0005) e as que já têm stories (0001.0003 · 0001.0004 · 0001.0005) não entram aqui: são nível Time ou já comprometidas.*

---

## 2. Argumentação prática para a reunião

- **Por que o [Botão Service Desk](../rastreabilidade.md) (0004.0001) é o 1º (5.33)?** Perfil WSJF ideal: **valor alto (8) com esforço pequeno (3)**. Uma integração simples que multiplica o volume de ativos entrando na esteira: cada chamado do Service Desk vira candidato a reuso, sem inventar fluxo novo.
- **Por que a [Baixa patrimonial](../rastreabilidade.md) (0005.0006) fica tão alta (3º) com valor "só" 5?** Caso clássico de **urgência > valor**: quando a Onda 1-Must (MVP mínimo) entregar a rota de descarte, a Controladoria precisa **dar baixa no imobilizado** com rastreabilidade. Sem ela, abre uma lacuna de controle contábil (notas 8 em Criticidade e em Risco). Vale menos, mas **não pode esperar**.
- **Por que o [Desmanche](../rastreabilidade.md) (0005.0001) é o 4º?** **Valor 13 + Oportunidade 8**: abre a **cadeia de recuperação de valor** (peças → estoques → venda) e é pré-requisito das duas features seguintes. É a ponte entre "reparar/reciclar" e "monetizar".
- **Por que a [Venda](../rastreabilidade.md) (0005.0004) cai para 9º com valor 13?** **Job Size 8** (catálogo + precificação + NF) e **fase 1.1**: é grande e depende do estoque (0005.0002). O WSJF pune tamanho: valor alto não compensa esforço alto quando há alternativas mais enxutas na fila.
- **Por que Dashboards, Busca p/ swap e Transferência de custódia fecham a lista?** Visibilidade de gestão e casos de nicho, **sem urgência e sem risco** associados: entram quando houver folga de capacidade, não antes.

---

## 3. Score alto ≠ ordem de execução

O WSJF ordena **"o que vale mais a pena"**; o sequenciamento lógico ordena **"o que é possível executar"**. As dependências do pipeline reordenam a execução:

```
0005.0001 (Desmanche) → 0005.0002 (Estoques) → 0005.0004 (Venda)          ← cadeia de recuperação de valor
0001.0002 (Motor de viabilidade) → 0005.0003 (Motor de Recuperação)        ← otimização de rota (o 2º alimenta o 3º)
0003.0001 (Catálogo de reuso)  ← depende do fluxo de reuso da Onda 1-Must (MVP mínimo) estar vivo
0005.0006 (Baixa contábil)     ← depende da rota de descarte da Onda 1-Must (MVP mínimo) + conciliação com a Controladoria
0004.0001 (Botão Service Desk) ← depende da triagem da Onda 1-Must (MVP mínimo) (integração simples, baixa dependência)
```

*Na prática, a ordem de detalhamento (rolling wave) combina o score com essas cadeias: Desmanche pode ser detalhado antes de Estoques mesmo com score parecido, porque Estoques o pressupõe.*

---

## 4. Regras de uso

1. **Pontuar junto:** produto + técnica calibram os números **relativamente entre si** (não há ponto absoluto · [guia WSJF §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-wsjf-priorizacao.md)).
2. **Toda pontuação é proposta:** esta tabela entra na reunião como rascunho e sai revisada · registrar mudanças no [registro de decisões](../backlog/DECISOES-BACKLOG.md).
3. **Job Size de feature é range relativo:** features ainda não têm stories; estimar por **faixa** (ex.: 5–8) e fixar o ponto na reunião, ancorado a uma feature de referência ([guia §6](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-wsjf-priorizacao.md)).
4. **Repontuar quando o contexto mudar** (feature sai do pipeline, dependência removida, risco novo) · WSJF não é eterno.
5. **Cruzamento obrigatório com a matriz de decisão** ([guia INVEST §4.4](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md)) como conferência: bloqueia entrega crítica ⇒ máxima · reduz risco grave ⇒ alta · melhoria desejável ⇒ baixa.
