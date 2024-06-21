{ config, pkgs, lib, ... }: with builtins;
{
  imports = [
    ../../misc/git.nix
    ../../misc/vscode/default.nix
    ../../misc/kitty.nix
    ../../misc/firefox.nix
    ../../misc/neovim.nix
    ../../misc/xournalpp.nix
    ../../misc/obs-studio.nix
    ../../misc/ffmpeg.nix
    ../../misc/ticktick.nix
    ../../misc/vlc.nix
    ../../misc/steam.nix
    ../../misc/obsidian.nix
    ../../misc/inkscape.nix
    ../../misc/gimp.nix

    # Services
    ../../services/night-light.nix

    # Config
    ../../config/home-manager.nix
    ../../config/session-variables.nix
    ../../config/user.nix
  ];

}
