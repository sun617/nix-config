{ pkgs, ...}:

{
  gtk = {
    enable = true;
    iconTheme = {
      # For input method tray icon
      package = pkgs.adwaita-icon-theme;
      name = "hicolor";
    };
  };
}
