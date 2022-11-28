{ pkgs, ... }:

{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    font-awesome_6
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
  fonts.fontconfig.enable = true;
}
