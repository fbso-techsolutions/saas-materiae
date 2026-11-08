# 🚦 Definition of Ready (DoR) — Enablers iniciais (ENABLER-0001 … ENABLER-0010)

> **Orientação para o time:** um Enabler **só pode ser puxado para o Sprint Planning** após **todos os 8 itens obrigatórios** receberem `[x]` **e** a estimativa estar consolidada. Item não marcado ⇒ volta para o refinamento. Checklist padrão: [template Enabler · DoR §2](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/template-enabler-dor.md).

| Campo | Valor |
|---|---|
| **Finalidade** | Checklist de prontidão dos 10 Enablers antes do primeiro Sprint Planning |
| **Papel dono** | Tech Lead (valida clareza técnica) + PO (valida habilitação/rastreabilidade) |
| **Audience** | Time técnico + PO no refinement |
| **Status** | 📝 Rascunho (2026-10-19) · **8/8 desde 2026-10-22** (consolidação decidida na §2) |

---

## 1. Matriz de prontidão

**Legenda:** ✅ item com lastro no documento individual · ⬜ pendente de validação no refinement

| EN | 🧠 Origem mapeada | 🧠 Habilitador limpo | 🛠️ Fronteiras de escopo | 🛠️ Riscos mapeados | 🧪 Critérios binários | 🧪 Evidência de sucesso | 🧮 Responsável | 🧮 Estimável | DoR |
|---|---|---|---|---|---|---|---|---|---|
| [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md) | ✅ C1/ADR-012 | ✅ 13 stories Onda 1-Must (MVP mínimo) | ✅ sem Keycloak/CI | ✅ backup/restauração | ✅ `compose up` do zero | ✅ teste de restauração | ✅ Lourival Louro+Bolismar da Silva | ✅ | **8/8** |
| [ENABLER-0002](ENABLER-0002-pipeline-ci-cd.md) | ✅ C4 | ✅ cadência das sprints | ✅ sem cloud/K8s | ✅ **gargalo Mandrel (cache)** | ✅ deploy automático | ✅ 2º build mais rápido | ✅ Bruno Oliveira+Bolismar da Silva | ✅ | **8/8** |
| [ENABLER-0003](ENABLER-0003-keycloak-perfis.md) | ✅ B1/ADR-005 | ✅ login Onda 1-Must (MVP mínimo) + FEATURE-0005.0005 (perfil `PERFIL-COMPLIANCE`) | ✅ **AD fora** (follow-up) | ✅ adapter OIDC plugável | ✅ bloqueio de tela por perfil | ✅ login OIDC E2E | ✅ Bruno Oliveira+Daniel Vini | ✅ | **8/8** |
| [ENABLER-0004](ENABLER-0004-policies-rls-tenant.md) | ✅ B2/ADR-002+D4 | ✅ tabelas das 13 stories | ✅ sem admin de tenants | ✅ **refatoração caríssima se adiado** | ✅ SELECT/INSERT cross-tenant falham | ✅ teste automatizado de isolamento | ✅ Carlos Mattos+Bolismar da Silva | ✅ | **8/8** |
| [ENABLER-0005](ENABLER-0005-flyway-entidades-seeds.md) | ✅ A2/taxonomia §5 | ✅ FEATURE-0001.0001/FEATURE-0005.0005/F2.x | ✅ sem workflow/auditoria | ✅ schema ≠ taxonomia | ✅ `flyway migrate` do zero | ✅ idempotência (2× = mesmo estado) | ✅ Carlos Mattos+Bruno Oliveira | ✅ | **8/8** |
| [ENABLER-0006](ENABLER-0006-workflow-tabela-configuracao.md) | ✅ B3/ADR-003 | ✅ FEATURE-0002.0001 (0004–0009) | ✅ sem builder de UI | ✅ refatoração quando Onda 3-Could (Integração & Valor) chegar | ✅ troca de config sem deploy | ✅ teste de transição bloqueada | ✅ Bolismar da Silva+Bruno Oliveira | ✅ | **8/8** |
| [ENABLER-0007](ENABLER-0007-auditoria-append-only.md) | ✅ C3/PENDENCY-0009 | ✅ auditoria das 13 stories | ✅ sem WORM/hash (pós-Onda 1-Must (MVP mínimo)) | ✅ app não pode apagar | ✅ UPDATE/DELETE falham | ✅ log de trilha por item | ✅ Bruno Oliveira+Carlos Mattos | ✅ | **8/8** |
| [ENABLER-0008](ENABLER-0008-terminais-leitores.md) | ✅ C2 + decisão A2 | ✅ stories 0004–0010 | ✅ **smart card manual** | ✅ **leitor sem teclado ⇒ UI refeita** | ✅ leitura E2E sem mouse | ✅ spike 1–2 dias escrito | ✅ Manoel Carlos+Lourival Louro+Bruna Santos (Operação) | ✅ | **8/8** |
| [ENABLER-0009](ENABLER-0009-decisao-stack-front.md) | ✅ follow-up C4 | ✅ todo o front | ✅ sem design system/SSR | ✅ Server Actions furam API-First | ✅ scaffold roda no Compose | ✅ ADR de 1 página assinada | ✅ Manoel Carlos+Bolismar da Silva | ✅ | **8/8** |
| [ENABLER-0010](ENABLER-0010-dados-iniciais-homologacao.md) | ✅ [D-02](../../prj-produto/backlog/DECISOES-BACKLOG.md) / [escopo](../../prj-produto/escopo-onda-1.md) | ✅ demo de 0001–0009 | ✅ sem seeds de schema | ✅ demo sem dados plausíveis | ✅ seed idempotente do zero | ✅ 1 item ponta a ponta | ✅ Patricia Varra+Carlos Mattos | ✅ | **8/8** |

## 2. Pendência única e transversal: 🧮 Estimável (resolvida em 2026-10-22)

Os 10 Enablers estavam **7/8**: faltava o item **"Estimável"**, porque os Job Sizes dos cards e da [tabela WSJF](wsjf-enablers-iniciais.md) eram **propostas do PO/Tech Lead**.

**Decisão (2026-10-22):** a proposta é **adotada como consolidada**; a escala de Job Size de Enabler é **própria e relativa** e **não converte** para Story Point ([guia WSJF §6](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-wsjf-priorizacao.md)). Os valores permanecem na [tabela WSJF](wsjf-enablers-iniciais.md) (aponta, não copia) e a **capacidade de stories** da Sprint 1 está em [equipe §3.2](../../equipe.md).

**Resultado:** os 10 Enablers estão **8/8 e aptos a entrar no Sprint Planning**. Mudança de contexto devolve os pontos ao refinamento (regra de ouro §4).

## 3. Anotações do refinamento

> Preencher durante o refinement (uma linha por EN). Job Sizes consolidados em 2026-10-22 (coluna `Estimativa consolidada` abaixo e [tabela WSJF](wsjf-enablers-iniciais.md)):

| EN | Pontos de atenção / débito técnico gerado | Links úteis | Estimativa consolidada (Job Size) |
|---|---|---|---|
| [ENABLER-0001](ENABLER-0001-servidor-interno-docker-compose.md) | | | 2 |
| [ENABLER-0002](ENABLER-0002-pipeline-ci-cd.md) | | | 3 |
| [ENABLER-0003](ENABLER-0003-keycloak-perfis.md) | | | 3 |
| [ENABLER-0004](ENABLER-0004-policies-rls-tenant.md) | | | 3 |
| [ENABLER-0005](ENABLER-0005-flyway-entidades-seeds.md) | | | 3 |
| [ENABLER-0006](ENABLER-0006-workflow-tabela-configuracao.md) | | | 3 |
| [ENABLER-0007](ENABLER-0007-auditoria-append-only.md) | | | 3 |
| [ENABLER-0008](ENABLER-0008-terminais-leitores.md) | | | 2 |
| [ENABLER-0009](ENABLER-0009-decisao-stack-front.md) | | | 2 |
| [ENABLER-0010](ENABLER-0010-dados-iniciais-homologacao.md) | | | 2 |

## 4. Regras de ouro (recorte)

1. **DoR incompleto não entra em Sprint** — sem exceção; o que falta volta ao refinamento com dono e data.
2. **Enabler sem "habilita" explícito é suspeito** — valor de negócio mal disfarçado ou débito sem rastreabilidade: descartar ou reescrever.
3. **Spike = timebox + critério de saída** — nunca "pesquisar até achar" ([guia §3.6](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)).
4. **Pontuação WSJF é proposta, calibrada na reunião e revisada** quando o contexto mudar.
