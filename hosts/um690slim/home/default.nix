{ pkgs, ... }:

{
  imports = [
    ../../../modules/home/linux/server
  ];

  home.packages = with pkgs; [
    amdgpu_top
  ];
}
