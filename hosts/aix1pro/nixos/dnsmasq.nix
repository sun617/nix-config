{
  services.dnsmasq = {
    enable = true;
    settings = {
      auth-server = "qqnana.net,wlp194s0";
      interface-name = "qqnana.net,wlp194s0/4";
      auth-zone = "qqnana.net,wlp194s0";
      cname = [
        "*.qqnana.net,qqnana.net"
      ];
    };
  };
}
