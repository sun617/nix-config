{ pkgs,... }:

{
  home = {
    username = "sun";
    homeDirectory = "/home/sun";
    packages = with pkgs; [
      usbutils
    ];
  };

  imports = [
    ../base
    ./wayland
    ./wireplumber.nix
  ];
}
