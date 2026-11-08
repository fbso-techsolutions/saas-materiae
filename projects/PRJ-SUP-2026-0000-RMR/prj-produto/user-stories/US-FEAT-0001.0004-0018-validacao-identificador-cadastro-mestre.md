# 💬 User Story: US-FEAT-0001.0004-0018 — Validar o identificador no cadastro mestre na triagem

| Campo | Valor |
|---|---|
| **Projeto** | PRJ-SUP-2026-0000-RMR (RMR Reversa) |
| **Mapeamento ágil** | [EPIC-0001 — Logística Reversa e Triagem](../epicos/EPIC-0001-logistica-reversa-e-triagem.md) ➔ [FEATURE-0001.0004 — Validação no cadastro mestre](../features/FEATURE-0001.0004-validacao-identificador-cadastro-mestre.md) ➔ US-FEAT-0001.0004-0018 |
| **Prioridade** | **Should Have** (Onda 2-Should (MVP completo), fora da Onda 1-Must (MVP mínimo) — dependência externa) |
| **Data-alvo** | MVP (Onda 2-Should (MVP completo)) — rolling wave |
| **Estimativa** | 4 pontos |
| **Rastreio** | R17 (validar o identificador — NDS/IMEI no pedido — consultando o cadastro mestre), R22 (validar na base do cadastro mestre na triagem) |
| **Versão** | 1.1 — layout INVEST/Gherkin ([guia ágil §5](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)) |
| **Status** | 📝 Rascunho (2026-10-16) |

---

## 1. Declaração da história

- **Como** operador de triagem,
- **quero** que o sistema consulte o Identificador Físico do Ativo lido no cadastro mestre corporativo,
- **para que** só entrem no fluxo ativos que existem na base e o inventário corporativo fique consistente.

## 2. Cenários comportamentais de aceite

### Cenário 1: Encontrado → dados mestres anexados
- **Dado** o identificador lido no recebimento ([US-FEAT-0001.0001-0001](US-FEAT-0001.0001-0001-registro-recebimento-ativo.md)),
- **Quando** o sistema consulta o cadastro mestre via **API REST genérica**,
- **Então** a resposta **encontrado** anexa os dados mestres ao recebimento e o fluxo segue.

### Cenário 2: Não encontrado → bloqueio + rota de exceção registrada
- **Dado** a resposta **não encontrado**,
- **Quando** o operador tenta concluir o recebimento,
- **Então** o recebimento normal é **bloqueado** com aviso, e a **rota de exceção** (cadastro manual/retorno à origem) é registrada com decisão humana.

### Cenário 3: Cadastro mestre indisponível → validação pendente *(hipótese — pendente de decisão)*
- **Dado** o cadastro mestre **indisponível**,
- **Quando** o operador lê o identificador,
- **Então** — **sob a hipótese atual**, ainda aberta à decisão ([PENDENCY-0019](../../pendencias.md)) — o recebimento **não trava**: segue com aviso de "validação pendente" e o registro entra na **fila de reenvio**; **decidindo-se bloqueio total** com a API indisponível, o cenário passa a ser o bloqueio do recebimento até a API voltar.

### Cenário 4: Auditoria de qualquer tentativa
- **Dado** qualquer tentativa (encontrado, não encontrado, falha),
- **Quando** a auditoria é consultada,
- **Então** constam ator, data/hora, identificador e resultado.

## 3. Regras de negócio relacionadas

- **BR-1.4.1** — Identificador lido consultado no cadastro mestre antes de concluir (cen. 1) — *definição na [FEATURE-0001.0004 §3](../features/FEATURE-0001.0004-validacao-identificador-cadastro-mestre.md)*
- **BR-1.4.2** — Fluxo de encontrado/não encontrado (cens. 1 e 2)
- **BR-1.4.4** — Indisponibilidade não trava a operação; fila de reenvio (cen. 3) — *hipótese, **PENDENCY-0019** aberta (§5)*
- **BR-1.4.5** — Auditoria de todas as tentativas (cen. 4)
- **BR-1.4.6** — Contrato via API REST genérica (qualquer ERP) (cen. 1)

## 4. Não funcionais

- **Timeout/retry/fila:** os serviços usam os **padrões do time técnico** — se o negócio quiser valores específicos, isso entra em **FEATURES/US** (decisão 2026-10-21). Contrato da API = ✅ [PENDENCY-0014](../../pendencias.md) ([integracao-cadastro-mestre](../../../../docs/tecnico/arquitetura/integracoes/integracao-cadastro-mestre.md)).
- Sem mouse (leitor/atalhos).

## 5. Itens abertos ⬜

- **[PENDENCY-0019](../../pendencias.md)** — BR-1.4.4 (regra derivada): decidir entre **recebimento com validação pendente (fila de reenvio)** — hipótese do cen. 3 — e **bloqueio total** do recebimento enquanto a API do cadastro mestre estiver indisponível. Dono: **Operação/Oficina + Eng** · prazo **2026-11-07** (registro e detalhe no [hub de pendências](../../pendencias.md)).

---

**Verificação INVEST** ([guia ágil §1](https://github.com/fbso-techservice/platform-standards/blob/main/standards/process/guia-invest-enablers-spike.md)): **I** ✅ complementar à FEATURE-0001.0005, roda sobre leitura já existente · **N** ✅ contrato REST especificado (ver §4) · **V** ✅ consistência do inventário (R17/R22) · **E** ✅ 4 pontos (sem bloqueio de estimativa) · **S** ✅ cabe numa Sprint · **T** ✅ 4 cenários testáveis.
