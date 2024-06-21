{ config, pkgs, lib, ... }: with builtins;
{
  imports = [
    ../../coding/editor/neovim/default.nix
    ../../coding/editor/vscode/default.nix
    ../../coding/version-control/git.nix

    ../../misc/terminal/kitty.nix

    ../../multimedia/video/obs-studio.nix
    ../../multimedia/video/ffmpeg.nix

    ../../misc/firefox.nix
    ../../misc/xournalpp.nix
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
