{ pkgs,... }:

{
  imports = [
    ../../base
    ./fish.nix
    ./podman.nix
    ./sops.nix
  ];

  home = {
    username = "sun";
    homeDirectory = "/home/sun";
    packages = with pkgs; [
      exfatprogs
      gptfdisk
      immich-go
      usbutils
    ];
  };
}
