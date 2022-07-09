{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gopls
    nodePackages.typescript-language-server
    nodePackages.vls
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    rnix-lsp
    rust-analyzer
    sumneko-lua-language-server
  ];
}