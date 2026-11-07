# ADR-010 — Dois níveis de dado: Material (SKU) × Material Serializado (unidade)

| Campo | Conteúdo |
|---|---|
| **Data / Status** | 2026-10-14 · **PROPOSTA** |
| **Contexto** | O estoque de reparo mistura **itens por unidade** (modems, celulares — rastreio por serial) com **itens a granel** (componentes, insumos, peças — quantidade + unidade de medida). Um modelo único ou falharia no rastreio ou na quantidade. |
| **Decisão** | Modelo de **dois níveis**: `material` (**SKU** — o que é, regra de formação, fabricante) e `material_serializado` (**unidade** — o que existe fisicamente, com `trackingCode` + identificadores externos), mais **apontamento de não serializado** (quantidade + UoM) para o que não tem unidade rastreável. |
| **Justificativa** | 1) Rastreio por unidade só é possível separando identidade (SKU) de instância (unidade); 2) a lei de formação do código (R15) pertence ao SKU — regra uma vez, vale para todas as unidades; 3) apontamento por UoM cobre insumos sem forçar serialização artificial; 4) mesma base responde estoque de sucata/peças (value-recovery) e ativos em campo. |
| **Consequências** | Duas chaves de consulta por operação (SKU × unidade) — UX de busca rápida (R56/R57) deve aceitar ambos; relatórios precisam de projeção explícita (ADR-008); não serializado exige conferência por quantidade na triagem. |
| **Alternativas rejeitadas** | **Tabela única com flag** — degrada para colunas nulas e validações cruzadas frágeis; **serializar tudo** — inventário de insumos sem sentido de rastreio unitário. |
| **Rastreio** | R15, R21, R49 · BRAINSTORM §2.3/§8 · taxonomia de negócio: [taxonomia-entidades-cadastro-ativos](../../../negocio/taxonomia-entidades-cadastro-ativos.md) · diagrama: [erd.md](../erd.md) |
