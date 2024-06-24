
{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    # Nix
    {
        name = "nix-extension-pack";
        publisher = "pinage404";
        version = "3.0.0";
        sha256 = "sha256-cWXd6AlyxBroZF+cXZzzWZbYPDuOqwCZIK67cEP5sNk=";
      }
  ];
}
