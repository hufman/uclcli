{ pkgs ? import <nixpkgs> {} }:

# https://discourse.nixos.org/t/how-to-use-a-nix-derivation-from-a-local-folder/5498/4
pkgs.mkShell {
  buildInputs = [ (pkgs.callPackage ./derivation.nix {}) ];
}
