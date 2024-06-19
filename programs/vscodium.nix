{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    settings = {
      "editor.fontSize" = 14;
      "editor.fontFamily" = "JetBrains Mono";
      "editor.tabSize" = 2;
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 1000;
      "telemetry.enableTelemetry" = false;
    };

    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      ms-azuretools.vscode-docker
      ms-vscode.go
      ms-vscode.node-debug2
      ms-vscode-remote.remote-containers
    ];
  };
}
