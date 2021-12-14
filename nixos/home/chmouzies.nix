{ pkgs, ...}:

with import <nixpkgs> {};
with builtins;
with lib;

let
chmouzies = stdenv.mkDerivation {
  name = "chmouzies";
  src = fetchFromGitHub {
    owner = "chmouel";
    repo = "chmouzies";
    rev = "master";
    sha256 = "1sivj7j08rv6s9frsl0v0k6bgnpkxjz7sgkqsdqvam650vl1bpph"; 
  };
  installPhase = ''
    mkdir -p $out/bin
    cp -v git/git* $out/bin
    cp -v misc/find-file $out/bin
  '';
}; in 
  {
  home.packages = [
    chmouzies
  ];

}


