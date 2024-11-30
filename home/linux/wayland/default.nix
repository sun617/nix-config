{ config, lib, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./blueman-applet.nix
    ./fcitx5.nix
    ./gtk.nix
    ./mako.nix
    ./mpv.nix
    ./network-manager-applet.nix
    ./rofi.nix
    # ./syncthing.nix
    ./udiskie.nix
    ./vscode.nix
    ./wezterm.nix
    ./xdg.nix
    ./hyprland
  ];

  home.packages = with pkgs; [
    appimage-run
    code-cursor
    ffmpeg
    seahorse
    imv
    maestral-gui
    nwg-displays
    spacedrive
    swappy
    warp-terminal
  ];
}
