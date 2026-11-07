# 📐 Regras de Formação dos Identificadores Físicos do Ativo e do NDS

| Campo | Valor |
|---|---|
| **Responde** | **PENDENCY-0012** ✅ respondida em 2026-10-21 (6/6) — [hub](../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md) |
| **Requisito** | **R15** — modelo de equipamento carrega a *lei de formação dos identificadores físicos e do NDS* · NDS = atributo de importação (§5.2 da [taxonomia](taxonomia-entidades-cadastro-ativos.md)) |
| **Dono** | **Suprimentos/TI** (face de negócio — Marcos Praia/Roberta Castro) |
| **Consumido por** | [taxonomia §5.1/§5.1.1](taxonomia-entidades-cadastro-ativos.md) (catálogo + mapeamento MODELO→IDs) · [FEATURE-0001.0003](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/features/FEATURE-0001.0003-cadastros-mestres.md) (BR-1.3.3) · [US-FEAT-0001.0003-0016](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/user-stories/US-FEAT-0001.0003-0016-cadastro-modelos-equipamento.md) · recebimento/triagem (leitura do identificador) |
| **Rastreio** | R15 · R17/R22 (validação no cadastro mestre) · R23 (watchlist) — regras de **formação**; validação de existência é [FEATURE-0001.0004](../../projects/PRJ-SUP-2026-0000-RMR/prj-produto/features/FEATURE-0001.0004-validacao-identificador-cadastro-mestre.md) |
| **Status** | ✅ **Consolidado em regra de negócio (2026-10-21)** — origem: rodada de pesquisa/validação da PENDENCY-0012 |

---

## 1. Conceito e precedência

- **Identificador Físico do Ativo:** o código **impresso ou presente no dispositivo** — é o campo único de leitura/digitação no recebimento, na triagem e na expedição. O sistema trata qualquer código lido de forma uniforme (catálogo na [taxonomia §5.1](taxonomia-entidades-cadastro-ativos.md)).
- **`identificador_unico`:** cada `ATIVO` guarda **um** identificador como **chave de rastreio** — o **primário** do seu modelo (§7). Demais códigos do aparelho ficam registrados junto ao item quando a operação exigir.
- **Precedência (decisão 2026-10-21):** a regra **válida** é a de **cada modelo/tipo/família de equipamento** (§3). Em qualquer divergência com um valor genérico, **a regra específica vence** — o genérico deste documento é o piso padrão.
- **NDS não é identificador:** é **atributo opcional** de importação (§6) — nunca entra no `identificador_unico`.
- **`MAC_ADDRESS` não é identificador nem atributo:** é **exigência de cross-validation** (§5) — campo obrigatório exigido em certos tipos, sem fazer parte do catálogo de identificadores nem do cadastro de atributos.

## 2. Catálogo de regras por tipo — matriz

| Tipo | Aplica-se a | Regra de tamanho/regex | Validação extra |
|---|---|---|---|
| `SERIAL` (S/N) | celulares (10–12) · decodificadores (10–14) · roteadores (11–14) · demais aparelhos | alfanumérico `[A-Z0-9]`, sem espaços/especiais — **largura por família (§3.1)** | cross: IMEI (celular), SMART_CARD/CAS (decod.), MAC (roteador) |
| `IMEI` | celulares | `^\d{15}$` | **Luhn (módulo 10)**; dual chip → 2 IMEIs |
| `SMART_CARD` | decodificadores de TV por assinatura | `^\d{12}$` — **só regex** (decisão 2026-10-21) | cross: SERIAL do decodificador + unicidade |
| `GPON_SN` | modems de fibra (ONU/ONT) | `^([A-Z]{4}[A-F0-9]{8}\|[A-F0-9]{16})$` | whitelist de 7 fabricantes + cross: `MAC_ADDRESS` |
| `CAS`/ID do Receptor | decodificadores parabólicos | `^[A-Z0-9]{11,14}$` | cross: SERIAL do hardware |
| `SCID`/`SCUAD` | decodificadores parabólicos (chip de segurança) | `^\d{11,12}$` | trinca obrigatória: SERIAL + SCID + CAID |
| `CAID` | decodificadores parabólicos (controlador) | `^[A-F0-9]{4}$` | trinca + whitelist opcional de certificadoras |
| `SAT_KIT_SN` | kits de internet satelital | `^(KIT\d{9}\|[A-Z0-9]{10,16})$` | cross por fabricante (§3.7) |
| `ICCID` | chips SIM | `^8955\d{15,16}$` | **Luhn**; paridade com IMSI |
| `IMSI` | chips SIM | `^724\d{12}$` | whitelist de MNC (operadoras BR) |

> A lista é **extensiva e configurável**: novos tipos entram como seed/configuração, sem mudança de estrutura ([taxonomia §5.1](taxonomia-entidades-cadastro-ativos.md)).

## 3. Regras por tipo (detalhe)

### 3.1 SERIAL (S/N) — por família de equipamento

**Geral:** string alfanumérica `[A-Z0-9]`, **sem caracteres especiais nem espaços**. A largura é definida **pela família** (precedência §1):

| Família | Largura | Regra adicional |
|---|---|---|
| **Celular** | **10–12** (`^[A-Z0-9]{10,12}$`) | Apple: 12 (antigos) ou 10 (novos, aleatórios); Samsung: majoritariamente 11. Aparelhos recentes **não usam** `O`, `I`, `Z` (confusão visual com `0`, `1`, `2`) — rejeitar/alertar em posições suspeitas. **Cross: IMEI obrigatório (§5)** |
| **Decodificador de TV** | **10–14** (`^[A-Z0-9]{10,14}$`) | comportamento padrão Claro/NET, Sky, Vivo, OiTV. **Cross: SMART_CARD (cabos/satélite convencional) ou CAS/SCID (satelitário) (§5)** |
| **Roteador** | **11–14** (`^[A-Z0-9]{11,14}$`) | Intelbras: majoritariamente 14 **numéricos** (rejeitar letras); TP-Link: 11–13. **Cross: `MAC_ADDRESS` obrigatório (§5)** |

> Largura **genérica** (demais aparelhos quando não há família específica): 8–22 caracteres — sempre confirmar a regra específica do modelo (§7).

### 3.2 IMEI (celulares)

- **Regex:** `^\d{15}$` — exatamente 15 dígitos numéricos.
- **Dígito verificador (obrigatório):** após a regex, submeter os 15 dígitos ao **algoritmo de Luhn (módulo 10)** — os 14 primeiros vêm da GSMA, o 15º é verificador matemático. Se não bater, **rejeitar a linha**.
- **Dual SIM:** `IMEI_1` **sempre obrigatório**; `IMEI_2` opcional (single SIM = nulo). Se preenchido, passa pelas mesmas validações. **`IMEI_1 ≠ IMEI_2`** na mesma linha (anti-fraude de repetição).
- **Higienização:** ler célula do Excel como **string pura** (evitar notação científica `3,51756E+14`); remover máscaras residuais (barras/hífens) antes da validação.

### 3.3 SMART_CARD (decodificadores de TV por assinatura)

- **Regex:** `^\d{12}$` — **apenas regex de 12 dígitos** (decisão 2026-10-21: **sem** dígito verificador módulo 10/11).
- **Higienização:** remover espaços/hífens de máscara (`0001 2345 6789` → `000123456789`); se higienizado tiver **9–11 dígitos**, completar com zeros à esquerda (`padStart(12,'0')`) — o Excel trunca zeros iniciais.
- **Cross-validation:** a linha **obriga** o `SERIAL` do decodificador associado (§5). **Unicidade unidirecional:** um SMART_CARD só está pareado com **um** decodificador ativo por vez — duplicidade no mesmo lote → rejeição da linha duplicada.

### 3.4 GPON_SN (modems de fibra — ONU/ONT)

- **Regex (única, cobre os dois formatos):** `^([A-Z]{4}[A-F0-9]{8}|[A-F0-9]{16})$`
  - **12 caracteres** (etiqueta): 4 letras maiúsculas (Vendor ID) + 8 hexadecimais — `HWTC1A2B3C4D`.
  - **16 caracteres** (legado/OLT): prefixo do fabricante convertido em ASCII-hex (`HWTC` → `48575443`) + 8 hex.
- **Whitelist de fabricantes (prefixo das 4 letras — formato 12):** rejeitar linha se o prefixo não constar:

  | Prefixo | Fabricante | Prefixo | Fabricante |
  |---|---|---|---|
  | `HWTC` / `HUAW` | Huawei | `TPLK` | TP-Link |
  | `ALCL` / `ALEF` | Nokia / Alcatel-Lucent | `ASKY` | Askey |
  | `ZTEG` / `ZXHN` | ZTE | `SACE` / `SAGM` | Sagemcom |
  | `INVP` / `INTL` | Intelbras | | |

- **Cross-validation:** `MAC_ADDRESS` **obrigatório** na mesma linha (§5). `SLID`/senha PLOAM: exigir **apenas se o provedor exigir** (ex.: Vivo).
- **Anti-dummy:** rejeitar sequências idênticas (`HWTC00000000`) ou preenchimentos em ordem de teclado.

### 3.5 CAS / ID do Receptor (decodificadores parabólicos)

- **Regex:** `^[A-Z0-9]{11,14}$` — mercado de receptores Ku/SAT HD Regional (Elsys, Century, Bedinsat, Vivensis, Intelbras).
- **Higienização:** caixa alta; remover espaços, hífens e pontos; se numérico com < 11 dígitos → `padStart(11,'0')`.
- **Cross-validation:** `SERIAL` do hardware **obrigatório** (linha sem serial → rejeitar). `SCID`/`CAID`, se preenchidos na mesma linha, devem respeitar o fabricante mapeado.
- **Anti-dummy:** rejeitar repetições idênticas ou ordinais de teclado.

### 3.6 SCID/SCUAD e CAID (decodificadores parabólicos)

- **SCID/SCUAD** (chip de segurança embarcado): `^\d{11,12}$` — zeros à esquerda preservados (`padStart(11|12,'0')` quando o Excel truncar para 9–10 dígitos).
- **CAID** (controlador — Nagravision, Verimatrix, Cisco/NDS): `^[A-F0-9]{4}$` (ex.: `5604`, `B000`) — caixa alta automática; **whitelist opcional** das certificadoras homologadas pelo consórcio SAT HD Regional.
- **Trinca obrigatória (cross-validation):** cada linha deve conter **SERIAL + SCID + CAID** — SCID sem CAID (ou vice-versa) → **rejeitar** (inconsistência impede ativação do sinal).

### 3.7 SAT_KIT_SN (internet satelital)

- **Regex:** `^(KIT\d{9}|[A-Z0-9]{10,16})$`
  - `KIT` + 9 dígitos: kit/clássico da **Starlink** (etiqueta da embalagem).
  - 10–16 alfanuméricos: seriais de antena (dish) e roteador mesh da Starlink, UTs e IDs da HughesNet/GSO.
- **Cross-validation por fabricante:**
  - **Starlink:** serial da **antena** e/ou do **roteador mesh** (10–12) vinculados à mesma ordem de distribuição (NDS).
  - **HughesNet:** exigir **`MAC_ADDRESS`** ou serial do rádio/conversor externo (SAN/Terminal ID do modem interno).
- **Higienização:** caixa alta; remover espaços ocultos, traços e barras. **Anti-dummy:** rejeitar `KIT000000000` e sequências lineares de teclado.

### 3.8 ICCID (chips SIM)

- **Regex:** `^8955\d{15,16}$` — prefixo indústria `89` + país `55` (Brasil) + 15/16 dígitos → total 19 ou 20 dígitos.
- **Dígito verificador (obrigatório):** **Luhn** sobre o número completo — falhou → rejeitar, mesmo com 20 dígitos.
- **Higienização:** coluna do Excel estritamente em **Texto** (evitar notação científica `8,955E+19`).

### 3.9 IMSI (chips SIM)

- **Regex:** `^724\d{12}$` — MCC do Brasil (`724`) + MNC da operadora + MSIN do assinante = 15 dígitos.
- **Whitelist de MNC (operadoras BR):** `724-02/03/04` TIM · `724-05/11/38` Claro · `724-06/10/31` Vivo · `724-54` Porto Seguro Conecta/MVNOs — `724` seguido de código fora da lista → **registro falso**.
- **Cross-validation:** ICCID ↔ IMSI na mesma linha (muitas vezes com MSISDN — número da linha com DDD).

## 4. Higienização padrão (pré-validação — vale para todos os tipos)

1. **Caixa alta** (`toUpperCase()`) — minúsculas digitadas em planilha.
2. **Trim e limpeza de ruído** — espaços, hífens, pontos, barras e rótulos copiados da etiqueta (`S/N:`, `GPON SN:`, `IMEI:`).
3. **Zeros à esquerda** — números longos vindos do Excel perdem zeros iniciais: completar até a largura mínima do tipo antes da regex (§3.3, §3.5, §3.6).
4. **Sem notação científica** — colunas de 15–20 dígitos lidas como string pura (§3.2, §3.8).
5. **Anti-dummy (todos os tipos)** — rejeitar sequências repetidas (`000…`, `111…`, `AAAA…`) ou ordinais de teclado (`1234567890`, `ABCDEFGHIJKLMN`).

## 5. Cross-validations obrigatórias (paridade de linha)

| # | Tipo base | Exige junto | Regra |
|---|---|---|---|
| 1 | `GPON_SN` | **`MAC_ADDRESS`** | campo **obrigatório** na mesma linha; regex MAC `^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$` — decisão 2026-10-21: exigência de cross-validation, não é identificador/atributo |
| 2 | `SERIAL` de **roteador** | **`MAC_ADDRESS`** | todo roteador tem MAC impresso ao lado do serial — linha sem MAC → rejeitar |
| 3 | `SERIAL` de **celular** | **`IMEI` (IMEI_1)** | celular sem IMEI → rejeitar; IMEI inválido (Luhn) invalida o SERIAL da linha |
| 4 | `SERIAL` de **decodificador** | `SMART_CARD` **ou** `CAS`/`SCID` | conforme tecnologia (cabo/satélite) — linha sem paridade → rejeitar |
| 5 | `SMART_CARD` | `SERIAL` do decodificador | unicidade: 1 smart card ↔ 1 decodificador ativo por vez |
| 6 | `CAS` | `SERIAL` do hardware | linha sem serial → rejeitar |
| 7 | `SCID` | `CAID` (+ `SERIAL`) | trinca completa obrigatória (§3.6) |
| 8 | `ICCID` | `IMSI` | paridade na mesma linha (chip = linha ativa) |

## 6. NDS — atributo de importação opcional

- **O que é:** identificador/número da autorização gerada no **Sistema NDS da Anvisa** (contexto Brasil — NPI/Duimp, mercadorias reguladas). **Não é identificador do ativo.**
- **Formato (quando preenchido):** `[PREFIXO_DISTRIBUIDOR]-[ANO/MES]-[SEQUENCIAL]` ou código de barras EAN/UCC-128 — alfanumérico, **máximo 32 caracteres**.
- **Comportamento:**
  - **Opcional** — aceita nulo/vazio; preencher **somente** quando aplicável (ativo importado; para mercadoria não regulada, deixar em branco).
  - Se preenchido, **vincula todos os identificadores físicos da mesma linha** (SERIAL, IMEI, GPON_SN…) ao mesmo **lote/caixa de distribuição externa** — é o agrupador logístico.
- **Onde encontrar:** espelho da Autorização de Importação (AI) no Portal NDSWeb da Anvisa; PDF da AI (com QR Code); histórico de peticionamento Anvisa.
- **Armazenamento:** fica em **`ATIVO.atributos`** (JSONB) — [taxonomia §5.2](taxonomia-entidades-cadastro-ativos.md) — nunca em `identificador_unico`.

## 7. Mapeamento MODELO → identificadores (ponte)

Definido em **[taxonomia §5.1.1](taxonomia-entidades-cadastro-ativos.md)** (decisão 2026-10-21):

- **`TIPO_IDENTIFICADOR`** (seed do catálogo): código, regex, largura, higienização e `cross_validations` por tipo (§2–§5).
- **`MODELO_IDENTIFICADOR`** (ponte): qual(is) identificador(es) o modelo usa — `obrigatorio`, **`primario`** (exatamente 1 por modelo) e `regex_override` (precedência §1).
- O **primário** do modelo alimenta o **`ATIVO.identificador_unico`** (validação no formato da §3).
- Herança: o modelo nasce com o conjunto padrão do seu **tipo/categoria** e pode ajustar por override.

## 8. Governança

- **Novos tipos/larguras:** entram como **seed/configuração** (`TIPO_IDENTIFICADOR`), sem mudança de estrutura.
- **Alteração de regra:** toda mudança neste documento passa por **Suprimentos/TI** (dono), é registrada no [hub de pendências](../../projects/PRJ-SUP-2026-0000-RMR/pendencias.md) (novo ID) e refletida na [taxonomia §5.1.1](taxonomia-entidades-cadastro-ativos.md) no mesmo passo.
- **Whitelists** (fabricantes GPON, MNC, certificadoras CAID): atualizáveis por configuração — quem mantém é Suprimentos/TI com apoio da área técnica.

## 9. Critérios de aceite (definition of done)

- [ ] Todo identificador lido/cadastrado passa pela regex da **família/modelo** correto (precedência §1 aplicada).
- [ ] IMEI e ICCID validados por **Luhn**; SMART_CARD só por regex de 12 dígitos.
- [ ] As **8 cross-validações** da §5 barram linha inconsistente antes de gravar.
- [ ] NDS aceito como vazio e, quando preenchido, vincula os identificadores da linha ao lote (§6).
- [ ] `identificador_unico` recebe apenas o **primário** do modelo (§7).
- [ ] Adicionar tipo/largura novo não exige mudança de estrutura (§8).
