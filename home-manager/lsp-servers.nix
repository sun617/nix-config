{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gopls
    lua-language-server
    nil
    nodePackages."@tailwindcss/language-server"
    # https://github.com/NixOS/nixpkgs/pull/259042
    # nodePackages."@vue/language-server"
    nodePackages.prettier
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    rust-analyzer
  ];
}
