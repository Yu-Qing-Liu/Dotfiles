{
  description = "My flake";
    
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:
  let
    system = "x86_64-linux";
    crossSystem = {
      system = "aarch64-linux";  # Target system (ARM64)
    };
    lib = nixpkgs.lib;
    specialArgs = inputs;
  in {
  nixosConfigurations = {
    yuqingliu = lib.nixosSystem {
      inherit system;
      crossSystem = crossSystem;
      specialArgs = { inherit inputs; };
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
