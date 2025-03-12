{ pkgs,... }:

{
  imports = [
    ../base
    ./fish.nix
    ./flatpak.nix
    ./wayland
  ];

  home = {
    username = "sun";
    homeDirectory = "/home/sun";
    packages = with pkgs; [
      usbutils
    ];
  };
}
