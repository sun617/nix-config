{ pkgs, ... }:

{
  home = {
    stateVersion = "23.11";
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      EDITOR = "hx";
    };
    packages = with pkgs; [
      azure-cli
      bat
      bottom
      curl
      dig
      dust
      gemini-cli
      ghostscript
      gnumake
      imagemagick
      jnv
      openssl
      pwgen
      unzip
      wget
      xh
      zip
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
    ./nix-gc.nix
    ./ssh.nix
    ./yazi.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
