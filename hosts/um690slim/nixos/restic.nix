{ config, ... }:

{
  services.restic.backups.immich = {
    passwordFile = config.sops.secrets."restic/immich/password".path;
    environmentFile = config.sops.secrets."restic/immich/environment".path;
    repositoryFile = config.sops.secrets."restic/immich/repository".path;
    paths = [
      "/media/immich-app/library"
    ];
    timerConfig = {
      OnCalendar = "03:05";
      Persistent = true;
    };
    user = config.users.users.sun.name;
    initialize = true;
    pruneOpts = [
      "--keep-within-daily 5d"
      "--keep-within-weekly 1m"
      "--keep-within-monthly 1y"
    ];
    progressFps = 0.1;
  };

  sops.secrets = {
    "restic/immich/password" = {
      owner = config.services.restic.backups.immich.user;
    };
    "restic/immich/repository" = {
      owner = config.services.restic.backups.immich.user;
    };
    "restic/immich/environment" = {
      owner = config.services.restic.backups.immich.user;
    };
  };
}
