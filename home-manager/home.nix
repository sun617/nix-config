{ config, lib, pkgs, ... }:

{
  home = {
    username = "sun";
    homeDirectory = "/home/sun";
    stateVersion = "22.11";
    sessionVariables = {
      EDITOR = "hx";
    };
    packages = with pkgs; [
      azure-cli
      bat
      bottom
      curl
      devbox
      du-dust
      fd
      ghostscript
      imagemagick
      jq
      ollama
      ripgrep
      skim
      unar
      unzip
      xh
      zip
      zola
    ];
  };

  imports = [
    ./android.nix
    ./aws.nix
    ./docker-compose.nix
    ./fish
    ./git.nix
    ./helix.nix
    ./lsp-servers.nix
    ./wayland
    ./wireplumber.nix
    ./yazi.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
