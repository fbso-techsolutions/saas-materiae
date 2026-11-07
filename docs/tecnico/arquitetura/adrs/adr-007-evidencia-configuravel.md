# ADR-007 — Evidência por imagem configurável + OCR opcional (object storage)

| Campo | Conteúdo |
|---|---|
| **Data / Status** | 2026-10-14 · **PROPOSTA** |
| **Contexto** | Evidências fotográficas comprovam estado do ativo em cada fase (Premissa 5). A obrigatoriedade varia por **cliente/modelo/fase/finalidade** — e a plataforma não pode impor a mesma bateria de fotos para todo mundo. LGPD pesa: foto pode conter ambiente/pessoas. |
| **Decisão** | Evidência por **imagem** com **política configurável** (quando é obrigatória, em qual fase, para qual finalidade) + **OCR opcional** (extração do serial impresso). Binários em **object storage** (MinIO/S3), com **URL assinada** e metadados no PostgreSQL. |
| **Justificativa** | 1) "Configuração acima de código" (Premissa 1) — a regra de obrigatoriedade é dado, não código; 2) object storage mantém o banco enxuto e escala a download; 3) URL assinada + RBAC evita exposto público de imagens; 4) OCR opcional dá valor (identificação assistida) sem virar dependência obrigatória. |
| **Consequências** | Política de evidência vira tabela/config por tenant (envelope de ADR-003); retenção/anonimização de imagem é pauta LGPD; custo de storage monitorado ([../devops.md](../devops.md)); OCR é *feature flag* por tenant. |
| **Alternativas rejeitadas** | **Evidência fixa em código** — reescrita por cliente; **fotos no banco (bytea)** — infla backup e performance; **OCR obrigatório** — dependência de serviço externo/ML pesada na Onda 1-Must (MVP mínimo). |
| **Rastreio** | Premissa 5, R59 · BRAINSTORM §2.3.1/§6.6 · entidade `EVIDENCIA` (mer.md) |
