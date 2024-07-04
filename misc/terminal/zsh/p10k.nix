{ config, pkgs, ... }:

{
  # The referenced file was generate by the powerlevel10k setup script.
  # We are including it here to make sure it is sourced and we don't have to
  # rerun the setup script.
  home.file.".p10k.zsh".source = ./p10k.zsh;
}
