# 🗑️ Regras de MTR e destinação ambiental (PNRS)

| Campo | Valor |
|---|---|
| **Finalidade** | Regras do processo de **MTR** (Manifesto de Transporte de Resíduos), documento digital que rastreia a geração, o transporte e a destinação do resíduo industrial e comercial no Brasil, no escopo da **PNRS** (Política Nacional de Resíduos Sólidos) |
| **Dono** | Compliance (Gabriela Moraes), com Jurídico (Legisvaldo Nunes) — papéis em [equipe](../../projects/PRJ-SUP-2026-0000-RMR/equipe.md) |
| **Decisão** | 2026-10-22: termo "MTR quando aplicável" normalizado para **MTR**; toda destinação externa registra MTR |
| **Consumido por** | [FEATURE-0005.0005](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/features/FEATURE-0005.0005-travas-lgpd-compliance.md) (BR-5.5.4, BR-5.5.12) · [US-FEAT-0005.0005-0012](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/user-stories/US-FEAT-0005.0005-0012-compliance-ambiental-destino.md) · [US-FEAT-0005.0005-0013](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/user-stories/US-FEAT-0005.0005-0013-evidencias-compliance-auditoria.md) · [taxonomia §8](taxonomia-entidades-cadastro-ativos.md) |
| **Rastreio** | Contexto [BRAINSTORM §2.6](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/discovery/BRAINSTORM.md) · [checklist jurídico B1/B2](../../projects/PRJ-SUP-2026-0000-RMR/prj-negocio/requisitos/checklist-juridico-compliance.md) · [PENDENCY-0010](../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md) (CDF, pós-Onda 1-Must (MVP mínimo)) |
| **Status** | ✅ **Regras definidas (2026-10-22)** — Onda 1-Must (MVP mínimo) opera com registro manual do nº |

---

## 1. Regra central

**Toda destinação externa (reciclagem externa ou descarte) conclui só com MTR registrado.** No Onda 1-Must (MVP mínimo) o **nº do MTR é digitado manualmente** na trilha do item (decisão do [checklist B1](../../projects/PRJ-SUP-2026-0000-RMR/prj-negocio/requisitos/checklist-juridico-compliance.md)); a emissão e a integração com sistema ambiental ficam para evolução.

## 2. Processo

| Etapa | Regra | Lastro |
|---|---|---|
| Geração | O resíduo identificado nas etapas de sucata e reciclagem vira material a destinar; o originador emite o MTR no sistema ambiental | [BRAINSTORM §2.6](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/discovery/BRAINSTORM.md) |
| Emissão | O MTR é emitido **fora da Onda 1-Must (MVP mínimo)**, no sistema ambiental pelo responsável pela operação | [checklist B1](../../projects/PRJ-SUP-2026-0000-RMR/prj-negocio/requisitos/checklist-juridico-compliance.md) |
| Registro na Onda 1-Must (MVP mínimo) | nº do MTR + responsável + data/hora, digitados no ato da destinação | BR-5.5.4 · BR-5.5.6 |
| Transporte | O MTR acompanha o transporte do material até o destinatário | Definição acima |
| Destinação | Destinatário com **licença ambiental válida** (nº e validade no ato); licença vencida **bloqueia** o destino | BR-5.5.11 |
| Conclusão | Sem destino + licença + MTR, a saída **não conclui** e a tentativa fica auditada | BR-5.5.5 |

## 3. Escopo e exceções

- **Obrigatório** para toda destinação externa do fluxo (reciclagem externa e descarte); não há qualificador "quando aplicável" (decisão 2026-10-22).
- **Não se aplica** a reuso interno e troca de usuário: não há transporte, e a trava ali é a sanitização (BR-5.5.10).
- **CDF** (Certificado de Destinação Final): pós-Onda 1-Must (MVP mínimo) ([PENDENCY-0010](../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md)).
- **Integração** com sistema ambiental: evolução pós-Onda 1-Must (MVP mínimo); na Onda 1-Must (MVP mínimo) o registro é manual (checklist B1).

## 4. Onde vive cada coisa

- Regra da linha de saída: [FEATURE-0005.0005 §3](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/features/FEATURE-0005.0005-travas-lgpd-compliance.md) (BR-5.5.4 e BR-5.5.12)
- Cenários de aceite: [US-FEAT-0005.0005-0012](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/user-stories/US-FEAT-0005.0005-0012-compliance-ambiental-destino.md)
- Evidências consultáveis: [US-FEAT-0005.0005-0013](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/user-stories/US-FEAT-0005.0005-0013-evidencias-compliance-auditoria.md)
- Decisões de compliance: [checklist jurídico](../../projects/PRJ-SUP-2026-0000-RMR/prj-negocio/requisitos/checklist-juridico-compliance.md) (7/7 respondidas)
