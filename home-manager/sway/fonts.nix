{ pkgs, ... }:

{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    font-awesome_6
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
  fonts.fontconfig.enable = true;
}
