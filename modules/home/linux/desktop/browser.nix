{
  services.flatpak.packages = [
    "app.zen_browser.zen"
    "com.google.Chrome"
    "com.microsoft.Edge"
    "org.mozilla.firefox"
  ];

  wayland.windowManager.hyprland.settings = {
    bind = [ "$mainMod, b, workspace, name:Browser" ];
    windowrule = [ "workspace name:Browser,class:^(zen)$" ];
  };
  programs.waybar.settings.mainBar."hyprland/workspaces".format-icons.Browser = "";
}
