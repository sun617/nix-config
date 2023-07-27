{ config, lib, pkgs, ... }:

{
  imports = [
    ./fcitx5.nix
    ./mako.nix
    ./mpv.nix
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
    swaylock
    wf-recorder
    wl-clipboard
    wofi
  ];
}
