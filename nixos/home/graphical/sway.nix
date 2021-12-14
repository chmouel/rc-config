{ config, pkgs, ... }: {
  wayland.windowManager.sway = {
    wrapperFeatures.gtk = true;
  };
  home.packages = with pkgs; [
    sway
    swaylock
    swayidle
    wl-clipboard
    pamixer
    mako # notification daemon
    wofi
    networkmanagerapplet
    waybar
  ];
}
