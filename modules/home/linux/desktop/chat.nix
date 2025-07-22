{
  services.flatpak.packages = [
    "com.discordapp.Discord"
    "com.slack.Slack"
    "com.tencent.WeChat"
    "org.telegram.desktop"
    "us.zoom.Zoom"
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [ "$mainMod, c, workspace, name:Chat" ];
    windowrule = [ "workspace name:Chat,class:^(Slack)$" ];
  };
  programs.waybar.settings.mainBar."hyprland/workspaces".format-icons.Chat = "󰒱";
}
