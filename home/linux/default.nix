{ pkgs,... }:

{
  imports = [
    ../base
    ./fish.nix
    ./flatpak.nix
    ./wayland
    ./wireplumber.nix
  ];

  home = {
    username = "sun";
    homeDirectory = "/home/sun";
    packages = with pkgs; [
      usbutils
    ];
  };
}
