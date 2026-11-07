# ADR-011 — Motor de Recuperação de Valor: decisão determinística por rota + venda de peças/sucata

| Campo | Conteúdo |
|---|---|
| **Data / Status** | 2026-10-14 · **PROPOSTA** |
| **Contexto** | A "Regra dos 40%" (B-REQ-02) evoluiu: o destino do ativo não é só reparo × descarte — há **remanufatura, desmanche, reciclagem, descarte ecológico** e **venda de peças/sucata** (B-REQ-09/10, Premissa 7). A decisão precisa considerar valor recuperável por rota e travas (LGPD, ambiental). |
| **Decisão** | **Motor de Recuperação de Valor** com decisão **determinística por rota**: dado o estado do ativo (defeito, testes, idade, custo de peça), o motor calcula o **valor recuperável de cada rota possível** e recomenda a de maior valor **respeitando travas** (dano irreparável → descarte ecológico; mídia com PII → sanitização certificada, por wipe lógico ou destruição física). Peças/sucata aprovadas viram estoque e vão ao **RMR Market** (venda). |
| **Justificativa** | 1) Determinístico = auditável e explicável ao operador (por que essa rota?); 2) valor financeiro (não só % de corte) alinha reciclagem a resultado; 3) travas como *hard constraints* impedem "valorizar" sobre obrigação legal; 4) configurável por cliente (preços, critérios) no envelope do ADR-003. |
| **Consequências** | Tabela de preços/custos por material precisa de dono de dados (Suprimentos); motor precisa de simulação/backtest com dados reais antes do go-live; decisão alimenta watchlist (scrap) e reporting. |
| **Alternativas rejeitadas** | **Regra fixa de %** — não varia por valor de mercado nem por modelo; **decisão 100% humana** — lenta e inconsistente entre turnos (mantém-se humano como *override* justificado). |
| **Rastreio** | B-REQ-02/09/10, Premissa 7 · BRAINSTORM §2.6/§10 · LLD previsto do motor de recuperação de valor (sob demanda — ver [../integracoes/integrations.md](../integracoes/integrations.md) §1 e backlog) |
