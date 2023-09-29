{ pkgs, ...}:

{
  gtk = {
    enable = true;
    iconTheme = {
      # For input method tray icon
      package = pkgs.gnome.adwaita-icon-theme;
      name = "hicolor";
    };
  };
}
