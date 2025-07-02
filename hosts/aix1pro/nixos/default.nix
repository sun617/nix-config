{ ... }:

{
  imports = [
    ../../../modules/nixos/desktop
    ./hardware-configuration.nix
    ./cloudflared.nix
    ./certificates.nix
  ];

  # socks5
  networking.firewall.allowedTCPPorts = [1337];
  networking.firewall.allowedUDPPorts = [1337];

  networking.hostName = "aix1pro";
}
