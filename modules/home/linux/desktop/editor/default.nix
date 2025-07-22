{ pkgs, ... }:

{
  imports = [
    ./zed-editor.nix
  ];

  home.packages = with pkgs; [
    code-cursor
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [ "$mainMod, e, workspace, name:Editor" ];
    windowrule = [ "workspace name:Editor,class:^(Cursor)$" ];
  };
  programs.waybar.settings.mainBar."hyprland/workspaces".format-icons.Editor = "󰨞";
}
