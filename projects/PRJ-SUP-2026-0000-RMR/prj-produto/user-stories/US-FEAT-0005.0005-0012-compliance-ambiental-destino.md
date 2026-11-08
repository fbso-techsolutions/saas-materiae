# 💬 User Story: US-FEAT-0005.0005-0012 — Registrar o compliance ambiental do destino (PNRS)

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0005 — Recuperação de Valor](../epicos/EPIC-0005-recuperacao-de-valor.md) ➔ [FEATURE-0005.0005 — Travas de LGPD e compliance ambiental](../features/FEATURE-0005.0005-travas-lgpd-compliance.md) ➔ US-FEAT-0005.0005-0012 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 4 pontos |
| **Rastreio** | Compliance ambiental — contexto [BRAINSTORM §2.6](../discovery/BRAINSTORM.md) · Destinação a reciclador licenciado · MTR/PNRS |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** operador de destinação,
- **quero** registrar para onde o item/sucata vai — reciclador, licença e MTR,
- **para que** a destinação final seja legal (PNRS) e evite passivos ambientais.

## 2. Cenários comportamentais de aceite

### Cenário 1: Destino registrado com licença e MTR
- **Dado** um item aprovado nas travas anteriores (LGPD ou dispensa),
- **Quando** o operador informa o **destino** — reciclador, **número e validade da licença** e **MTR** (validade da licença registrada no ato da destinação — BR-5.5.11),
- **Então** o registro fica salvo e a destinação é concluída.

### Cenário 2: Bloqueio sem destino ambiental registrado
- **Dado** o destino ambiental **não registrado** (ou licença em branco),
- **Quando** o operador tenta concluir a saída,
- **Então** o sistema **bloqueia** com mensagem citando compliance ambiental/PNRS e audita a tentativa.

### Cenário 3: Histórico completo da destinação
- **Dado** a destinação concluída,
- **Quando** o histórico do item é avaliado,
- **Então** constam destino, licença (nº **e validade**), MTR, responsável e data/hora.

### Cenário 4: Licença vencida bloqueada
- **Dado** um reciclador com licença **vencida** (validade informada),
- **Quando** o operador tenta destiná-lo,
- **Então** o sistema **bloqueia** informando licença vencida e audita a tentativa ([checklist B2](../../prj-negocio/requisitos/checklist-juridico-compliance.md)).

## 3. Regras de negócio relacionadas

- **BR-5.5.4** — Campos do destino: reciclador, licença e MTR (cen. 1) — *definição na [FEATURE-0005.0005 §3](../features/FEATURE-0005.0005-travas-lgpd-compliance.md)*
- **BR-5.5.5** — Bloqueio auditado sem destino/licença (cen. 2)
- **BR-5.5.6** — Rastreio completo da destinação (cen. 3)
- **BR-5.5.11** — Bloqueio de licença vencida (cen. 4)
- **BR-5.5.12** — MTR obrigatório na destinação externa, processo em [regras-mtr-pnrs](../../../../docs/negocio/regras-mtr-pnrs.md) (cens. 1 e 2)

## 4. Não funcionais

- No Onda 1-Must (MVP mínimo) o MTR é **registrado manualmente** (nº do documento) — decisão confirmada no [checklist B1](../../prj-negocio/requisitos/checklist-juridico-compliance.md); integração com sistema ambiental é evolução pós-Onda 1-Must (MVP mínimo).

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ trava autônoma após a LGPD · **N** ✅ decisões B1/B2 já registradas · **V** ✅ destinação legal, evita passivo (PNRS) · **E** ✅ 4 pontos · **S** ✅ cabe numa Sprint · **T** ✅ 4 cenários testáveis.
