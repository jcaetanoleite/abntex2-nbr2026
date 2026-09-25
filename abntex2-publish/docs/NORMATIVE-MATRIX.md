# Matriz normativa da atualização

Esta matriz separa implementação técnica, testes e pontos ainda pendentes. Ela
não reproduz o texto das normas e não substitui a consulta às edições oficiais.

| Norma | Tema | Estado nesta rodada | Evidência/teste |
|---|---|---|---|
| NBR 6022:2018 | Estrutura do artigo | Mantida | O upstream já usa 6022:2018 no modelo de artigo; novo modelo migra bibliografia para `biblatex`/`biber`. |
| NBR 6028:2021 | Resumo em parágrafo único | Documentado | Modelo e comentários da classe. Não há reescrita automática do texto. |
| NBR 6028:2021 | Palavras-chave após o resumo, `:` + `;` + ponto final | Implementado | `\\palavraschave`, `\\keywords`; regressão textual. |
| NBR 6028:2021 | Caixa das palavras-chave | Preservada | Classe não força minúsculas para não corromper nomes próprios/científicos. |
| NBR 10520:2023 | Autor em caixa alta/baixa na chamada | Implementado | `(Silva, 2024)`. |
| NBR 10520:2023 | Dois e três autores | Implementado | `(Souza; Oliveira, 2023)` e `(Costa; Lima; Pereira, 2022)`. |
| NBR 10520:2023 | Quatro ou mais autores | Implementado como padrão abreviado | `(Amaral et al., 2021)`. A norma também permite listar todos, desde que consistente. |
| NBR 10520:2023 | Pessoa jurídica | Implementado | Entidade em caixa mista; siglas preservadas quando fornecidas como sigla. |
| NBR 10520:2023 | Fonte sem autoria | Implementado com fallback | Primeira palavra; artigo/monossílabo comum + palavra seguinte; `shorttitle` para exceções. |
| NBR 10520:2023 | Mesmo sobrenome + mesmo ano | Implementado | Iniciais primeiro; prenome completo se necessário. |
| NBR 10520:2023 | Mesma autoria + mesmo ano | Implementado | Letras `a`, `b`, ... após a data. |
| NBR 10520:2023 | Citação direta longa | Implementado no layout existente | Corpo reduzido, espaço simples e recuo configurável; 4 cm mantido como padrão recomendado. |
| NBR 10520:2023 | Localização em fonte não paginada | Já suportada pelo modelo de pós-nota | O autor informa `cap.`, `art.`, localização etc. no argumento de citação; não é inferido. |
| NBR 6023:2025 | DOI como endereço resolvível | Implementado | `DOI: https://doi.org/...`. |
| NBR 6023:2025 | URL e data de acesso para documento online | Suportado pelo driver existente | Depende de `url` e `urldate` no `.bib`. |
| NBR 6023:2025 | Artigos com e-locator | Já suportado | Campo `eid`. |
| NBR 6023:2025 | Livros/capítulos/artigos usuais | Herdado do `biblatex-abnt` + auditoria básica | Necessita bateria exaustiva antes de declarar conformidade total. |
| NBR 6023:2025 | Podcast/documento sonoro | Pendente de driver específico | Hoje cai em tipos genéricos do `biblatex-abnt`. |
| NBR 6023:2025 | Rede social | Pendente de driver específico | Ainda não certificado. |
| NBR 6023:2025 | Software/dataset | Pendente de driver específico | Ainda não certificado. |
| NBR 6023:2025 | Jurídico/patente/cartografia/iconografia/audiovisual | Parcial/herdado | Requer comparação exemplo a exemplo com a edição 2025. |
| NBR 14724:2024 | TCC, dissertação e tese | Fora do escopo desta rodada | Deve ser uma segunda frente, separada do perfil artigo. |

## Decisões de projeto

O backend bibliográfico recomendado passa a ser `biblatex` + `biber`. O
`abntex2cite`/BibTeX clássico deve permanecer apenas por compatibilidade de
legado; não é a camada em que vale a pena implementar novas regras.

O algoritmo de título sem autoria cobre os casos usuais em português e aceita
`shorttitle` como override. Isso evita tentar transformar uma regra linguística
em uma heurística infalível de TeX para todos os idiomas.

## Pendência prioritária seguinte

A próxima rodada deve construir fixtures independentes para cada tipo de
referência da NBR 6023:2025 e só depois promover a versão de `v3.5-dev` para um
release com alegação de conformidade mais ampla.
