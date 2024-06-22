{ config, pkgs, lib, ... }: with builtins;
{
  imports = [
    ../../coding/editor/neovim/default.nix
    ../../coding/editor/vscode/default.nix
    ../../coding/version-control/git.nix

    ../../misc/terminal/kitty.nix

    ../../desktop/themes/default.nix

    ../../multimedia/video/ffmpeg.nix
    ../../multimedia/video/obs-studio.nix
    ../../multimedia/video/vlc.nix
    ../../multimedia/image/inkscape.nix
    ../../multimedia/image/gimp.nix
    ../../multimedia/games/steam.nix

    ../../network/browser.nix

    ../../productivity/notes/xournalpp.nix
    ../../productivity/notes/obsidian.nix
    ../../productivity/tasks/ticktick.nix

    ../../system/package-management.nix

    ../../services/night-light.nix

    ../../config/user.nix
  ];

}
