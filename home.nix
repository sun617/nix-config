{ config, lib, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./sway
    ./tmux.nix
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sun";
  home.homeDirectory = "/home/sun";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.awscli2
    # pkgs.ssm-session-manager-plugin
    # pkgs.aws-client-vpn
    pkgs.bat
    pkgs.bottom
    pkgs.curl
    pkgs.fd
    pkgs.gopls
    pkgs.jq
    pkgs.nodePackages.typescript-language-server
    pkgs.nodePackages.vls
    pkgs.nodePackages.vscode-langservers-extracted
    pkgs.nodePackages.yaml-language-server
    pkgs.ripgrep
    pkgs.rnix-lsp
    pkgs.rustup
    pkgs.rust-analyzer
    pkgs.skim
    pkgs.sumneko-lua-language-server
    pkgs.unar
    pkgs.zip
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # programs.fish = {
  #   enable = true;
  #   plugins = [
  #     {
  #       name="foreign-env";
  #       src = pkgs.fetchFromGitHub {
  #         owner = "oh-my-fish";
  #         repo = "plugin-foreign-env";
  #         rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
  #         sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
  #       };
  #     }
  #   ];
  #   shellInit = ''
  #     if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  #       fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  #     end
  #   '';
  # };
}
