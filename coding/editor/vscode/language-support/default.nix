
{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    # Nix
    {
        name = "nix-extension-pack";
        publisher = "pinage404";
        version = "1.0.11";
        sha256 = "sha256-CtC50o3wiI8s3uj03pyZxy9l4YmbHcVuLS63TP1NIno=";
      }
  ];
}
