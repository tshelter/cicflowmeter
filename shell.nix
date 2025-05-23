# https://ryantm.github.io/nixpkgs/builders/special/fhs-environments/
{ pkgs ? import <nixpkgs> { } }:
(pkgs.buildFHSUserEnv {
  name = "cicflowmeter";
  targetPkgs = pkgs: (with pkgs; [
    python310Full
    uv

    libz
    libpcap
    stdenv.cc.cc.lib
  ]);
  runScript = "bash";
}).env
