{ pkgs, ... }:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/https" = [ "app.zen_browser.zen.desktop" ];
      };
    };
  };
  home.packages = with pkgs; [
    xdg-user-dirs
    xdg-utils
  ];
}
