{ config, ... }:

{
  services.tailscale = {
    enable = true;
    authKeyFile = config.sops.secrets."tailscale/auth-key/oauth-client-secret".path;
    authKeyParameters = {
      ephemeral = false;
      preauthorized = true;
    };
    extraUpFlags = [
      "--advertise-tags=tag:linux"
    ];
    # for server
    useRoutingFeatures = "server";
    extraSetFlags = [
      "--advertise-routes=10.0.0.0/24"
    ];
  };

  sops.secrets = {
    "tailscale/auth-key/oauth-client-secret" = { };
  };
}
