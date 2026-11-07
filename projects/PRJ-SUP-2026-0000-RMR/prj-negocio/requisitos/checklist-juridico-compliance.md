# 📝 Checklist de reunião — Jurídico/Compliance (Onda 1-Must (MVP mínimo))

| Campo | Valor |
|---|---|
| Objetivo | Validar as **pendências de LGPD e compliance ambiental** das travas da [FEATURE-0005.0005](../../prj-produto/features/FEATURE-0005.0005-travas-lgpd-compliance.md) antes do desenvolvimento da Onda 1-Must (MVP mínimo) |
| Participantes | Jurídico · Compliance/ESG · *(opcional)* TI, Suprimentos, Operação/Oficina |
| Data da resposta | 2026-10-16 |
| Itens | 7 de 7 **respondidos** ✅ (§A LGPD · §B ambiental · §C guarda de evidências) |
| Fonte | Pendências §6 da [FEATURE-0005.0005](../../prj-produto/features/FEATURE-0005.0005-travas-lgpd-compliance.md) · [B-REQ-05](requisitos-negocio.md) · [BRAINSTORM §2.6](../../prj-produto/discovery/BRAINSTORM.md) |
| Status do doc | ✅ **Revisado — decisões incorporadas à FEATURE-0005.0005 (§3/§6) e ao [registro de decisões](../../prj-produto/backlog/DECISOES-BACKLOG.md)** |

> **Como usar:** uma linha por pendência. Preencher **Resposta** (decisão concreta), marcar o **Status** e assinalar quem ficou **Dono** de follow-ups. Decisões tomadas aqui **voltam para o card da feature** (FEATURE-0005.0005 §6/§3) e para [registro de decisões](../../prj-produto/backlog/DECISOES-BACKLOG.md) — este checklist é só a ata de trabalho.

**Legenda de Status:** ⬜ Não respondida · ⏳ Em discussão · ✅ Decidida · ❌ Fora do escopo da Onda 1-Must (MVP mínimo) (adiada)

---

## A. Travas LGPD: certificado de sanitização (B-REQ-05)

### A1. Formato do certificado
- **Pergunta:** upload de termo assinado (PDF) × geração do certificado dentro do sistema? Quem assina o termo?
- **Resposta:** ✅ **Upload de PDF assinado** — o operador/resp. anexa o termo em PDF assinado; o sistema não gera o certificado na Onda 1-Must (MVP mínimo).
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** Compliance · **Prazo:** —
- **Impacto:** BR-5.5.2 esclarecida (arquivo = PDF assinado).

### A2. Quem executa e assina a sanitização
- **Pergunta:** operador interno ou terceiro especializado (contrato de operador de dados, LGPD)? Qual **perfil no sistema** (`PERFIL-COMPLIANCE`) pode registrar/certificar a sanitização?
- **Resposta:** ✅ **Interno, perfil "Compliance"** — perfil `PERFIL-COMPLIANCE` exclusivo para certificar a sanitização e o certificado; terceiro especializado fica para fora da Onda 1-Must (MVP mínimo) (evolução).
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** Compliance + TI · **Prazo:** —
- **Impacto:** nova BR-5.5.9.

### A3. Escopo do wipe além da saída externa ⚠️ *(lacuna nova — 2026-10-16)*
- **Pergunta:** a B-REQ-05 cobre "reciclagem externa" — e itens que voltam ao **reuso interno** (B-REQ-03) ou mudam de usuário: exigem **sanitização dos dados do usuário anterior** antes da realocação?
- **Resposta:** ✅ **Exigir na Onda 1-Must (MVP mínimo)** — sanitização/wipe obrigatório antes de **qualquer realocação** (saída externa **ou** reuso interno/troca de usuário). Risco LGPD de dado de usuário anterior reconhecido.
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** Jurídico · **Prazo:** —
- **Impacto:** nova BR-5.5.10 (LC de escopo da Onda 1-Must (MVP mínimo) — sanitização registrada no fluxo de realocação).

### A4. Dispensa de certificado para item sem mídia
- **Pergunta:** a flag por modelo + registro automático de **dispensa auditável** (BR-5.5.7 — regra derivada) é suficiente para auditoria, ou exige termo/até mesmo conferência manual?
- **Resposta:** ✅ **Dispensa via flag auditável** — dispensa registrada na trilha, sem termo e sem conferência manual (regra derivada **confirmada**).
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** Compliance · **Prazo:** —
- **Impacto:** BR-5.5.7 confirmada (marca de "derivada" removida).

---

## B. Compliance ambiental — PNRS/MTR

### B1. MTR na Onda 1-Must (MVP mínimo)
- **Pergunta:** o **registro manual do nº do MTR** vale como evidência para auditoria, ou a conformidade exige integração com sistema ambiental já no MVP? *(a Onda 1-Must (MVP mínimo) proíbe integrações externas)*
- **Resposta:** ✅ **Registro manual do nº do MTR na Onda 1-Must (MVP mínimo)** — evidência suficiente; integração com sistema ambiental vira evolução pós-Onda 1-Must (MVP mínimo).
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** Compliance · **Prazo:** —
- **Impacto:** BR-5.5.4 mantida; pendência FEATURE-0005.0005 §6.1 resolvida.

### B2. Validade da licença do reciclador ⚠️ *(regra proposta — 2026-10-16)*
- **Pergunta:** conferir **número e validade** da licença do reciclador no ato da destinação e **bloquear destino com licença vencida**? (evolução de BR-5.5.4)
- **Resposta:** ✅ **Aceita a regra** — nº + validade obrigatórios; licença vencida **bloqueia** o destino (vira BR-5.5.11).
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** Compliance · **Prazo:** —
- **Impacto:** nova BR-5.5.11.

---

## C. Guarda das evidências

### C1. Retenção de certificados, MTRs e trilhas ⚠️ *(lacuna nova — 2026-10-16)*
- **Pergunta:** por quanto tempo as evidências ficam guardadas? Existe prazo mínimo da **LGPD (retenção)** e prazo próprio do **PNRS/guarda ambiental** — qual vale como piso?
- **Resposta:** ✅ **Guarda padrão na Onda 1-Must (MVP mínimo)** — sem retenção custom no MVP; política de prazos (piso LGPD × PNRS) é **follow-up pós-Onda 1-Must (MVP mínimo)**.
- **Status:** ✅ Decidida (2026-10-16) · **Dono:** Jurídico · **Prazo:** pós-Onda 1-Must (MVP mínimo)
- **Impacto:** nenhuma regra nova na Onda 1-Must (MVP mínimo); pendência FEATURE-0005.0005 §6.6 rebaixada para evolução.

---

## D. Follow-ups abertos (fora da Onda 1-Must (MVP mínimo))

> As 7 decisões da Onda 1-Must (MVP mínimo) seguem fechadas. Esta seção é só o **rastro do que ficou fora** — não reabre o ciclo. Controle no [hub](../../pendencias.md).

| Item | O que falta decidir | Dono | Prazo | Status | Pendência |
|---|---|---|---|---|---|
| Retenção de evidências | Piso de prazos (LGPD × PNRS) para certificados, MTRs e trilhas | Jurídico | pós-Onda 1-Must (MVP mínimo) | ❌ Adiada | [PENDENCY-0007](../../pendencias.md) |
| Terceiro de sanitização | Contrato de operador de dados (LGPD) para sanitização por terceiro | Compliance | pós-Onda 1-Must (MVP mínimo) | ❌ Adiada | [PENDENCY-0008](../../pendencias.md) |
| CDF | Emissão/integração do Certificado de Destinação Final junto ao MTR | Compliance | pós-Onda 1-Must (MVP mínimo) | ❌ Adiada | [PENDENCY-0010](../../pendencias.md) |
| DDL de MTR/CDF e do valor da sanitização | Onde persistir nº do MTR, CDF e o valor lido na sanitização (hoje só em evento) | Eng + Eng de Dados | 2026-11-13 | ⬜ Aberta | [PENDENCY-0028](../../pendencias.md) |

## 4. Conclusão da reunião

| Campo | Preencher |
|---|---|
| Pendências decididas hoje | `A1, A2, A3, A4, B1, B2, C1` (7 de 7) |
| Regras novas acrescentadas na FEATURE-0005.0005 | `BR-5.5.9 (perfil Compliance) · BR-5.5.10 (sanitização no reuso interno) · BR-5.5.11 (validade da licença)` + esclarecimentos em BR-5.5.2/BR-5.5.7 |
| Itens que viram LC (mudança de escopo da Onda 1-Must (MVP mínimo)) | `A3 — sanitização exigida antes de realocação interna (reuso/troca de usuário), além da saída externa` |
| Follow-ups (dono + prazo) | `C1 — política de retenção de evidências (Jurídico, pós-Onda 1-Must (MVP mínimo)) · Terceiro especializado em sanitização (Compliance, evolução)` |
| Próxima reunião (se houver) | `não necessária — ciclo fechado` |

**Após a reunião:** ✅ FEATURE-0005.0005 §3 (regras) e §6 (pendências) atualizadas · ✅ [decisão D-05](../../prj-produto/backlog/DECISOES-BACKLOG.md) · ✅ checklist em ✅ Revisado.
