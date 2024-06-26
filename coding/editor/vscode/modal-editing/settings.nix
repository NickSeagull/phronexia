{ config, pkgs, ... }:

{
  programs.vscode.userSettings = {
    vim.easymotion = true;
    vim.useSystemClipboard = true;
    vim.normalModeKeyBindingsNonRecursive = [
      {
        before = [ "<space>" ];
        commands = [ "vspacecode.space" ];
      }
      {
        before = [ "," ];
        commands = [
          "vspacecode.space"
          {
            command = "whichkey.triggerKey";
            args = "m";
          }
        ];
      }
    ];
    vim.visualModeKeyBindingsNonRecursive = [
      {
        before = [ "<space>" ];
        commands = [ "vspacecode.space" ];
      }
      {
        before = [ "," ];
        commands = [
          "vspacecode.space"
          {
            command = "whichkey.triggerKey";
            args = "m";
          }
        ];
      }
      {
        before = [ ">" ];
        commands = [ "editor.action.indentLines" ];
      }
      {
        before = [ "<" ];
        commands = [ "editor.action.outdentLines" ];
      }
    ];
  };
}
