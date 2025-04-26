{
  services.podman.containers.open-webui = {
    image = "ghcr.io/open-webui/open-webui:main";
    ports = [
      "15000:8080"
    ];
    environment = {
      OLLAMA_BASE_URL = "http://host.containers.internal:11434";
    };
    volumes = [
      "open-webui:/app/backend/data"
    ];

  };
}
