#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT/tests"
export TEXINPUTS="$ROOT/latex:${TEXINPUTS:-}:"
latexmk -pdf -interaction=nonstopmode citations.tex >/dev/null
pdftotext citations.pdf citations.txt
for expected in \
  '(Silva, 2024)' \
  '(Souza; Lima, 2022)' \
  '(Souza; Lima; Costa, 2023)' \
  '(Amaral et al., 2021)' \
  '(Anteprojeto [...], 1987)' \
  '(A flor [...], 1995)' \
  '(O Guarani, 1857)'
do
  grep -F "$expected" citations.txt >/dev/null || { echo "FALHOU: $expected"; exit 1; }
done
echo 'OK: testes essenciais passaram.'
