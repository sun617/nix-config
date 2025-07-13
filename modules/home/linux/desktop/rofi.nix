{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.warp-terminal}/bin/warp-terminal";
    plugins = with pkgs; [
      rofi-emoji-wayland
    ];
    theme = "gruvbox-dark";
    font = "JetBrainsMono Nerd Font 12";
    extraConfig = {
      modes = "combi,emoji";
      combi-modes = "window,drun";
      icon-theme = "Papirus";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-combi = "Apps";
      display-emoji = " 😀 Emoji";
      sidebar-mode = true;
    };
  };
} 