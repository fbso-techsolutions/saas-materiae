# 📝 Checklist de fechamento — integrações

| Campo | Valor |
|---|---|
| **Objetivo** | Fechar o contrato do cadastro mestre com a área dona e nomear dono + documento das 4 integrações que ainda não os têm |
| **Participantes** | Arquiteto de Soluções (Bolismar da Silva) · Eng (Bruno Oliveira) · **área dona do cadastro mestre** · donos das soluções 3–6 |
| **Data de abertura** | 2026-10-23 |
| **Itens** | 8 abertos (§A contrato do cadastro mestre · §B integrações sem doc/dono) |
| **Fonte** | [integracao-cadastro-mestre §9](integracao-cadastro-mestre.md) · [inventory §6](../../inventory.md) · [integrations §1](integrations.md) |
| **Pendências do hub** | [PENDENCY-0020](../../../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md) (contrato) · [PENDENCY-0027](../../../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md) (integrações sem doc/dono) |
| **Status do doc** | 📝 **Em andamento (2026-10-23)** — 0 de 8 respondidos |

> **Como usar.** Uma linha por item. Preencher **Resposta** (decisão concreta ou artefato), marcar **Status** e nomear **Dono** do follow-up. O que fechar aqui volta para o documento de origem (§9 da integração, `integrations.md` ou doc individual) e para o hub — este checklist é só a ata de trabalho.

**Legenda de Status:** ⬜ Não respondida · ⏳ Em andamento · ✅ Decidida · ❌ Fora do escopo da Onda 1-Must (MVP mínimo) (adiada)

---

## A. Contrato do cadastro mestre (PENDENCY-0020)

> Contexto: o contrato foi **respondido** na PENDENCY-0014 (consulta por identificador + devolutiva com idempotência). O que falta é o **fechamento com a área dona** — por isso o doc segue `PROPOSTA`.

### A1. Alinhamento dos schemas ao TMF639
- **Pergunta:** os payloads de partida são base **TMF687 (Stock)**; a API canônica é **TMF639 (Resource Inventory)**. Quais campos de `/resource` e `/resourceAttributeValue` substituem os de estoque, e o que a área dona consegue expor na Onda 1-Must (MVP mínimo)?
- **Resposta:** _a preencher_
- **Status:** ⏳ (decisão de canonizar em TMF639 tomada na PENDENCY-0014; falta o mapeamento de campos)
- **Dono:** Eng + Arquiteto · **Prazo:** 2026-11-07
- **Impacto:** define o DTO do `MaterialRegistryAdapter` e o OpenAPI final.

### A2. Mapeamento desfechos BR-1.4.3 → status do sistema mestre
- **Pergunta:** os desfechos do ciclo (retorno do campo · sucateado · expedido) **não batem 1:1** com o catálogo de status do mestre. Qual status recebe cada desfecho — e o que fazer quando não houver correspondência (rejeitar, mapear para genérico, abrir chamado)?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** área dona do cadastro mestre + Eng · **Prazo:** 2026-11-07
- **Impacto:** tabela de tradução do ACL (ADR-004); sem ela a devolutiva assíncrona não fecha o loop (R48).

### A3. URL base, escopos OAuth2 e catálogo de status
- **Pergunta:** qual o **host/versão** de homologação e produção, os **escopos OAuth2** por operação (consulta × devolutiva) e o **catálogo fechado de status** aceitos pelo mestre?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** área dona do cadastro mestre + Segurança · **Prazo:** 2026-11-07
- **Impacto:** credenciais e configuração do cliente HTTP; sem isso o ENABLER de integração não roda em homolog.

### A4. Sistema externo concreto do cadastro mestre
- **Pergunta:** a BR-1.4.6 aceita **API-First genérica** (SAP · TOTVS · Senior · Sankhya · sistema interno). **Qual** é o da Onda 1-Must (MVP mínimo)? A escolha muda URL, autenticação e vocabulário do contrato.
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** Arquiteto + Suprimentos/TI · **Prazo:** 2026-11-13
- **Impacto:** [PENDENCY-0027](../../../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md) — ver §B.

---

## B. Integrações sem doc individual e sem dono (PENDENCY-0027)

> Contexto: 4 das 5 integrações externas não têm documento próprio nem dono nomeado ([inventory §6](../../inventory.md)). Cada uma só precisa de doc quando a entrega correspondente iniciar — o que falta **agora** é **dono** e **critério de início**.

### B1. Mestre de Materiais — SKU (R47)
- **Pergunta:** quem é o dono e qual o gatilho de início? Consulta de material e atualização de status usam o mesmo contrato do cadastro mestre serializado ou um catálogo distinto?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** _a nomear_ · **Prazo:** 2026-11-13
- **Impacto:** evita duplicar o ACL; pode virar extensão do [contrato do cadastro mestre](contratos/openapi-cadastro-mestre.yaml).

### B2. WMS/EWM — Estoque Avançado (R47)
- **Pergunta:** dono e gatilho. Buscar/receber/devolver material é síncrono ou por evento? Há WMS no cliente da Onda 1-Must (MVP mínimo) ou isso é Onda 2-Should (MVP completo)?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** _a nomear_ · **Prazo:** 2026-11-13
- **Impacto:** define se a Onda 1-Must (MVP mínimo) precisa de porta de estoque ou só de tabela local.

### B3. Centro de Reciclagem Central (R38)
- **Pergunta:** dono e gatilho. O controle logístico online é leitura, escrita ou ambos? Quem opera o sistema do outro lado?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** _a nomear_ · **Prazo:** 2026-11-13
- **Impacto:** afeta FEATURE-0005.0001/0005.0002 (Onda 2-Should (MVP completo)) — chegada da carga e destinação.

### B4. APIs de Parceiros (R39–R46)
- **Pergunta:** dono e gatilho. Os eventos de entrada (recebimento, linha, laboratório, embalagem, expedição, pallet) usam o contrato genérico do [integrations §2](integrations.md)? Quem homologa o primeiro parceiro?
- **Resposta:** _a preencher_
- **Status:** ⬜ · **Dono:** _a nomear_ (Parceiros/Operação) · **Prazo:** 2026-11-13
- **Impacto:** Inbox + idempotência + reconciliação; primeiro candidato a doc individual por ser o de maior superfície.

---

## C. Dependências (não são itens deste checklist)

| Item | Situação | Onde vive |
|---|---|---|
| Comportamento com cadastro mestre indisponível (fila × bloqueio) | ⬜ aberta — decisão de negócio | [PENDENCY-0019](../../../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md) |
| Idempotência da devolutiva (BR-1.4.7) | ✅ definida — implementação é TASK técnica | [ADR-004](../adrs/adr-004-acl-outbox.md) · [integracao §7](integracao-cadastro-mestre.md) |
| ACL + Outbox/Inbox | ✅ decidido | [ADR-004](../adrs/adr-004-acl-outbox.md) |
| Colunas/envio de MTR na expedição | ⬜ dependente de DDL | [PENDENCY-0028](../../../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md) |

---

## 4. Conclusão do fechamento

| Campo | Preencher |
|---|---|
| Itens decididos | `0 de 8` |
| Contrato sai de `PROPOSTA` quando | `A1 + A2 + A3` fechados (A4 pode vir depois) |
| Mudanças de escopo | `—` |
| Follow-ups (dono + prazo) | `B1–B4: nomear dono até 2026-11-13` |
| Próxima reunião | `a agendar com a área dona do cadastro mestre (semana de 2026-11-03)` |
