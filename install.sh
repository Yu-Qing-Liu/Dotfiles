#!/usr/bin/env bash

DIR=$(pwd)
cp -f /etc/nixos/hardware-configuration.nix "$DIR"/nixos/

# Hypr Art
mkdir -p ~/.config/hypr/
cp ./home/programs/hypr/images/* ~/.config/hypr

# Compile
sudo nixos-rebuild switch --flake .
