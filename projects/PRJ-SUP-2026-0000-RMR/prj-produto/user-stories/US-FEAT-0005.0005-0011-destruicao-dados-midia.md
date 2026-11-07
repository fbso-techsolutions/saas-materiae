# 💬 User Story: US-FEAT-0005.0005-0011 — Certificar a sanitização segura de dados da mídia (LGPD)

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0005 — Recuperação de Valor](../epicos/EPIC-0005-recuperacao-de-valor.md) ➔ [FEATURE-0005.0005 — Travas de LGPD e compliance ambiental](../features/FEATURE-0005.0005-travas-lgpd-compliance.md) ➔ US-FEAT-0005.0005-0011 |
| **Prioridade** | **Must Have** (Onda 1-Must (MVP mínimo)) |
| **Data-alvo** | Sprint 2 (Onda 1-Must (MVP mínimo)) |
| **Estimativa** | 4 pontos |
| **Rastreio** | **B-REQ-05** (Termo de Destruição Segura de Dados) · R12 (serviço no HDD) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** operador/resp. de compliance,
- **quero** registrar a sanitização da mídia (wipe lógico ou destruição física) e anexar o termo comprovando o método aplicado,
- **para que** nenhum equipamento seja destinado sem prova de que os dados foram eliminados (LGPD).

## 2. Cenários comportamentais de aceite

### Cenário 1: Trava LGPD exigida com sanitização + termo assinado
- **Dado** um item **com mídia de armazenamento** (flag do modelo) em rota de saída (sucata → destinação) **ou de realocação/reuso interno** ([checklist A3](../../prj-negocio/requisitos/checklist-juridico-compliance.md)),
- **Quando** o operador tenta concluir,
- **Então** o sistema **exige** o registro da sanitização (método, responsável, data/hora) e o **termo em PDF assinado anexado** antes de liberar; a certificação é feita pelo **perfil Compliance (`PERFIL-COMPLIANCE`)**.

### Cenário 2: Trava satisfeita → segue para a trava ambiental
- **Dado** o certificado registrado com todos os campos e o termo anexado,
- **Quando** a trava é satisfeita,
- **Então** a saída segue para a trava ambiental ([US-FEAT-0005.0005-0012](US-FEAT-0005.0005-0012-compliance-ambiental-destino.md)) e o certificado fica **anexado à trilha do item**.

### Cenário 3: Bloqueio sem certificado
- **Dado** o item **sem** certificado,
- **Quando** o operador tenta concluir a saída,
- **Então** o sistema **bloqueia** com mensagem citando LGPD/B-REQ-05 e registra a tentativa na auditoria.

### Cenário 4: Dispensa para modelo sem mídia
- **Dado** um item cujo modelo **não possui mídia** (flag),
- **Quando** a saída é processada,
- **Então** a trava LGPD **não se aplica** e a dispensa fica registrada ([checklist A4](../../prj-negocio/requisitos/checklist-juridico-compliance.md)).

## 3. Regras de negócio relacionadas

- **BR-5.5.1** — Exigência de certificado de sanitização antes da saída (cen. 1) — *definição na [FEATURE-0005.0005 §3](../features/FEATURE-0005.0005-travas-lgpd-compliance.md)*
- **BR-5.5.10** — Sanitização obrigatória antes de **qualquer realocação** — saída externa ou reuso interno/troca de usuário (cen. 1)
- **BR-5.5.2** — Termo em PDF assinado com o método de sanitização (wipe lógico ou destruição física) como comprovação (cen. 1)
- **BR-5.5.3** — Flag de mídia do modelo ativa a trava (cen. 1)
- **BR-5.5.5** — Bloqueio auditado da saída sem certificado (cen. 3)
- **BR-5.5.7** — Dispensa registrada para modelos sem mídia (cen. 4)
- **BR-5.5.9** — Certificação restrita ao perfil Compliance (cen. 1)

## 4. Não funcionais

- O termo é o documento de comprovação exigido pela B-REQ-05 — **formato decidido: upload de PDF assinado** ([checklist A1](../../prj-negocio/requisitos/checklist-juridico-compliance.md)).
- Sem mouse; sem integrações externas na Onda 1-Must (MVP mínimo).

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ trava autônoma, acionável por qualquer rota de saída · **N** ✅ 7/7 decisões jurídicas já tomadas (checklist) · **V** ✅ requisito legal (LGPD — B-REQ-05) · **E** ✅ 4 pontos, decisões fechadas · **S** ✅ cabe numa Sprint · **T** ✅ 4 cenários testáveis.
