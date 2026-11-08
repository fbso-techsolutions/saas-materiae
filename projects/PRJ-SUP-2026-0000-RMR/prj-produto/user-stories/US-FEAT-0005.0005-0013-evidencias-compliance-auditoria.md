# 💬 User Story: US-FEAT-0005.0005-0013 — Consultar as evidências de compliance do item (auditoria)

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0005 — Recuperação de Valor](../epicos/EPIC-0005-recuperacao-de-valor.md) ➔ [FEATURE-0005.0005 — Travas de LGPD e compliance ambiental](../features/FEATURE-0005.0005-travas-lgpd-compliance.md) ➔ US-FEAT-0005.0005-0013 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 3 pontos |
| **Rastreio** | **B-REQ-05** (comprovação) · apoio ESG/Compliance · trilha de auditoria por etapa (R20) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** Jurídico/Compliance (auditor),
- **quero** consultar no próprio item todas as evidências de compliance (certificado de sanitização, destino, licença, MTR, responsáveis),
- **para que** eu consiga comprovar a conformidade (LGPD/PNRS) sem planilha paralela.

## 2. Cenários comportamentais de aceite

### Cenário 1: Evidências completas na trilha do item
- **Dado** um item que passou pelas travas,
- **Quando** o auditor abre o **histórico/trilha do item**,
- **Então** ele vê: certificado de sanitização (ou dispensa), destino + licença + MTR, responsável e data/hora de cada registro.

### Cenário 2: Download do termo anexado
- **Dado** o certificado anexado,
- **Quando** o auditor acessa o anexo,
- **Então** o **arquivo do termo** é aberto/downloadável a partir do item.

### Cenário 3: Tentativas bloqueadas visíveis com motivo
- **Dado** um item bloqueado alguma vez na saída,
- **Quando** o auditor consulta a trilha,
- **Então** as **tentativas bloqueadas** aparecem com motivo (LGPD/ambiental), responsável e horário.

## 3. Regras de negócio relacionadas

- **BR-5.5.6** — Rastreio completo das evidências na trilha (cens. 1 e 3) — *definição na [FEATURE-0005.0005 §3](../features/FEATURE-0005.0005-travas-lgpd-compliance.md)*
- **BR-5.5.5** — Tentativas bloqueadas auditadas (cen. 3)

## 4. Não funcionais

- A consulta é **no contexto do item** (trilha) — busca global por identificador/OS é escopo da **FEATURE-0002.0003** (evita sobreposição).
- Prova auditável sustenta os indicadores ESG futuros ([PRD §2.2](../../PRD.md)).

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ leitura pura sobre dados das outras travas · **N** ✅ escopo restrito à trilha conversado com Compliance · **V** ✅ comprovação sem planilha paralela (B-REQ-05) · **E** ✅ 3 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 3 cenários testáveis.
