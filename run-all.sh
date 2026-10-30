#!/bin/sh
# Run every parser (regular refresh). Extra args pass through, e.g. --limit 5
cd "$(dirname "$0")"
for d in mvw-parser-*; do ./$d/run.sh "$@"; done
