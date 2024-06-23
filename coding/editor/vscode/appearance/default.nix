
{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    jez9999.vsclassic-icon-theme
  ];

}
