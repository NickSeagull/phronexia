{ config, pkgs, ... }:
/*
 * This module enables modal editing within VSCode, using the Vim keybindings
 * provided by the `vscodevim` extension. It also provides a suite of
 * keybindings that mimic the Spacemacs keybindings, using the
 * VSpaceCode extension.
 */
{
  imports = [
    ./extensions.nix
    ./keybindings.nix
    ./settings.nix
  ];
}
