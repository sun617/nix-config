{
  xdg.configFile = {
    "wireplumber/bluetooth.lua.d/50-bluez-config.lua".text = ''
      bluez_monitor.properties = {
        ["bluez5.default.rate"] = 96000,
      }
    '';
  };
}
