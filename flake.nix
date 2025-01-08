{
  description = "My flake";
    
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ...}: 

  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
  in {
  nixosConfigurations = {
    yuqingliu = lib.nixosSystem {
      inherit system;
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.admin = import ./home/home.nix;
          }
        ];
      };
    };
  };
}
