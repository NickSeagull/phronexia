{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    vspacecode.whichkey
    vspacecode.vspacecode
    bodil.file-browser
  ];
}
