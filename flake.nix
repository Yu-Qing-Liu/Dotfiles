{
  description = "My flake";
    
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-zoom.url = "github:NixOS/nixpkgs/06031e8a5d9d5293c725a50acf01242193635022";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    specialArgs = inputs;
    zoomPkgs = import inputs.nixpkgs-zoom {
      system = system;
      config.allowUnfree = true;
    };
  in {
  nixosConfigurations = {
    yuqingliu = lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs zoomPkgs; };
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.admin = import ./home/home.nix;
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
    };
  };
}
