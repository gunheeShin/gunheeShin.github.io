#!/usr/bin/env bash
# Build cv.pdf from cv.html using headless Chrome.
set -euo pipefail

cd "$(dirname "$0")"

google-chrome \
  --headless \
  --disable-gpu \
  --no-pdf-header-footer \
  --virtual-time-budget=10000 \
  --print-to-pdf=cv.pdf \
  "file://$PWD/cv.html"

echo "Built: $PWD/cv.pdf"
