{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    erlang
    rebar3 # For erlang_ls (language server).
  ];
}
