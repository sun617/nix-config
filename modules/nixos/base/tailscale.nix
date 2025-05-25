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
  };

  sops.secrets = {
    "tailscale/auth-key/oauth-client-secret" = { };
  };
}
