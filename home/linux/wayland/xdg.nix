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
        "text/html" = [ "org.mozilla.firefox.desktop" "com.google.Chrome.desktop" ];
        "x-scheme-handler/http" = [ "org.mozilla.firefox.desktop" "com.google.Chrome.desktop" ];
        "x-scheme-handler/https" = [ "org.mozilla.firefox.desktop" "com.google.Chrome.desktop" ];
        "x-scheme-handler/about" = [ "org.mozilla.firefox.desktop" "com.google.Chrome.desktop" ];
        "x-scheme-handler/unknown" = [ "org.mozilla.firefox.desktop" "com.google.Chrome.desktop" ];
      };
    };
  };
  home.packages = with pkgs; [
    xdg-user-dirs
    xdg-utils
  ];
}
