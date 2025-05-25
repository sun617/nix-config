{ ... }:

{
  imports = [
    ../../base
  ];

  # List services that you want to enable:
  services = {
    # rustdesk-server = {
    #   enable = true;
    #   openFirewall = true;
    #   signal.relayHosts = [
    #     "relay.rustdesk.local"
    #   ];
    # };
    # samba = {
    #   enable = true;
    #   openFirewall = true;
    #   shares = {
    #     private = {
    #       path = "/home/sun/workspace/share";
    #       "read only" = false;
    #       browseable = "yes";
    #       "guest ok" = "no";
    #     };
    #   };
    # };
  };
}
