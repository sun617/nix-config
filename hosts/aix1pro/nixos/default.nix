{ ... }:

{
  imports = [
    ../../../modules/nixos
    ./hardware-configuration.nix
    ./dnsmasq.nix
    ./nginx.nix
  ];

  networking.hostName = "aix1pro";
}
