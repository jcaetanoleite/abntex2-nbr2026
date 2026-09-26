# Changelog
## 2026-09-26 — v0.1.1-dev

### NBR 10520:2023
- torna `apud` itálico independentemente da revisão do `biblatex-abnt` instalada;
- adiciona regressão dedicada para `\apud`;
- atualiza os exemplos para `brazilian` e adiciona `csquotes`.

### Normas vigentes
- corrige a referência para ABNT NBR 14724:2024 Versão Corrigida:2025;
- registra TeX Live 2026 como ambiente corrente de integração contínua.

### Infraestrutura
- amplia o GitHub Actions para compilar dois documentos de regressão;
- verifica automaticamente as formas autor-data e a formatação de `apud`.

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
