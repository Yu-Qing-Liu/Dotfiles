#!/usr/bin/env bash

echo "Installing Nix..."
sh <(curl -L https://nixos.org/nix/install) --no-daemon

echo "Enabling experimental features for flakes..."
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

echo "Setting up Home Manager..."

if ! command -v home-manager &> /dev/null; then
  echo "Home Manager is not installed. Installing Home Manager..."
  nix profile install github:nix-community/home-manager
fi

echo "Configuring Home Manager with the flake..."
nix run .#home-manager switch

echo "Applying the Home Manager configuration..."
home-manager switch

echo "Nix and Home Manager setup completed!"
