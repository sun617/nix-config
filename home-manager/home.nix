{ config, lib, pkgs, ... }:

{
  home = {
    username = "sun";
    homeDirectory = "/home/sun";
    stateVersion = "22.11";
  };

  imports = [
    ./aws.nix
    ./broot.nix
    ./docker-compose.nix
    ./fish
    ./git.nix
    ./helix.nix
    ./lsp-servers.nix
    ./neovim
    ./sway
    ./tmux.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    bat
    bottom
    curl
    fd
    jq
    ripgrep
    skim
    unar
    zip
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # https://github.com/nix-community/home-manager/issues/2942
  nixpkgs.config.allowUnfreePredicate = (_: true);
}
