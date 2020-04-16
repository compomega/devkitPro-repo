#!/bin/bash
# ./makepkg.sh PACKAGE [BRANCH]
set -e

# docker build --tag devkitpro-build:1.0 .
docker run -v "$PWD/any:/out" devkitpro-build:1.0 "$@"
