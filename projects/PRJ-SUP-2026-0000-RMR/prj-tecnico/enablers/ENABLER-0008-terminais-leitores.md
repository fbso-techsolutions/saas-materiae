# 🛠️ ENABLER-0008 — Terminais da oficina: leitores + operação sem mouse validada

| Campo | Valor |
|---|---|
| **Categoria** | Infraestrutura + Exploração (spike de validação) |
| **Origem** | **C2** (checklist de arquitetura) — "leitor USB HID (zero driver) + Bluetooth em modo HID (não SPP)" · "validar em 1 terminal real **antes da Sprint 1**" · decisão A2 da Operação (smart card = registro manual) |
| **Habilita** | Stories 0004–0010 (DoD "sem mouse", identificador via teclado) + FEATURE-0001.0001 (campo sempre focado) |
| **Depende de** | — (paralelo; ~~lead time de hardware~~ — **decidido 2026-10-21: sem compra — usar leitores/terminal existentes** — [PENDENCY-0018](../../pendencias.md) ✅) |
| **Dono sugerido** | Manoel Carlos (frontend) + Lourival Louro (infra) + **Bruna Santos** (Operação, validação no chão de fábrica) |
| **Estimativa (Job Size)** | **2** *(proposta — consolidar no planning; spike timeboxed 1–2 dias)* |
| **Status** | 📝 Rascunho (2026-10-19) · **DoR:** [checklist](dor-enablers.md) · **WSJF:** [avaliação](wsjf-enablers-iniciais.md) (2º lugar proposto) |

---

## 1. Visão Geral e Contexto

- **Categoria:** Infraestrutura + Exploração (spike de validação — [guia §3](https://github.com/fbso-techservice/platform-standards/blob/main/standards/agile/guia-invest-enablers-spike.md))
- **Origem:** C2 (Checklist de Arquitetura) — decisão "leitor USB HID com driver zero de fábrica; Bluetooth só em modo HID (não SPP)"; decisão "validar leitura + campo focado + atalhos em Firefox e Chrome antes da Sprint 1"; decisão 5 (smart card = registro manual por operador).
- **Status de Bloqueio:** **Bloqueia o desenho real das stories 0004–0010.** Sem confirmar que o leitor emula teclado no terminal da oficina, o "campo sempre focado" e a UI keyboard-first são hipótese — e hipótese errada custa refatoração de todas as telas.

## 2. Análise de Priorização (Métricas para WSJF)

- **Valor de Negócio / Redução de Risco:** **Alto.** O risco é de hardware: se o leitor existente não emular teclado (ou exigir driver), a **UI inteira é repensada**. Sem compra ([PENDENCY-0018](../../pendencias.md)), não há lead time de fornecedor; o prazo depende da validação no terminal da oficina antes da Sprint 1.
- **Habilitação de Oportunidade:** Confirmado o leitor existente, todas as stories keyboard-first seguem com premissa validada; a decisão de não compra está registrada na [PENDENCY-0018](../../pendencias.md) (2026-10-21).

## 3. Escopo Técnico Detalhado

1. **Spike de validação (timebox 1–2 dias):** em **1 terminal real da oficina**, validar:
   - leitor **USB HID** (zero driver) e leitor **Bluetooth em modo HID** (não SPP) — entrada como teclado;
   - leitura de identificador em Firefox e Chrome;
   - campo sempre focado + atalhos (Esc, Enter, atalho de audição) com leitor disparando eventos.
2. **Comparativo registrado:** saída escrita do spike — HID USB × Bluetooth (fiabilidade, bateria/pareamento, driver, custo) com recomendação.
3. **Decisão de aquisição — ✅ respondida (2026-10-21, [PENDENCY-0018](../../pendencias.md)):** **não haverá compra** — usam-se os **equipamentos existentes**. Confirmado com a Operação: o **leitor atual emula teclado** no terminal da oficina, e o **terminal da oficina serve** como terminal real de homologação. O spike valida **USB HID e Bluetooth** (ambos) em **Firefox e Chrome**.
4. **Registro manual de cartão:** confirmar com a Operação que o fluxo "cartão sem chip → registro manual do identificador" é aceitável no chão de fábrica (decisão A2).

> **Não está incluso:** smart card/leitor de cartão (registro manual por decisão da Operação A2) · aquisição de equipamentos (dispensada: usar os existentes, [PENDENCY-0018](../../pendencias.md)) · driver instalado no terminal de produção além da validação.

## 4. Critérios de Saída (Definition of Done)

- **1 terminal real** lê identificador com **Firefox e Chrome**, **sem mouse** — leitor **USB HID e Bluetooth (ambos)** confirmados funcionando como teclado.
- Spike timeboxed (1–2 dias) com **resultado escrito**: comparativo HID USB × Bluetooth + recomendação.
- ~~Decisão de compra registrada com dono e prazo~~ → **✅ decidida 2026-10-21 (PENDENCY-0018): sem compra — usar leitores/terminal existentes** (leitor atual emula teclado; terminal da oficina serve).
- Premissa "campo sempre focado" validada na tela de triagem com o leitor real.
