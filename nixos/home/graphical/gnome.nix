{ pkgs, ... }:
let
  unstable = import <nixpkgs-unstable> {};
in
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    gnome.gnome-tweak-tool
    gnome.dconf-editor
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-panel
    gnomeExtensions.one-third-window
    gnomeExtensions.user-themes
    gnomeExtensions.bluetooth-quick-connect
    gnomeExtensions.emoji-selector
    gnomeExtensions.no-overview
    gnomeExtensions.noannoyance-2
    gnomeExtensions.run-or-raise
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.hide-universal-access
    kitty
    dconf2nix
    yaru-theme
    yaru-remix-theme
    flat-remix-gnome
    firefox
    google-chrome
    roboto-mono
    slack
    spotify
    wofi
    wl-clipboard
  ];

  programs.gpg = {
    enable = true;
  };
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };
}
