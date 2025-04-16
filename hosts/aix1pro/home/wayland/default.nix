{
  imports = [
    ./xdg.nix
  ];

  services = {
    ollama.enable = true;
  };
}