{
  services.flatpak = {
    enable = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "com.usebruno.Bruno"
      "io.podman_desktop.PodmanDesktop"
      "md.obsidian.Obsidian"
      "sh.loft.devpod"
    ];
  };
}
