# Changelog

## 2026-09-25 — v0.1.0-dev

### NBR 6028:2021
- adiciona `\\palavraschave` e `\\keywords` com separação por ponto e vírgula;
- atualiza a documentação interna do ambiente de resumo.

### NBR 10520:2023
- remove caixa alta automática das chamadas autor-data;
- configura abreviação para quatro ou mais autores;
- corrige desambiguação de autores homônimos;
- corrige chamadas por título de fontes sem autoria;
- atualiza comentário/layout de citações diretas longas.

### NBR 6023:2025
- passa a renderizar DOI como `https://doi.org/...`;
- adiciona matriz de auditoria e registra drivers ainda pendentes.

### Infraestrutura
- adiciona modelo de artigo atualizado;
- adiciona testes de regressão compiláveis;
- adiciona patches separados para `abntex2` e `biblatex-abnt`.
