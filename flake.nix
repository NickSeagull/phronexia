{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    chicago95.url = "path:./desktop/themes/chicago95";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, chicago95, ... }@inputs: {
    nixosConfigurations.phronexia =
      let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          overlays = [ self.overlays.default ];
        };
      in
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./hosts/phronexia/system-level.nix {inherit chicago95; })
          ./hosts/phronexia/hardware.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";
            home-manager.users.nick = import ./hosts/phronexia/user-level.nix { inherit chicago95; };
          }
          nixos-hardware.nixosModules.gpd-pocket-3
        ];
      };
  };
}
