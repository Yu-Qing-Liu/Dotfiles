#!/usr/bin/env bash

DIR=$(pwd)
cp -f /etc/nixos/hardware-configuration.nix "$DIR"/nixos/

sudo nixos-rebuild switch --flake .
