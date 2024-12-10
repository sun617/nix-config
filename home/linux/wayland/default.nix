{ pkgs, ... }:

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
    ./udiskie.nix
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
    nwg-displays
    spacedrive
    swappy
    warp-terminal
    zed-editor
  ];
}
