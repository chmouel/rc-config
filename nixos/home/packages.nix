{ config, pkgs, ... }:
let
  unstable = import <nixpkgs-unstable> {};
in
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    fd
    fzf
    git
    github-cli
    gnupg
    go
    htop
    jq
    yadm
    libinput
    nixpkgs-fmt
    nix-zsh-completions
    oathToolkit
    python3
    ranger
    tmux
    ripgrep
    zplug
  ];
  # programs.gpg.enable = true;
  # programs.gpg.homedir = "${config.xdg.dataHome}/gnupg";
  # services.gpg-agent.enable = true;
  programs.password-store.enable = true;

}
