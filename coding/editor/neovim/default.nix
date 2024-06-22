{ config, pkgs, ... }:
/*
 * I mostly use NeoVim for one-off edits on the
 * terminal, so not much to see here.
 */
{
  programs.neovim = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim"; # Set Neovim as the default editor
  };
}
