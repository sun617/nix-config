{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./wezterm.nix
  ];

  home.packages = with pkgs; [
    warp-terminal
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [ "$mainMod, t, workspace, name:Terminal" ];
    windowrule = [ "workspace name:Terminal,class:^(dev.warp.Warp)$" ];
  };
  programs.waybar.settings.mainBar."hyprland/workspaces".format-icons.Terminal = "";
}
