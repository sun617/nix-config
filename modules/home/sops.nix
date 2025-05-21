{ pkgs, config, ... }:

{
  packages = with pkgs; [
    age
    sops
  ];

  sops = {
    # defaultSopsFile = ../../../secrets/secrets.yaml;
    age = {
      keyFile = "${config.home.homeDirectory}/.age-key.txt";
      generateKey = true;
    };
  };
}
