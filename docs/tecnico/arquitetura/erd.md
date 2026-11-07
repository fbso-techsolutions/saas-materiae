# 🗺️ ERD — diagramas de entidade-relação

| Campo | Valor |
|---|---|
| **Papel** | Diagramas do modelo de dados — leitura visual; decisões de modelo em [mer.md](mer.md) · dicionário em [data-dictionary.md](data-dictionary.md) |
| **Fonte** | [taxonomia-entidades-cadastro-ativos](../../negocio/taxonomia-entidades-cadastro-ativos.md) (9 entidades de negócio — PENDENCY-0002 ✅) · dissolvido do SAD §3 (entidades de plataforma) · ADR-002 (RLS) · ADR-010 (dois níveis de dado) |
| **Status** | ✅ v1 (2026-10-21) · 🟡 correspondência `MATERIAL`/`MATERIAL_SERIALIZADO` × `MODELO`/`ATIVO` a confirmar ([mer.md §4](mer.md)) |

> **Convenção em todos os diagramas:** toda tabela de domínio tem `tenant_id` (FK → `TENANT`) + **RLS** ([ADR-002](adrs/adr-002-rls-multi-tenant.md)) — omitido nos blocos para legibilidade. PKs são `uuid` nas tabelas de operação e `int` (serial) nas *lookups* de seed, conforme a [taxonomia](../../negocio/taxonomia-entidades-cadastro-ativos.md).

## 1. Cadastro & catálogo (fonte da verdade do "que é" e do "que existe")

```mermaid
erDiagram
    STATUS_DESTINO {
        int id PK
        string codigo "MANUTENCAO_REPARO|RECONDICIONAMENTO|RECICLAGEM_DESCARTE"
        string nome
        int ordem
    }
    LINHA_EEE {
        int id PK
        string codigo "VERDE|MARROM|BRANCA|AZUL"
        string nome
        string cor
        boolean ativa
    }
    CATEGORIA_ATIVO {
        int id PK
        string codigo
        string nome
        int categoria_pai_id FK "autorelação: categoria→tipo"
        int linha_id FK
        int nivel "1=categoria 2=tipo"
        jsonb caracteristicas "atributos aplicáveis ao tipo"
        boolean ativa
        int ordem
    }
    MODELO {
        int id PK
        int categoria_id FK
        string nome
        string fabricante
        boolean possui_midia_armazenamento "base BR-5.5.3"
        jsonb caracteristicas
        boolean ativo
    }
    ATIVO {
        uuid id PK
        string identificador_unico "chave de rastreio (§5.1)"
        jsonb atributos "cor, marca, NDS... (§5.2)"
        int categoria_id FK
        int modelo_id FK
        int linha_id FK "derivada da categoria"
        int status_destino_id FK
        date data_recebimento
        uuid created_by
    }
    TIPO_IDENTIFICADOR {
        int id PK
        string codigo "SERIAL|GPON_SN|IMEI..."
        string regex
        int tamanho_min
        int tamanho_max
        jsonb higienizacao
        jsonb cross_validations
        boolean ativa
    }
    MODELO_IDENTIFICADOR {
        int modelo_id FK
        int tipo_identificador_id FK
        boolean obrigatorio
        boolean primario "exatamente 1 por modelo"
        string regex_override "modelo vence genérico"
    }
    KIT {
        uuid id PK
        string tipo_kit "KIT_ATIVACAO_TV|KIT_SATELITAL"
        string status "ATIVO|DISMEMBRADO"
        timestamptz data_criacao
        uuid created_by
    }
    KIT_ITEM {
        uuid id PK
        uuid kit_id FK
        uuid ativo_id FK
        string papel "decodificador|smart card|antena..."
        timestamptz data_entrada
        timestamptz data_saida
        string motivo_saida
    }
    FRACAO_MATERIAL {
        int id PK
        string codigo
        string nome
        string grupo "PCI|METAL|POLIMERO|PERIGOSO"
        boolean perigoso
        string unidade "kg"
        boolean ativa
    }
    FRACAO_RETIRADA {
        uuid id PK
        uuid ativo_id FK "ou lote_id"
        uuid lote_id FK
        int fracao_id FK
        numeric peso_kg
        timestamptz data_hora
        string operador
        string destino "venda|destinação certificada"
    }

    LINHA_EEE ||--o{ CATEGORIA_ATIVO : "agrupa"
    CATEGORIA_ATIVO ||--o{ CATEGORIA_ATIVO : "categoria→tipo"
    CATEGORIA_ATIVO ||--o{ MODELO : "classifica"
    CATEGORIA_ATIVO ||--o{ ATIVO : "tipifica"
    MODELO ||--o{ ATIVO : " instancia"
    STATUS_DESTINO ||--o{ ATIVO : "direciona"
    MODELO ||--o{ MODELO_IDENTIFICADOR : "herda/valida"
    TIPO_IDENTIFICADOR ||--o{ MODELO_IDENTIFICADOR : "define"
    KIT ||--o{ KIT_ITEM : "compõe"
    ATIVO ||--o{ KIT_ITEM : "compõe"
    ATIVO ||--o{ FRACAO_RETIRADA : "gera (pós-desmontagem)"
    FRACAO_MATERIAL ||--o{ FRACAO_RETIRADA : "classifica"
```

> `TIPO_IDENTIFICADOR` + `MODELO_IDENTIFICADOR` são **Onda 2-Should (MVP completo)** (DDL no rolling wave da FEATURE-0001.0003 — [taxonomia §5.1.1](../../negocio/taxonomia-entidades-cadastro-ativos.md)). `KIT`/`KIT_ITEM` e `FRACAO_*` nascem **com estrutura na Onda 1-Must (MVP mínimo)** (seeds recebidos), uso posterior — [taxonomia §5.3/§6/§7](../../negocio/taxonomia-entidades-cadastro-ativos.md).

## 2. Operação & workflow (o "work")

```mermaid
erDiagram
    WORKFLOW_DEF {
        uuid def_id PK
        uuid tenant_id FK
        string nome
        jsonb estagios
        jsonb transicoes
    }
    STAGE_TRANSITION {
        uuid transicao_id PK
        uuid tenant_id FK
        uuid unidade_id FK
        string de_estagio
        string para_estagio
        uuid ator_id
        timestamptz ocorrido_em
        string local
    }
    WORK_ORDER {
        uuid os_id PK
        uuid tenant_id FK
        uuid unidade_id FK
        uuid tecnico_id
        timestamptz inicio
        timestamptz fim
        uuid defeito_id
        uuid causa_raiz_id
        uuid servico_id
    }
    EVIDENCIA {
        uuid evidencia_id PK
        uuid tenant_id FK
        uuid unidade_id FK
        string tipo "foto|ocr"
        string storage_uri
        string status_validacao "pendente|ok|divergente"
    }
    LABEL_PRINT {
        uuid print_id PK
        uuid tenant_id FK
        uuid unidade_id FK
        string tipo "triagem|final"
        timestamptz impresso_em
        uuid operador_id
    }
    WATCHLIST {
        uuid item_id PK
        uuid tenant_id FK
        uuid unidade_id FK
        string tipo "blacklist|scrap|boomerang"
    }

    WORKFLOW_DEF ||--o{ STAGE_TRANSITION : "valida transição"
    MATERIAL_SERIALIZADO ||--o{ STAGE_TRANSITION : "movimenta"
    MATERIAL_SERIALIZADO ||--o{ WORK_ORDER : "reparado"
    MATERIAL_SERIALIZADO ||--o{ EVIDENCIA : "evidencia"
    MATERIAL_SERIALIZADO ||--o{ LABEL_PRINT : "etiqueta"
    MATERIAL_SERIALIZADO ||--o{ WATCHLIST : "listado"
```

> **`MATERIAL_SERIALIZADO`** é o ponto de encontro entre os diagramas 1 e 2 — a unidade física (`ATIVO` no vocabulário da taxonomia). Relação exata entre os dois nomes: [mer.md §4](mer.md) (🟡 a confirmar). `unidade_id` nas tabelas de operação referencia a chave da unidade.

## 3. Tenancy & integração (plataforma)

```mermaid
erDiagram
    TENANT {
        uuid tenant_id PK
        string nome
        string slug
        jsonb config "workflow, aliases, politica_evidencia"
        string status "active|suspended"
    }
    APONTAMENTO_NAO_SERIALIZADO {
        uuid apontamento_id PK
        uuid tenant_id FK
        uuid material_id FK
        numeric quantidade
        string uom "un, m, kg, L"
    }
    INTEGRATION_EVENT {
        uuid evento_id PK
        uuid tenant_id FK
        string direcao "in|out"
        string sistema "mestre|materiais|wms|hub|parceiro"
        string status "pendente|enviado|falha"
        string idempotency_key
    }

    TENANT ||--o{ MATERIAL : "possui (SKU)"
    TENANT ||--|| WORKFLOW_DEF : "configura"
    MATERIAL ||--o{ APONTAMENTO_NAO_SERIALIZADO : "apontado"
    TENANT ||--o{ INTEGRATION_EVENT : "integra"
```

> `INTEGRATION_EVENT` materializa o padrão **Outbox/Inbox + idempotência** do [ADR-004](adrs/adr-004-acl-outbox.md); detalhe do mapeamento com sistemas externos em [datamapping.md](datamapping.md).

## 4. Legenda & leitura

| Item | Significado |
|---|---|
| `int id` (serial) | *Lookup*/seed — cadastro pequeno e estável |
| `uuid id` | Entidade operacional — geração no app, sem sequência exposta |
| `jsonb` | Config/lista extensível (sem mudança de estrutura — princípio da taxonomia) |
| 🔵 **Onda 2-Should (MVP completo) / Onda 2-Should (MVP completo)** | Tabela nasce com estrutura na Onda 1-Must (MVP mínimo); uso/DDL completo em fase posterior |
| Omissão de `tenant_id` | Presente em todas as tabelas de domínio (RLS — ADR-002) |

**Ordem de leitura sugerida:** [mer.md](mer.md) (decisões e restrições) → este ERD → [data-dictionary.md](data-dictionary.md) (campos) → [datamapping.md](datamapping.md) (sistemas externos).
