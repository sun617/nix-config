{ config, lib, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim
    ./sway
    ./tmux.nix
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sun";
  home.homeDirectory = "/home/sun";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    awscli2
    # ssm-session-manager-plugin
    # aws-client-vpn
    bat
    bottom
    curl
    fd
    jq
    ripgrep
    rustup
    skim
    unar
    zip
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
  programs = {
    home-manager.enable = true;
    firefox.enable = true;
  };

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
