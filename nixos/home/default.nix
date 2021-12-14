{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  nixpkgs.config.allowUnfree = true;
  imports = [
    (import "${home-manager}/nixos")
    #    ./emacs.nix
    #     ./packages.nix
    #    ./sway.nix
  ];
  home-manager.users.chmouel = {
    programs.home-manager.enable = true;
    imports = [
      ./packages.nix
      ./chmouzies.nix
      ./zsh.nix
      ./nvim
      ./emacs
      ./graphical/gnome.nix
      ./graphical/dconf.nix
      ./dev
    ];
  };
}
