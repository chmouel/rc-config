{ config, pkgs, ... }: 
with import <nixpkgs> {};
with builtins;
with lib;
let 
  unstable = import <nixpkgs-unstable> { };
in
{
 home.packages = with pkgs; [
   gcc
   gnumake
 ];
}
