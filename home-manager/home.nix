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
      bat
      bottom
      curl
      du-dust
      fd
      jq
      ripgrep
      skim
      unar
      xh
      xplr
      zip
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
