#!/usr/bin/env bash

# A rebuild script that commits on a successful build
set -e

# cd to your config dir
pushd ~/nixconf/

# Autoformat your nix files
alejandra . &>/dev/null \
  || ( alejandra . ; echo "formatting failed!" && exit 1)

# Shows your changes
git diff -U0 '*.nix'

echo "NixOS Rebuilding..."

# Rebuild, output simplified errors, log trackebacks
sudo nixos-rebuild switch --flake .#$(hostname) &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep True)

# Commit all changes witih the generation metadata
git commit -am "$current"

# Back to where you were
popd
