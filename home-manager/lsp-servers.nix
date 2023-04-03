{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodePackages.yaml-language-server
    nil
    lua-language-server
  ];
}