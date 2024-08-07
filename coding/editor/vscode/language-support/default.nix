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
    {
      name = "nix-ide";
      publisher = "jnoortheen";
      version = "0.3.1";
      sha256 = "sha256-05oMDHvFM/dTXB6T3rcDK3EiNG2T0tBN9Au9b+Bk7rI=";
    }
    {
      name = "nix-env-selector";
      publisher = "arrterian";
      version = "1.0.11";
      sha256 = "sha256-dK0aIH8tkG/9UGblNO0WwxJABBEEKEy4nSmIwdDpf4Q=";
    }
    {
      name = "direnv";
      publisher = "mkhl";
      version = "0.17.0";
      sha256 = "sha256-9sFcfTMeLBGw2ET1snqQ6Uk//D/vcD9AVsZfnUNrWNg=";
    }

    # Haskell
    {
      name = "haskell";
      publisher = "haskell";
      version = "2.4.4";
      sha256 = "sha256-O7tfZ1bQmlMgZGoWuECjSno6DLCO0+CCteRhT6PjZBY=";
    }
    {
      name = "language-haskell";
      publisher = "justusadam";
      version = "3.6.0";
      sha256 = "sha256-rZXRzPmu7IYmyRWANtpJp3wp0r/RwB7eGHEJa7hBvoQ=";
    }
  ];

  home.packages = with pkgs; [
    # Nix
    nixpkgs-fmt

    # Devenv
    devenv
    direnv
  ];
}
