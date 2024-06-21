{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "NickSeagull";
    userEmail = "git@nickseagull.dev";
    delta.enable = true;
    lfs.enable = true;

    aliases = {
      p = "push";
      co = "checkout";
      c = "commit";
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };

  };
}
