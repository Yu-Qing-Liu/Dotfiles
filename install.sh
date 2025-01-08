#!/usr/bin/env bash

if [ -e "$HOME/.config/gtk-3.0" ]; then 
  rm -f "$HOME/.config/gtk-3.0/settings.ini"
fi

if [ -e "$HOME/.config/gtk-4.0" ]; then 
  rm -f "$HOME/.config/gtk-4.0/settings.ini"
fi

DIR=$(pwd)
cp -f /etc/nixos/hardware-configuration.nix "$DIR"/nixos/

# Hypr Art
mkdir -p ~/.config/hypr/
cp ./home/programs/hypr/images/* ~/.config/hypr

# Compile
sudo nixos-rebuild switch --flake .
