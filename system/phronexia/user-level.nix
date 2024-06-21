{ config, pkgs, lib, ... }: with builtins;
{
  imports = [
    ../../coding/editor/neovim/default.nix
    ../../coding/editor/vscode/default.nix
    ../../coding/version-control/git.nix

    ../../misc/terminal/kitty.nix

    ../../multimedia/video/ffmpeg.nix
    ../../multimedia/video/obs-studio.nix
    ../../multimedia/video/vlc.nix
    ../../multimedia/image/inkscape.nix
    ../../multimedia/image/gimp.nix
    ../../multimedia/games/steam.nix

    ../../network/browser/firefox.nix

    ../../productivity/notes/xournalpp.nix
    ../../productivity/notes/obsidian.nix
    ../../productivity/tasks/ticktick.nix

    # Services
    ../../services/night-light.nix

    # Config
    ../../config/home-manager.nix
    ../../config/session-variables.nix
    ../../config/user.nix
  ];

}
