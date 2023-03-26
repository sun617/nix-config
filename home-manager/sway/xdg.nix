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
        "text/html" = [ "firefox.desktop" "com.google.Chrome.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" "com.google.Chrome.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" "com.google.Chrome.desktop" ];
        "x-scheme-handler/about" = [ "firefox.desktop" "com.google.Chrome.desktop" ];
        "x-scheme-handler/unknown" = [ "firefox.desktop" "com.google.Chrome.desktop" ];
      };
    };
  };
  home.packages = with pkgs; [
    xdg-user-dirs
    xdg-utils
  ];
}
