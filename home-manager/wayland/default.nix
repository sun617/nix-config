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
    ./swayidle.nix
    ./syncthing.nix
    ./udiskie.nix
    ./vscode.nix
    ./wezterm.nix
    ./xdg.nix
    ./hyprland
    # ./sway
  ];

  home.packages = with pkgs; [
    appimage-run
    ffmpeg
    gnome.seahorse
    grim
    imv
    killall
    light
    playerctl
    slurp
    spacedrive
    swappy
    swaylock
    warp-terminal
    wf-recorder
    wl-clipboard
    wofi
  ];
}
