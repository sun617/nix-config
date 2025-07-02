{ pkgs, ... }:

{
  imports = [
    ../../../modules/home/linux/desktop
    ./ollama.nix
  ];

  home.packages = with pkgs; [
    amdgpu_top
  ];
}
