{ config, pkgs, ... }:

{
      nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "root" "nick" ];
  nixpkgs.config.allowUnfree = true;
}
