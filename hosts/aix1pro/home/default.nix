{ pkgs, ... }:

{
  imports = [
    ../../../modules/home/linux
    ./ollama.nix
    ./wayland
  ];

  home.packages = with pkgs; [
    amdgpu_top
  ];
}
