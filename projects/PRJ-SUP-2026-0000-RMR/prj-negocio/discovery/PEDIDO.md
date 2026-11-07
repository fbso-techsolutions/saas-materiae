
IDEIA DE PROJETO: SW Reciclagem e Reparo

- Problema: O sistema atual (solução de mercado) utilizado pela equipe de reciclagem para a gestão dos equipamentos que retornam de campo, está obsoleto e não possui integrações com os sistemas legados da SKY.
- Objetivos: Um software que permita registrar através do NDS os equipamentos retornados de campo e os processos pelos quais passaram para serem disponibilizados novamente ao mercado ou serem sucateados; gerar relatórios e dashboards. Totalmente integrado com os nossos sistemas legados.
- Solução:  Desenvolvimento interno de uma solução.
- R1: Permitir o controle de usuários (SKY e externos) e realizar configuração de telas que terão acesso dentro do sistema. 
- R2: Não deve ser permitido login simultâneo. 
- R3: Deve realizar inativação de usuários que não tiveram acesso após período parametrizado de dias. 
- R4: Solicitar troca periódica de senha para usuários ativos. 
- R5: Permitir reset de senha, enviando link para o usuário e notificando uma lista parametrizada de usuários SKY.
- R6: Permitir cadastro de defeito reclamado (teste inicial)
- R7: Permitir cadastro de defeito constatado (bancada de manutenção)
- R8: Permitir cadastro de local danificado
- R9: Permitir cadastro de causa raiz
- R10: Permitir cadastro de serviço executado
- R11: Permitir cadastro de sem conserto (sucata)
- R12: Permitir cadastro de serviço executado no HDD
- R13: Permitir cadastro de serviços de reciclagem (estética)
- R14: Permitir alterar o fluxo de permissões de serviço executado de acordo com o defeito constatado
- R15: Permitir cadastro de modelo de equipamento (código SAP, descrição, fornecedor e lei de formação do NDS)
- R16: Permitir cadastro de materiais e insumos (código SAP e descrição) Ex.: cabo HDMI, fonte, antena, etc.)
- R17: No processo de triagem, validar o NDS ou IMEI (CPEs) consultando o CSI
- R18: Classificar os serviços executados em níveis de reparo ou de reciclagem, de acordo com o fornecedor
- R19: Cadastro de blacklists (relação de NDSs que precisam ser identificados na triagem devido alguma particularidade)
- R20: Permitir que o material siga um workflow com as etapas: triagem > teste inicial > reparo (não obrigatório) > sucata (não obrigatório) > reciclagem > run in > embalagem > expedição. Em cada etapa deve registrar a leitura do NDS.
- R21: Etapa Triagem (onde é feita a identificação do item que retorna de campo): permitir o registro do NDS, modelo, nota fiscal, RDP (numeração de controle do sistema DLX da DHL).  
- R22: Etapa Triagem: validar na base do CSI o NDS/IMEI recebido.
- R23: Etapa Triagem: deve validar se o NDS/IMEI encontra-se black list, lista de scrap ou boomerang (contagem de retornos em determinado período).
- R24: Etapa Triagem: permitir a impressão de etiqueta (apenas 1 vez) com NDS e status do item.
- R25: Etapa Triagem: permitir que o item vá para uma das etapas seguintes: teste funcional ou sucata.
- R26: Etapa Teste Inicial: permitir o registro do defeito constatado.
- R27: Etapa Teste Inicial: permitir seguir para a etapa de Reparo, em caso de constatação de defeito, ou Reciclagem.
- R28: Etapa Reparo: permitir a abertura de OS para registro de informações da manutenção (data/hora inicio e fim da manutenção, técnico que executou o reparo, defeito constatado, local danificado, componente substituído, causa raiz, serviço executado ou motivo de não ter conserto).
- R29: Etapa Reparo: permitir que o equipamento siga para a etapa Reciclagem ou, no caso se sem conserto, siga para a Sucata.
- R30: Etapa Reciclagem: permitir o registro do serviço cosmético realizado, data/hora e operador.
- R31: Etapa Reciclagem: permitir seguir para o teste Run in.
- R32: Etapa Run in: permitir seguir para a embalagem se o equipamento passar nos testes ou retornar para as etapas Reparo ou Reciclagem.
- R33: Etapa Embalagem: permitir o registro de data/hora e operador que embalou o produto.
- R34: Etapa Embalagem: permitir a impressão de etiqueta final para o equipamento e para a embalagem (apenas 1 impressão)
- R35: Etapa Embalagem: permitir registrar o número do smart card e NDS/IMEI que foram embalados juntos.
- R36: Etapa Expedição: permitir a criação de pallet Id (código que lista todos os NDSs/IMEIs que compõem o pallet). O operador “abre um código do pallet id no sistema e lista (bipando ou carregando uma lista) os equipamentos que formam o pallet.
- R37: Etapa Expedição: permitir o registro data/hora e nota fiscal em que o equipamento foi expedido.
- R38: DLX: As informações coletadas na triagem (serializado ou não serializado, modelo, NDS/IMEI, quantidade) são carregadas on line no sistema DLX da DHL para composição da RDP.
- R39: APIs para recebimento das informações de fornecedores que não utilizam nosso sistema, atualmente o Assist. 
- R40: API do Recebimento: receber as informações de nota fiscal, código do material, quantidade, NDS, serial, data/hora
- R41: API da Linha de Reciclagem: receber as informações de tipo de teste, NDS, data/hora, aprovado (S/N), tipo de falha, scrap (S/N), motivo do scrap, nota fiscal de entrada, trocou tampa (S/N), trocou painel (S/N)
- R42: API do Laboratório: receber as informações de NDS, nome do técnico, data/hora, nota fiscal de entrada, part reference (componente trocado), defeito, local danificado, causa do defeito, serviço
- R43: API de Embalagem: registra NDS, número do smart card, data/hora, nota fiscal de entrada, fonte nova (S/N).
- R44: API de Expedição: registrar NDS, nota fiscal de saída, data da nota fiscal, sucata (S/N), código do material, serial, nota fiscal de entrada, quantidade.
- R45: API do Pallet ID: registrar nota fiscal, data de emissão da nota fiscal, código do material, NDS/IMEI para serializados.
- R46: APIs devem recusar informações inválidas (informações fora de ordem, informações fora da lei de formação
- R47: SAP: informar movimentação de estoque, entrada e saída de notas fiscais.
- R48: CSI: informar os NDS/IMEIs que retornam do campo, que são sucateados e que são expedidos.
- R49: Apresentar gráficos de triagem: pallets realizados, peças realizadas (serializados e não serializados) atualizados on line, da última hora, dia, semana ou mês.
- R50: Volume processado por etapa do processo atualizados on line, da última hora, dia, semana ou mês.
- R51: Aproveitamento por processo atualizados on line, da última hora, dia, semana ou mês.
- R52: Índice de consumo de insumos (tampas e painéis) atualizados on line, da última hora, dia, semana ou mês.
- R53: Estoques entre as etapas dos processos (teste inicial, reparo, reciclagem, etc.) consolidado e diferenciado por modelo e fabricante atualizados on line, da última hora, dia, semana ou mês.
- R54: Aproveitamento - % de reciclagem, reparo e sucata por modelo e por reparadora e consolidado atualizados on line, da última hora, dia, semana ou mês.
- R55: Extrair relatórios de todas as etapas do processo (ex.: triagem, sucata, reparo, etc.), podendo aplicar os filtros que sejam pertinentes a cada uma (ex.: data inicial e final, modelo, reparadora, etc.).
- R56: Campo para pesquisa rápida de NDS. Apresenta o histórico de movimentações do NDS.
- R57: Campo para pesquisa rápida de OS. Apresenta os defeitos apresentados, peças substituídas, causa raiz, data/hora do conserto, NDS, código do produto, motivo de sem conserto.
- R58: Permitir carregar layouts de etiquetas de acordo com o equipamento, fabricante e reparadora.
- R59: Limitar a impressão de etiquetas com o NDS para evitar duplicidade e trocas de etiquetas no processo. Permitir a reimpressão da etiqueta somente com liberação de senha de usuário com perfil especifico.

---

IDEIAS DE NOMES PARA O PROJETO / PRODUTO:
⚙️ Nomes Tecnológicos e Corporativos (Sérios e Modernos)
Se o sistema for um software para empresas (B2B) ou focado em eficiência industrial.
• Lifespan (Focado no tempo de vida do produto)
• ReFix
• MaintCycle
• Fix&Cycle
• Loop Gestão
• Integra RMR

Outras opções:
• EcoCiclo: Sistema Integrado de Reparo, Manutenção e Reciclagem.
• Sistema RMR: Plataforma de Gestão de Ciclo de Vida de Equipamentos.
• ReFix: Solução Inteligente para Manutenção e Descarte Sustentável.
• Renova Tech
• ReciclaMaint (Fusão de Reciclagem + Maintenance)
• Circula (ou Sistema Circula)
• Triagem: Reparo, Manutenção e Reciclagem (ou simplesmente Sistema RMR)
• Ciclo RMR
• Central RMR
• Portal de Restauração e Descarte (PRD)

• RMR Tech ( Reparo, Manutenção e Reciclagem Tecnologia)

---


1. Classificação Operacional e de Suprimentos: MRO
No ambiente corporativo e industrial, o conjunto de ações e insumos voltados ao reparo e à manutenção pertence à categoria de MRO (Manutenção, Reparo e Operação). Ele engloba os materiais e processos que garantem o funcionamento da empresa sem estarem diretamente integrados ao produto final. Suas divisões principais incluem:
• Manutenção de Ativos: Dividida estrategicamente em métodos como Corretiva (reparo após a falha), Preventiva (intervenções programadas) e Preditiva (antecipação de falhas baseada em dados).
• Suprimentos de Reparo: Ferramentas, peças de reposição, lubrificantes e EPIs necessários para executar as atividades de manutenção.
• Infraestrutura e Utilidades: Reparo e conservação predial e de sistemas de apoio (como redes elétricas e hidráulicas).

2. Classificação de Sustentabilidade e Ciclo de Vida: Logística Reversa
Quando o foco do reparo, da manutenção e da reciclagem é o retorno do produto ou material ao ciclo produtivo, o mercado os classifica dentro da Logística Reversa, um pilar fundamental da Economia Circular.
Nesse contexto, os sistemas são segmentados pelo nível de intervenção no produto:

Categoria no Mercado	Descrição do Processo	Relação com o Fabricante
Reparo / Conserto	Intervenção pontual para corrigir uma falha específica em um produto.	Geralmente feito por assistência técnica ou pelo próprio usuário.
Recondicionamento	O produto é limpo, avaliado e suas partes defeituosas são substituídas, podendo usar peças não originais.	Realizado por empresas terceiras.
Remanufatura	O produto industrial é completamente desmontado, restaurado e testado sob rígidos critérios equivalentes aos de um item novo.	Processo industrializado feito obrigatoriamente pelo fabricante original.
Reciclagem	Desintegração física ou química do produto pós-consumo para transformá-lo novamente em matéria-prima (insumo).	Dividida em mecânica (moagem e derretimento) ou química.

---

# GLOSSARIO

# vamos fazer um entendimento de termos  e troca se aplicavel:

- CSI: Sistema de Gesãto e Controle de Materiais Serializados, onde contem o controle unitario de cada material serializado que esta sob a gestão do time de supply chain
--> para efeito de solução vamos trocar CSI por "Sistema de Gesãto e Controle de Materiais Serializados" ( ou até um nome mais conhecido de mercado para facilitar o entendimento, pois a necessidade da nova solução é consultar nesse sistema se um material existe e pode ser incluido no processo de reciclagem, e depois esse sistema será informado que a reciclagem teve sucesso ou insucesso)

- SAP: Aqui o SAP funciona como o "Sistema de Materiais" (cadastra cada produto como um material) e como o "Sistema de Gestão de Centro de Estoque Avançados" onde cada parceiro possui um estoque de reciclagem que é um dos starts para o processo de reciclagem
--> para efeito de solução vamos trocar SAP por "Sistema de Materiais"  e "Sistema de Gestão de Centro de Estoque Avançados", e apontar cada um desses sistemas onde eles se aplicarem, sendo o foco permitir que a nova solução consulta materiais e atualize informações de materiais informando que aquele material foi reciclado com sucesso ou insucesso. O mesmo se aplica ao centro de estoque onde é necessário ações de "buscar material para reciclagem", "receber material para reciclagem", "devolver material reciclado com sucesso", "devolver material não reciclado - insucesso", entre outros cenarios.

- DLX/DHL: é o centro de reciclagem central da empresa, onde todos os materiais são recebidos e distribuidos para os parceiros em geral ( recicladores, retailers, vendors, mini-centros de distribuição, couriers, ... ). então vamos remover o DLX/DHL (fixo) para "Centro de Reciclagem Central"

- Veja se fazem sentido essas trocas  para tornar a ideação generalista, e pode sugerir nomes mais conhecidos mercadologicamente para essas referencias.

---

importante citar que existem:
- materiais serializados (decodificadores, modems, receptores, celulares, relogios, smartwatch, notebooks, desktops, tables, etc) que por sua caracteristicas são tratados unitariamente e forma serializada (unidade)
- materiais não serializados (antenas, cabos, parafusos, cabos de internet, cabos de tv, fios, lnbs, conectores, ... ) que por sua natureza são tratados como materiais não serializados, ou seja, não existe um código de material associado ao processo de transporte/reciclagem mas sim um apontamentos em unidade de medida (quantidade, metros, kilos, ...)

---

sistema de Reparo, Manutenção e Reciclagem de Ativos com Economia Circular via Logistica Reversa


---

### ⚙️ Arquitetura Funcional do Sistema

Esse grafico a seguir é uma ideia do ciclo do processo onde irá ser adicionada a possibilidade de venda de sucata e peças
```
[Ativo Fora de Uso] ──> (Logística Reversa: Coleta e Rastreamento) ──> [Centro de Triagem]
                                                                            │
                   ┌───────────────────────  Manter Valor ─────────────────┼─────────────────── Reciclar ──┐
                   ▼                                                       ▼                               ▼
         [ 1. Manutenção / Reparo ]                             [ 2. Remanufatura ]              [ 3. Reciclagem de Materiais ]
   (Correções pontuais e extensão de uso)                (Desmontagem e reconstrução de fábrica)       (Recuperação de matéria-prima)

```

---

O processo de manutenção e reparo vai ter a opção de venda de peças e sucata para minimizar o prejuizo
