{ pkgs,... }:

{
  imports = [
    ../base
    ./fish.nix
    ./flatpak.nix
    ./podman.nix
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
