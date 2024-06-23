
{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vsclassic-icon-theme";
        publisher = "jez9999";
        version = "1.2.1";
        sha256 = "sha256-CtC50o3wiI8s3uj03pyZxy9l4YmbHcVuLS63TP1NIno=";
      }
      {
        name = "oldschool-theme";
        publisher = "EricsonWillians";
        version = "0.0.7";
        sha256 = "sha256-CtC50o3wiI8s3uj03pyZxy9l4YmbHcVuLS63TP1NIno=";
      }
    ];


  programs.vscode.userSettings = {
    workbench.iconTheme = "vsclassic-icon-theme";
  };

}
