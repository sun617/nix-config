{ pkgs, ... }:

{
  imports = [
    ../../../modules/home/linux/desktop
    ./ollama.nix
    ./wayland
  ];

  home.packages = with pkgs; [
    amdgpu_top
  ];
}
