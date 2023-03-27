{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodePackages.yaml-language-server
    nil
    rust-analyzer
    lua-language-server
  ];
}