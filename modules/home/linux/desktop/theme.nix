{ pkgs, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      # For input method tray icon
      package = pkgs.adwaita-icon-theme;
      name = "hicolor";
    };
  };
}
