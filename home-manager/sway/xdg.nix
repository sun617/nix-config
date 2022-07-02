{ pkgs, ... }:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
  home.packages = with pkgs; [
    xdg-user-dirs
    xdg-utils
  ];
}
