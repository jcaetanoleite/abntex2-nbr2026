# abntex2-nbr2026

Camada experimental e **não oficial** para usar o ecossistema abnTeX2 com as
edições mais recentes das normas ABNT relevantes para artigos acadêmicos.

## Escopo

Esta primeira versão concentra-se no perfil de artigo científico:

- ABNT NBR 6022:2018 — artigo em publicação periódica técnica e/ou científica;
- ABNT NBR 6028:2021 — resumo e palavras-chave;
- ABNT NBR 10520:2023 — citações;
- ABNT NBR 6023:2025 — referências.

A ABNT NBR 14724:2024 Versão Corrigida:2025, voltada a trabalhos acadêmicos como TCCs, dissertações e
teses, ficará para uma etapa própria.

> **Estado:** `v0.1.1-dev`. A camada foi compilada e testada, mas ainda não
> declara conformidade integral com todos os modelos bibliográficos da NBR
> 6023:2025. Consulte `docs/NORMATIVE-MATRIX.md`.

## Uso mais simples — inclusive no Overleaf

Baixe os três arquivos da pasta `latex/` e coloque-os na mesma pasta do seu
arquivo `.tex`:

- `abntex2-nbr2026.sty`
- `abnt-nbr2026.cbx`
- `abnt-nbr2026.bbx`

Depois use:

```tex
\documentclass[article,11pt,oneside,a4paper,brazilian]{abntex2}

\usepackage{csquotes}
\usepackage{abntex2-nbr2026}
\usepackage[
  backend=biber,
  style=abnt-nbr2026,
  citestyle=abnt-nbr2026
]{biblatex}
\addbibresource{referencias.bib}
```

Para palavras-chave:

```tex
\begin{resumoumacoluna}
Texto do resumo em um único parágrafo.
\palavraschave{economia política; democracia; desenvolvimento}
\end{resumoumacoluna}
```

Em inglês:

```tex
\keywords{political economy; democracy; development}
```

Um modelo completo está em `examples/artigo-abnt-2026.tex`.

## O que muda

### NBR 6028:2021

A camada acrescenta `\palavraschave` e `\keywords`, com rótulo, dois-pontos,
separação por ponto e vírgula e ponto final. A caixa dos termos não é alterada,
para preservar nomes próprios e científicos.

### NBR 10520:2023

O estilo `abnt-nbr2026` altera o fluxo autor-data do `biblatex-abnt` para, entre
outros casos testados:

- `(Silva, 2024)` em vez de sobrenome automaticamente em caixa alta;
- até três autores exibidos na chamada;
- quatro ou mais autores com primeiro autor + *et al.*;
- desambiguação progressiva de homônimos;
- `2020a`, `2020b` para mesma autoria e mesmo ano;
- fontes sem autoria pela entrada do título, como `(Anteprojeto [...], 1987)`.

O ambiente `citacao` continua usando o comprimento público
`\ABNTEXcitacaorecuo`; o valor histórico de 4 cm permanece configurável.

### NBR 6023:2025

Nesta rodada, o DOI é apresentado como endereço resolvível:

```text
DOI: https://doi.org/10....
```

A auditoria completa dos drivers bibliográficos ainda está em andamento. Não é
correto afirmar, nesta versão, que todos os tipos documentais da NBR 6023:2025
estão cobertos.

## Arquitetura

Este repositório **não substitui nem se apresenta como uma nova versão oficial
do abnTeX2**. Ele adiciona uma camada com nomes próprios:

```text
latex/
  abntex2-nbr2026.sty  extensão da classe abntex2
  abnt-nbr2026.cbx     estilo de citações sobre biblatex-abnt
  abnt-nbr2026.bbx     estilo de referências sobre biblatex-abnt
```

Isso permite testar as mudanças sem redistribuir arquivos oficiais modificados
com os mesmos nomes. A pasta `patches/` contém, separadamente, os diffs pensados
para futuras contribuições aos projetos upstream.

## Testes

A regressão cobre, entre outros casos:

- um, dois e três autores;
- quatro ou mais autores;
- obras sem autoria;
- títulos iniciados por artigo;
- homônimos no mesmo ano;
- homônimos com a mesma inicial;
- mesma autoria e mesmo ano.

O workflow em `.github/workflows/latex.yml` recompila os testes no GitHub
Actions.

## Relação com os projetos oficiais

Projetos upstream:

- https://github.com/abntex/abntex2
- https://github.com/abntex/biblatex-abnt

Este projeto é experimental e independente. O objetivo é testar as mudanças e,
quando suficientemente auditadas, preparar contribuições separadas para os
dois projetos oficiais.

## Licença

LPPL 1.3c ou posterior. Os projetos upstream preservam seus próprios direitos
autorais e avisos de licença. Ver `LICENSE`.
