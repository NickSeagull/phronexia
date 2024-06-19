{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    # Optionally, set Firefox preferences and settings
    settings = {
      "browser.startup.homepage" = "https://www.mozilla.org";
      "privacy.donottrackheader.enabled" = true;
      "network.trr.mode" = 2; # Enable DNS over HTTPS
      "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
      "browser.download.useDownloadDir" = true;
      "browser.download.folderList" = 1; # 0: Desktop, 1: Download folder, 2: Last used folder
    };
  };
}
