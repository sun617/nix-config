{ config, lib, pkgs, ... }:

{
  imports = [
    ./blueman-applet.nix
    ./fcitx5.nix
    ./mako.nix
    ./mpv.nix
    ./network-manager-applet.nix
    ./syncthing.nix
    ./swayidle.nix
    ./udiskie.nix
    ./vscode.nix
    ./wezterm.nix
    ./xdg.nix
    ./hyprland
    # ./sway
  ];

  home.packages = with pkgs; [
    gnome.seahorse
    grim
    imv
    killall
    light
    playerctl
    slurp
    swappy
    swaylock
    wf-recorder
    wl-clipboard
    wofi
  ];
}
