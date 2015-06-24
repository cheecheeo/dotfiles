#!/usr/bin/env bash
set -x

mkdir -p $HOME/.nixpkgs/ &&
cp DOTnixpkgsSLASHconfig.nix $HOME/.nixpkgs/config.nix &&
nix-env --file $NIXPKGS --install all
