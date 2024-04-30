{ pkgs, ... }:

{
  home = {
    stateVersion = "23.11";
    sessionVariables = {
      EDITOR = "hx";
    };
    packages = with pkgs; [
      azure-cli
      bat
      bottom
      curl
      devenv
      devbox
      du-dust
      fd
      ghostscript
      imagemagick
      jnv
      jq
      ollama
      ripgrep
      unar
      unzip
      xh
      zip
      zola
    ];
  };

  imports = [
    ./android.nix
    ./aws.nix
    ./docker-compose.nix
    ./fish
    ./git.nix
    ./google-cloud-sdk.nix
    ./helix.nix
    ./lsp-servers.nix
    ./yazi.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
