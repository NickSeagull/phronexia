{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }@inputs: {
    nixosConfigurations.phronexia = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/phronexia/system-level.nix
        ./hardware/generated/gp3.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.users.nick = import ./system/phronexia/user-level.nix;
        }
        nixos-hardware.nixosModules.gpd-pocket-3
      ];
    };
  };
}
