{ pkgs, ... }:

{
  home.packages = with pkgs; [
    spacedrive
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [ "$mainMod, f, workspace, name:FileManager" ];
    windowrule = [ "workspace name:FileManager,class:^(spacedrive)$" ];
  };
  programs.waybar.settings.mainBar."hyprland/workspaces".format-icons.FileManager = "";
}
