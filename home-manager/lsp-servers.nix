{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gopls
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    nil
    rust-analyzer
    lua-language-server
  ];
}