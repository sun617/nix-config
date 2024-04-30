{ pkgs, ... }:

{
  # fonts
  fonts.packages = with pkgs; [
    hack-font # for warp-terminal
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    font-awesome_6
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
  # icons
  environment.systemPackages = let
    mkDefaultCursorIcon = pkgs.writeTextDir "share/icons/default/index.theme" ''
      [icon theme]
      Name=Default
      Comment=Default Cursor Theme
      Inherits=Bibata-Modern-Ice
    '';
  in [
    pkgs.bibata-cursors
    mkDefaultCursorIcon
  ];
}
