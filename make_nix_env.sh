#!/usr/bin/env bash
set -x

nix-env -q | sort > nix-env.log
