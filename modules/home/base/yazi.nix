{ pkgs, ... }:

{
  programs = {
    yazi = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        manager = {
          sort_by = "mtime";
          sort_reverse = true;
          linemode = "mtime";
        };
      };
    };
  };

  home.packages = with pkgs; [
    file
    ffmpegthumbnailer
    fd
    fzf
    jq
    poppler
    ripgrep
    unar
    wl-clipboard
  ];
}
