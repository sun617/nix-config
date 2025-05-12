{ pkgs, config, ... }:

{
  home = {
    stateVersion = "23.11";
    sessionVariables = {
      EDITOR = "hx";
    };
    packages = with pkgs; [
      age
      azure-cli
      bat
      bottom
      curl
      du-dust
      ghostscript
      imagemagick
      jnv
      openssl
      pwgen
      sops
      unzip
      wget
      xh
      zip
      zola
    ];
  };

  imports = [
    ./android.nix
    ./aws.nix
    ./cloudflare.nix
    ./docker-compose.nix
    ./fish
    ./git.nix
    ./google-cloud-sdk.nix
    ./helix.nix
    ./lsp-servers.nix
    ./nix-gc.nix
    ./ssh.nix
    ./yazi.nix
  ];

  sops = {
    # defaultSopsFile = ../../../secrets/secrets.yaml;
    age = {
      keyFile = "${config.home.homeDirectory}/.age-key.txt";
      generateKey = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
