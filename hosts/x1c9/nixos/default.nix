{ ... }:

{
  imports = [
    ../../../modules/nixos/desktop
    ./hardware-configuration.nix
  ];

  networking.hostName = "x1c9";

  services.logind.lidSwitch = "suspend";
}
