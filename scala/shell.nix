{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    # Actors API changed from 2.11 onwards.
    scala_2_10
  ];
}
