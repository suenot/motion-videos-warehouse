#!/bin/sh
# Clone all project repos listed in repos.txt next to this file.
cd "$(dirname "$0")"
grep -v '^#' repos.txt | while read name url; do [ -d "$name" ] || git clone "$url" "$name"; done
