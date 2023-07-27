{ pkgs, ... }:

{
  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 900; command = "${pkgs.swaylock}/bin/swaylock -efFki ${pkgs.hyprland}/share/hyprland/wall_4K.png"; }
      { timeout = 1800; command = "hyprctl dispatch dpms off"; resumeCommand = "hyprctl dispatch dpms on"; }
      { timeout = 7200; command = "systemctl suspend"; }
    ];
  };
}