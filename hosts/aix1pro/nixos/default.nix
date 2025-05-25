{ ... }:

{
  imports = [
    ../../../modules/nixos/desktop
    ./hardware-configuration.nix
    ./cloudflared.nix
    ./dnsmasq.nix
    ./nginx.nix
  ];

  networking.hostName = "aix1pro";
}
