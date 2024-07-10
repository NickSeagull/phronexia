{ chicago95 }:
{ config, pkgs, lib, ... }@inputs: with builtins;
{
  imports = [
    ../../coding/editor/neovim/default.nix
    ../../coding/editor/vscode/default.nix
    ../../coding/version-control/git.nix
    ../../coding/version-control/hub.nix
    ../../coding/direnv.nix

    ../../misc/password-management.nix
    ../../misc/file-management.nix
    ../../misc/terminal/kitty.nix
    ../../misc/terminal/better-utils.nix

    (import ../../desktop/themes/default.nix { inherit chicago95; })

    ../../multimedia/video/ffmpeg.nix
    ../../multimedia/video/obs-studio.nix
    ../../multimedia/video/vlc.nix
    ../../multimedia/image/inkscape.nix
    ../../multimedia/image/gimp.nix
    ../../multimedia/image/krita.nix
    ../../multimedia/games/steam.nix
    ../../multimedia/sound/musescore.nix
    ../../multimedia/sound/ardour.nix
    ../../multimedia/sound/bitwig.nix

    ../../network/browser.nix
    ../../network/messaging.nix
    ../../network/remote-desktop.nix

    ../../misc/terminal/zsh/p10k.nix

    ../../desktop/clipboard.nix

    ../../productivity/notes/xournalpp.nix
    ../../productivity/notes/obsidian.nix
    ../../productivity/tasks/ticktick.nix
    ../../productivity/cloud-storage/nextcloud.nix

    ../../system/package-management.nix

    ../../services/night-light.nix

    ../../config/user.nix
  ];

}
