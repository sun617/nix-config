{ config, ... }:

{
  programs.ssh = {
    enable = true;
    forwardAgent = true;
    addKeysToAgent = "yes";
    compression = true;
    serverAliveInterval = 60;
    serverAliveCountMax = 5;
    hashKnownHosts = true;
    includes = [
      "${config.home.homeDirectory}/.ssh/config.d/*.conf"
    ];
  };

  services.ssh-agent = {
    enable = true;
  };
}
