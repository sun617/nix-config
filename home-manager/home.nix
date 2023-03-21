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
      gcc
      gnumake
      jq
      pulsemixer
      ripgrep
      skim
      unar
      xplr
      zip
    ];
  };

  imports = [
    ./android.nix
    ./aws.nix
    ./broot.nix
    ./docker-compose.nix
    ./fish
    ./git.nix
    ./helix.nix
    ./lsp-servers.nix
    ./sway
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # https://github.com/nix-community/home-manager/issues/2942
  nixpkgs.config.allowUnfreePredicate = (_: true);
}
