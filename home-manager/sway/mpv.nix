{
  programs.mpv = {
    enable = true;
    config = {
      fullscreen = true;
      vo = "gpu";
      hwdec = "vaapi";
      gpu-context = "wayland";
    };
    bindings = {
      "Alt+RIGHT" = "add video-rotate 90";
      "Alt+LEFT" = "add video-rotate -90";
    };
  };
}
