
{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    vscode-utils.buildVscodeMarketplaceExtension {name = "jez9999.vsclassic-icon-theme"; }
  ];

}
