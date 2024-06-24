
{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    # Nix
    pinage404.nix-extension-pack
  ];
}
