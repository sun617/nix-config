{
  services.flatpak.packages = [
    "com.redis.RedisInsight"
    "io.dbeaver.DBeaverCommunity"
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [ "$mainMod, d, workspace, name:Database" ];
    windowrule = [ "workspace name:Database,class:^(DBeaver)$" ];
  };
  programs.waybar.settings.mainBar."hyprland/workspaces".format-icons.Database = "";
}
