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
      sha256 = "sha256-1x2ey8kR4QELCpIrFS0wleKL59n/0LVrMvKbaSO+8aU=";
    }
  ];


  programs.vscode.userSettings = {
    workbench.iconTheme = "vsclassic-icon-theme";
    workbench.colorTheme = "Oldschool Theme (Evil)";
    workbench.startupEditor = "none";
    workbench.editor.showTabs = "none";
    workbench.activityBar.location = "top";
    editor.minimap.enabled = false;
    editor.fontFamily = "BigBlueTerm437 Nerd Font";
    editor.fontSize = 16;
    workbench.sideBar.location = "right";
    window.menuBarVisibility = "classic";
  };

}
