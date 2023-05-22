{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gopls
    lua-language-server
    nil
    nodePackages.prettier
    nodePackages.typescript-language-server
    nodePackages.volar
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    rust-analyzer
  ];
}
