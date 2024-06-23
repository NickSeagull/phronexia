
{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vsclassic-icon-theme";
        publisher = "jez9999";
        version = "1.2.1";
        # sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      }
    ];

}
