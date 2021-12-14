{ config, pkgs, ... }: {
  xserver.windowManager.stumpwm = {
    enable = true;
  };
}
