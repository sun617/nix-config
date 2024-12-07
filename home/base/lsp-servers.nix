{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lua-language-server
    nil
    nixfmt-rfc-style
  ];
}
