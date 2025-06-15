{
  services.adguardhome = {
    enable = true;
  };

  networking.firewall.allowedUDPPorts = [53];
}
