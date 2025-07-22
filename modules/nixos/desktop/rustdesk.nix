{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustdesk-flutter
  ];

  # https://github.com/hyprwm/xdg-desktop-portal-hyprland/issues/252
  networking.firewall.allowedTCPPorts = [21118];
}
