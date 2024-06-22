{ config, pkgs, ... }:

{
  imports = [
    ./developer-experience/default.nix
    ./modal-editing/default.nix
    ./spell-checking/default.nix
    ./version-control/default.nix
  ];

  programs.vscode = {
    enable = true;
    # package = pkgs.vscode;
  };
}