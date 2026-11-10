# `scripts/` — utilitários do produto

Scripts de apoio do RMR: verificação da matriz de rastreabilidade e do hub de pendências.

| Script | O que verifica |
|---|---|
| `check-rastreabilidade.sh` | integridade da matriz (links, 1:1 épicos/features, stories→feature) |
| `check-pendencias.sh` | urgência do hub de pendências |

> Esses scripts verificam **padrões definidos na platform-standards** (guia de rastreabilidade, convenções de pendências), mas referenciam **caminhos específicos do repo**, por isso vivem aqui — são a **aplicação local** das regras. Se vários repos precisarem das mesmas checagens, extraímos uma versão genérica para `platform-standards/scripts/` com caminhos parametrizados.
