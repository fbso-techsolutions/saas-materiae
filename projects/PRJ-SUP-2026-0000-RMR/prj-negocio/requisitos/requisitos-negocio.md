# 📋 Requisitos de Negócio (B-REQ)

> **Origem:** migrado do [PRD §3](../../PRD.md) em 2026-10-16 — preenchido colaborativamente pelas áreas na rodada de negócios.
> **Esta é a fonte canônica das B-REQ.** Rastreabilidade: [mapeamento de épicos e features](../../prj-produto/rastreabilidade.md).

| ID | Necessidade de Negócio | Por que isso importa | Prioridade | Quem precisa? |
|----|------------------------|----------------------|------------|---------------|
| B-REQ-01 | Cadastro Simplificado de Ativos de TI | Todo ativo a ser controlado pelo novo sistema precisa estar categorizado. | Alta (MVP) | Suprimentos / TI |
|  | ↳ *Taxonomia e estrutura de entidades* (3 eixos, 9 entidades — **PENDENCY-0002 respondida**) | [taxonomia-entidades-cadastro-ativos.md](../../../../docs/negocio/taxonomia-entidades-cadastro-ativos.md) | — | — |
|  | ↳ *Regras de formação dos identificadores físicos e do NDS* (R15 — **PENDENCY-0012 respondida**) | [regras-formacao-identificadores.md](../../../../docs/negocio/regras-formacao-identificadores.md) | — | — |
| B-REQ-02 | Motor Financeiro de Triagem (Regra dos 40%) | Decidir automaticamente se o ativo vai para reparo ou descarte ecológico. | Alta (MVP) | Suprimentos |
| B-REQ-03 | Estoque Virtual de Reuso | Compradores precisam consultar o que está disponível para evitar novas compras. | Alta (MVP) | Compradores |
| B-REQ-04 | Rastreabilidade de Baixa Patrimonial Contábil | Quando um ativo vai para reciclagem/descarte definitivo, a Contabilidade precisa dar baixa no ativo imobilizado para evitar pagamento de impostos indevidos. | Alta (MVP) | Finanças / Controladoria |
| B-REQ-05 | Termo de Destruição Segura de Dados (LGPD) | Equipamentos que vão para reciclagem externa precisam de um certificado anexado que comprove a sanitização da mídia (wipe lógico ou destruição física), com o método registrado, para evitar vazamento de dados. | Alta (MVP) | Jurídico / Compliance |
| B-REQ-06 | Abertura de Triagem via Chamado de Troca | O técnico de suporte, ao diagnosticar que um notebook quebrou e precisará de substituição, deve conseguir enviar o ativo para a triagem do sistema com 1 clique. | Alta (MVP) | Service Desk (Suporte) |
| B-REQ-07 | Consulta de Ativos Disponíveis para Swap (Troca) | Antes de abrir uma requisição de máquina nova para um usuário, o Service Desk precisa consultar o estoque de reuso para realizar o atendimento rápido. | Média (Onda 3-Could (Integração & Valor)) | Service Desk (Suporte) |
| B-REQ-08 | Fluxo de Recebimento e Posse do Ativo Recuperado | Quando a oficina conserta o ativo, o Service Desk precisa dar o "aceite" físico e sistêmico para reincorporar a máquina no estoque de atendimento diário. | Média (Onda 3-Could (Integração & Valor)) | Service Desk (Suporte) |
| B-REQ-09 | Venda de Peças e Sucata (Recuperação de Valor) | Quando o reparo não compensa, o ativo é desmontado; peças boas viram **estoque de peças** (reuso ou venda) e o restante vira **sucata** (venda por material) — para **minimizar o prejuízo** da quebra. | Alta (MVP: registro) / Média (venda: Onda 3-Could (Integração & Valor)) | Suprimentos / Comercial / Finanças |
| B-REQ-10 | Motor de Recuperação de Valor (evolução da Regra dos 40%) | Decidir entre reparo × remanufatura × desmanche × reciclagem × descarte considerando o **valor recuperável** de cada rota (inclui receita de peças/sucata). | Alta (MVP) | Suprimentos |

> 💡 Esta tabela é preenchida **colaborativamente pelas áreas** para mapear as necessidades reais.

## Template (copiar ao adicionar nova B-REQ)

| ID | Necessidade de Negócio | Por que isso importa | Prioridade | Quem precisa? |
|----|------------------------|----------------------|------------|---------------|
| B-REQ-xx | necessidade | importancia | prior | quem |

## Controle

| Item | Valor |
|---|---|
| Total | **10 B-REQs** (01–10) · **7 Alta-MVP** (01–06, 10) · **1 híbrida** (09: Alta no registro / Média na venda) · **2 Média-Onda 3-Could (Integração & Valor)** (07, 08) |
| Rastreabilidade | [mapeamento de épicos](../../prj-produto/rastreabilidade.md) — **B-REQ-04** → FEATURE-0005.0006 (Onda 2-Should (MVP completo), sem card) · **B-REQ-05** → [FEATURE-0005.0005](../../prj-produto/features/FEATURE-0005.0005-travas-lgpd-compliance.md) |
| Evolução | Nova B-REQ? Adicionar aqui, atualizar o mapeamento (se virar escopo) e o [PRD §6.2](../../PRD.md) |
