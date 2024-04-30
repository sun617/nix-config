{ pkgs,... }:

{
  imports = [
    ../base
    ./fish.nix
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
