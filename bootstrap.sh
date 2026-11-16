#!/bin/sh
# Fetch every source repo (git submodules). Safe to re-run; also pulls their latest commits with --remote.
cd "$(dirname "$0")"
git submodule update --init --recursive "$@"
