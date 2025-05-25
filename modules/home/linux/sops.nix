{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    age
    sops
  ];

  sops = {
    # defaultSopsFile = ../../../secrets/user/secrets.yaml;
    age = {
      keyFile = "${config.home.homeDirectory}/.age-key.txt";
      generateKey = true;
    };
  };
}
