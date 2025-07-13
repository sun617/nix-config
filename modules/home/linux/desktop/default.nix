{ pkgs, ... }:

{
  imports = [
    ../base
    ./editor
    ./hyprland
    ./terminal
    ./browser.nix
    ./chat.nix
    ./database.nix
    ./fcitx5.nix
    ./file-manager.nix
    ./flatpak.nix
    ./mpv.nix
    ./network-manager-applet.nix
    ./rofi.nix
    ./theme.nix
    ./xdg.nix
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
    ffmpeg
    imv
    mission-center
    nwg-displays
    swappy
  ];
}
