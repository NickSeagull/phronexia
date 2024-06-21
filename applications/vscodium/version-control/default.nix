{ config, pkgs, ... }:
{
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    /*
     * Magit is a great git client for Emacs, but it's also available as a VSCode extension.
     *
     * https://github.com/kahole/edamagit
     */
    kahole.magit

    /*
     * GitLens allows accessing git history and other git features directly from the editor.
     */
    eamodio.gitlens

    /*
     * This extension provides a set of commands to work with GitHub Pull Requests and Issues.
     */
    github.vscode-pull-request-github
  ];
}
