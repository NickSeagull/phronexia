{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    chicago95.url = "path:./desktop/themes/chicago95";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, chicago95, ... }@inputs: {
    nixosConfigurations.phronexia = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/phronexia/system-level.nix
        {
          environment.systemPackages = [ chicago95.defaultPackage.x86_64-linux ];
        }

        ./hosts/phronexia/hardware.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.users.nick = import ./hosts/phronexia/user-level.nix;
        }
        nixos-hardware.nixosModules.gpd-pocket-3
      ];
    };
  };
}
