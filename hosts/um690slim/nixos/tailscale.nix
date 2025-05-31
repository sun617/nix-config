{ ... }:

{
  services.tailscale = {
    useRoutingFeatures = "server";
    extraSetFlags = [
      "--advertise-routes=10.0.0.0/24"
      "--ssh"
    ];
  };
}
