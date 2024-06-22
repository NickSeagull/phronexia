{ config, pkgs, ... }:

{
  # Set the time zone to "Atlantic/Canary"
  time.timeZone = "Atlantic/Canary";

  # Set the default locale to "en_US.UTF-8"
  i18n.defaultLocale = "en_US.UTF-8";

  # Set additional locale settings for specific categories
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Set the keymap for the console to "us-acentos"
  console.keyMap = "us-acentos";

  # Configure the X server keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  # Set the location provider to "geoclue2"
  location.provider = "geoclue2";
}
