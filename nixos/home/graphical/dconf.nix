# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/ColdWarm.jpg";
      primary-color = "#ffffff";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "caps:ctrl_modifier" ];
    };

    "org/gnome/desktop/interface" = {
      cursor-theme = "Yaru";
      enable-hot-corners = false;
      font-antialiasing = "rgba";
      font-hinting = "slight";
      gtk-im-module = "gtk-im-context-simple";
      gtk-theme = "Yaru-dark";
      icon-theme = "Yaru-remix";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/sound" = {
      theme-name = "Yaru";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      num-workspaces = 5;
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
      default-search-engine = "Google";
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      center-new-windows = true;
      dynamic-workspaces = false;
      edge-tiling = false;
      focus-change-on-pointer-rest = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/shell" = {
      disabled-extensions = [];
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "dash-to-panel@jderose9.github.com" "GPaste@gnome-shell-extensions.gnome.org" "no-overview@fthx" "noannoyance@daase.net" "run-or-raise@edvard.cz" "user-theme@gnome-shell-extensions.gcampax.github.com" ];
      welcome-dialog-last-shown-version = "41.1";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover-animation-extent = "{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";
      appicon-margin = 8;
      appicon-padding = 4;
      available-monitors = [ 0 ];
      hotkeys-overlay-combo = "TEMPORARILY";
      leftbox-padding = -1;
      panel-anchors = "'{\"0\":\"MIDDLE\"}'";
      panel-element-positions = "'{\"0\":[{\"element\":\"showAppsButton\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"centerBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"desktopButton\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"dateMenu\",\"visible\":true,\"position\":\"stackedBR\"}]}'";
      # panel-lengths = "'{"0":100}'";
      panel-positions = "'{\"0\":\"TOP\"}'";
      panel-sizes = "'{\"0\":30}'";
      status-icon-padding = -1;
      trans-panel-opacity = 0.55;
      trans-use-custom-opacity = true;
      tray-padding = -1;
      window-preview-title-position = "TOP";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Flat-Remix-Violet-Darkest";
    };

    "org/gnome/shell/world-clocks" = {
      locations = "[<(uint32 2, <('Los Angeles', 'KCQT', true, [(0.59370283970450188, -2.0644336110828618)], [(0.59432360095955872, -2.063741622941031)])>)>, <(uint32 2, <('New York', 'KNYC', true, [(0.71180344078725644, -1.2909618758762367)], [(0.71059804659265924, -1.2916478949920254)])>)>, <(uint32 2, <('Bangalore', 'VOBG', true, [(0.22601989378717041, 1.3555659188172149)], [(0.22631101470640302, 1.3537937114947398)])>)>]";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };
    "org/gnome/GPaste" = {
      images-support = true;
      launch-ui = "";
      make-password = "";
      pop = "";
      show-history = "<Shift><Super>space";
      sync-clipboard-to-primary = "";
      sync-primary-to-clipboard = "";
      upload = "";
    };

    "org/gnome/GWeather" = {
      temperature-unit = "centigrade";
    };

    "org/gnome/Weather" = {
      locations = "[<(uint32 2, <('Paris', 'LFPB', true, [(0.85462956287765413, 0.042760566673861078)], [(0.8528842336256599, 0.040724343395436846)])>)>]";
    };

    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [];
      begin-move = [ "<Shift><Super>F7" ];
      begin-resize = [ "<Super>F7" ];
      cycle-group = [];
      cycle-group-backward = [];
      cycle-panels = [];
      cycle-panels-backward = [];
      cycle-windows = [ "<Super>0" ];
      cycle-windows-backward = [ "<Shift><Super>0" ];
      maximize = [];
      minimize = [];
      move-to-center = [ "<Super>Home" ];
      move-to-monitor-down = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-monitor-up = [];
      move-to-workspace-1 = [ "<Shift><Super>exclam" ];
      move-to-workspace-2 = [ "<Shift><Super>at" ];
      move-to-workspace-3 = [ "<Shift><Super>numbersign" ];
      move-to-workspace-4 = [ "<Super><Shift>4" ];
      move-to-workspace-down = [];
      move-to-workspace-last = [];
      move-to-workspace-left = [ "<Super><Shift>Page_Up" ];
      move-to-workspace-right = [ "<Super><Shift>Page_Down" ];
      move-to-workspace-up = [];
      show-desktop = [ "<Super>d" ];
      switch-applications = [ "<Alt>Tab" ];
      switch-applications-backward = [ "<Shift><Alt>Tab" ];
      switch-input-source = [];
      switch-input-source-backward = [];
      switch-panels = [];
      switch-panels-backward = [];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-down = [];
      switch-to-workspace-last = [];
      switch-to-workspace-left = [ "<Super>Page_Up" ];
      switch-to-workspace-right = [ "<Super>Page_Down" ];
      switch-to-workspace-up = [];
      switch-windows = [ "<Super>Tab" ];
      switch-windows-backward = [ "<Shift><Super>Tab" ];
      toggle-maximized = [];
      unmaximize = [];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>space";
      command = "mounch";
      name = "Mounch";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      binding = "<Shift><Super>e";
      command = "wofi-emoji";
      name = "Emoji";
    };

    "org/gnome/shell" = {
      favorite-apps = [ "firefox.desktop" "chromium.desktop" "kitty.desktop" "slack.desktop" "spotify.desktop" ];
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [ "slack.desktop:3" "spotify.desktop:4" "visual-studio-code.desktop:1" "jetbrains-goland.desktop:2" "notion-app.desktop:4" "firefox.desktop:1" "google-chrome.desktop:1" ];
    };

    "org/gnome/shell/extensions/run-or-raise" = {
      switch-back-when-focused = true;
      verbose = true;
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = [];
      open-application-menu = [];
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      switch-to-application-6 = [];
      switch-to-application-7 = [];
      switch-to-application-8 = [];
      switch-to-application-9 = [];
      toggle-application-view = [];
      toggle-message-tray = [];
      toggle-overview = [ "<Super>r" ];
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = "[<(uint32 2, <('Paris', 'LFPB', true, [(0.85462956287765413, 0.042760566673861078)], [(0.8528842336256599, 0.040724343395436846)])>)>]";
    };

  };
}
