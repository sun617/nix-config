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
      devenv
      devbox
      du-dust
      fd
      ghostscript
      imagemagick
      jnv
      jq
      ollama
      ripgrep
      skim
      usbutils
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
    ./google-cloud-sdk.nix
    ./helix.nix
    ./lsp-servers.nix
    ./wayland
    ./wireplumber.nix
    ./yazi.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
