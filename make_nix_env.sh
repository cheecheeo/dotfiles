#!/usr/bin/env bash
set -ex

FILE=$HOME/packages/nixpkgs
if [[ -f "$FILE" ]]; then
    export NIXPKGS=${NIXPKGS:-$HOME/packages/nixpkgs}
else
    export NIXPKGS='<nixpkgs>'
fi

mkdir -p $HOME/.nixpkgs/ &&
cp DOTnixpkgsSLASHconfig.nix $HOME/.nixpkgs/config.nix &&
nix-env --file $NIXPKGS --install all &&

echo "Do you wish to install this graphical applications?" &&
select yn in "Yes" "No"; do
    case $yn in
        Yes) nix-env --file $NIXPKGS --install all-gui
             break;;
        No) break;;
    esac
done
