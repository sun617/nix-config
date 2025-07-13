{ pkgs, ... }:

{
  services.network-manager-applet.enable = true;
  # For tray icon
  home.packages = with pkgs; [
    networkmanagerapplet
  ];
}
