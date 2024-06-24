{ config, pkgs, ... }:

{
  imports = [
    ./modal-editing/default.nix
    ./appearance/default.nix
    ./language-support/default.nix
    ./developer-experience/default.nix
    ./spell-checking/default.nix
    ./version-control/default.nix
  ];

  programs.vscode = {
    enable = true;
  };
}
