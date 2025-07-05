{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./fcitx5.nix
    ./gtk.nix
    ./mpv.nix
    ./network-manager-applet.nix
    ./rofi.nix
    ./wezterm.nix
    ./xdg.nix
    ./hyprland
  ];

  services = {
    blueman-applet.enable = true;
    mako = {
      enable = true;  
      settings = {
        default-timeout = 5000;
      };
    };
    # syncthing.enable = true;
    udiskie.enable = true;
  };

  home.packages = with pkgs; [
    appimage-run
    code-cursor
    ffmpeg
    imv
    mission-center
    nwg-displays
    spacedrive
    swappy
    warp-terminal
    zed-editor
  ];
}
