{
  services.flatpak = {
    enable = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "com.rustdesk.RustDesk"
      "com.usebruno.Bruno"
      "io.podman_desktop.PodmanDesktop"
      "md.obsidian.Obsidian"
      "org.localsend.localsend_app"
      "sh.loft.devpod"
    ];
  };
}
