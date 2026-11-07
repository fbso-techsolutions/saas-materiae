# 📝 Checklist de reunião — Operação/PO (pendências da Onda 1-Must (MVP mínimo))

> **Nota de contexto (2026-10-23):** esta ata registra a reunião de 2026-10-16. À época, a Onda 1-Must (MVP mínimo) estava previsto para a Sprint 1. Desde 2026-10-23, a Onda 1-Must (MVP mínimo) é a Sprint 2. As referências à Sprint 1 neste documento são históricas.

| Campo | Valor |
|---|---|
| Objetivo | Fechar as **pendências que afetam a Onda 1-Must (MVP mínimo)** antes da Sprint 1 — operação da embalagem/expedição e validação das regras derivadas |
| Participantes | **PO** · **Operação/Oficina** · *(opcional)* PM, Suprimentos |
| Data da resposta | 2026-10-16 |
| Itens | 5 de 5 **respondidos** ✅ (§A Operação da Onda 1-Must (MVP mínimo) · §B Escopo do workflow · §C Regras derivadas) |
| Fonte | Pendências **PENDENCY-0004, PENDENCY-0005, PENDENCY-0006, PENDENCY-0009** do [hub](../../pendencias.md) · detalhe nos cards [FEATURE-0002.0001](../features/FEATURE-0002.0001-painel-kanban-workflow.md) e [FEATURE-0001.0001](../features/FEATURE-0001.0001-recebimento-ativos.md) |
| Status do doc | ✅ **Revisado — decisões incorporadas a FEATURE-0002.0001/FEATURE-0002.0005/FEATURE-0001.0001/US-FEAT-0002.0005-0010 e ao [registro de decisões](DECISOES-BACKLOG.md)** |

> **Como usar:** uma linha por pendência. Preencher **Resposta** (decisão concreta), marcar o **Status** e assinalar quem ficou **Dono** de follow-ups. Decisões tomadas aqui **voltam para os cards** (FEATURE-0002.0001 §3/§6, FEATURE-0001.0001 §3, US-FEAT-0002.0005-0010) e para o [registro de decisões](DECISOES-BACKLOG.md) — este checklist é só a ata de trabalho.

**Legenda de Status:** ⬜ Não respondida · ⏳ Em discussão · ✅ Decidida · ❌ Adiada (com nova data)

---

## A. Operação da Onda 1-Must (MVP mínimo) — embalagem e identificação

### A1. Etiqueta final fora da Onda 1-Must (MVP mínimo) — PENDENCY-0005
- **Pergunta:** a operação confirma que o **Onda 1-Must (MVP mínimo) pode embalar sem etiqueta** (R34 é da FEATURE-0002.0002, Onda 2-Should (MVP completo))? Como o item é identificado na embalagem/expedição sem etiqueta — leitura do Identificador Físico do Ativo (ex.: serial/IMEI) + smart card (US-FEAT-0002.0001-0009/US-FEAT-0002.0005-0010) basta?
- **Sugestão para a Onda 1-Must (MVP mínimo):** confirmar — identificação por leitura + smart card; etiqueta vem com a FEATURE-0002.0002.
- **Resposta:** ✅ **Confirmado — identificação por leitura + smart card; etiqueta vem com a FEATURE-0002.0002.**
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** PM/PO + Eng · **Prazo:** —
- **Impacto:** FEATURE-0002.0002 **continua fora da Onda 1-Must (MVP mínimo)** (sem LC); US-FEAT-0002.0001-0009/US-FEAT-0002.0005-0010 confirmadas.

### A2. Smart card sem integração — PENDENCY-0006
- **Pergunta:** o **registro manual** do smart card (leitura/digitação junto com o identificador — R35) atende a operação na Onda 1-Must (MVP mínimo), sem integrar nada externo?
- **Sugestão para a Onda 1-Must (MVP mínimo):** sim — registro manual auditado; integração futura.
- **Resposta:** ✅ **Sim — registro manual auditado; integração fica para depois.**
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** PM/PO + Eng · **Prazo:** —
- **Impacto:** US-FEAT-0002.0001-0009 cen. 2 confirmada como está.

## B. Escopo do workflow

### B1. Expedição dentro de FEATURE-0002.0001 ou nova FEATURE-0002.0005 — PENDENCY-0004
- **Pergunta:** a **composição de pallet por leitura + NF de saída (R36/R37)** continua **dentro da FEATURE-0002.0001** para a Onda 1-Must (MVP mínimo), ou a operação já vê volume/complexidade que justifique extrair **FEATURE-0002.0005 Expedição** (pallets múltiplos, reconciliação)?
- **Sugestão para a Onda 1-Must (MVP mínimo):** ficar em FEATURE-0002.0001 (pallet simples + NF) com direito a revisão — extrair FEATURE-0002.0005 se crescer.
- **Resposta:** ⚠️ **Decidido: EXTRAIR para FEATURE-0002.0005** (diferente da sugestão) — expedição vira feature própria, **Onda 1-Must (MVP mínimo)**, com a story US-FEAT-0002.0005-0010.
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** PM/PO + Eng · **Prazo:** —
- **Impacto:** criada **[FEATURE-0002.0005-expedicao](../features/FEATURE-0002.0005-expedicao.md)** · mapeamento **19 → 20 features** · FEATURE-0002.0001 perde R36/R37/US-FEAT-0002.0005-0010 · corte da Sprint 1 inclui FEATURE-0002.0005.

## C. Regras derivadas — validação com as áreas (PENDENCY-0009)

### C1. Duplicidade de recebimento (BR-1.1.1)
- **Pergunta:** confirmar a regra: **um item em processo ativo não pode ser recebido duas vezes** — o sistema **bloqueia com aviso**. Há exceção (ex.: item que retorna do campo no mesmo dia, re-entrega por engano)?
- **Resposta:** ✅ **Manter o bloqueio** (auditoria registra a tentativa); exceção = decisão humana registrada.
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** PM/PO + Eng · **Prazo:** —
- **Impacto:** BR-1.1.1 **confirmada** — marca de "regra derivada" removida ([FEATURE-0001.0001 §3](../features/FEATURE-0001.0001-recebimento-ativos.md)).

### C2. Item só sai uma vez (US-FEAT-0002.0005-0010 cen. 3)
- **Pergunta:** confirmar a regra: um **item já expedido ou em outro pallet/processo ativo** não pode ser lido na composição de outro pallet — leitura **bloqueada com motivo**.
- **Resposta:** ✅ **Manter** — fecha duplicidade de expedição e sustenta a reconciliação.
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** PM/PO + Eng · **Prazo:** —
- **Impacto:** US-FEAT-0002.0005-0010 cen. 3 **confirmada** (agora BR-2.5.3 na [FEATURE-0002.0005](../features/FEATURE-0002.0005-expedicao.md)).

---

## 4. Conclusão da reunião

| Campo | Preencher |
|---|---|
| Pendências decididas hoje | `A1 ✅ · A2 ✅ · B1 ✅ · C1 ✅ · C2 ✅` (5 de 5) |
| Mudanças de escopo (LC da Onda 1-Must (MVP mínimo)) | `Nenhuma LC — FEATURE-0002.0002 e smart card mantidos fora; **extrair expedição para FEATURE-0002.0005** (feature nova, dentro da Onda 1-Must (MVP mínimo))` |
| Novas features criadas | `FEATURE-0002.0005 Expedição (Onda 1-Must (MVP mínimo) — R36/R37, story US-FEAT-0002.0005-0010 migrou)` |
| Follow-ups (dono + prazo) | `Reavaliar FEATURE-0002.0005 se crescer volume/complexidade (PO — pós-Sprint 1)` |
| Próxima reunião (se houver) | `não necessária — ciclo fechado` |

**Após a reunião:** ✅ [FEATURE-0002.0001](../features/FEATURE-0002.0001-painel-kanban-workflow.md) ajustada (expedição removida, §6 fechada) · ✅ [FEATURE-0002.0005](../features/FEATURE-0002.0005-expedicao.md) criada · ✅ [FEATURE-0001.0001](../features/FEATURE-0001.0001-recebimento-ativos.md) (BR-1.1.1 confirmada) · ✅ [US-FEAT-0002.0005-0010](../user-stories/US-FEAT-0002.0005-0010-expedicao.md) migrada · ✅ **PENDENCY-0004/PENDENCY-0005/PENDENCY-0006/PENDENCY-0009 → ✅ no [hub](../../pendencias.md)** · ✅ [decisão D-08](DECISOES-BACKLOG.md) · checklist ✅ Revisado — **pronto para abrir a Sprint 1**.
