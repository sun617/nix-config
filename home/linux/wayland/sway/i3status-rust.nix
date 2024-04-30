{
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          {
            block = "backlight";
            device = "intel_backlight";
          }
          {
            block = "sound";
            step_width = 3;
          }
          {
            block = "net";
            format = " $icon {$signal_strength $ssid $frequency|Wired connection} via $device ";
          }
          {
            block = "battery";
          }
          {
            block = "disk_space";
          }
          {
            block = "memory";
          }
          {
            block = "cpu";
          }
          {
            block = "load";
          }
          {
            block = "time";
          }
        ];
        icons = "awesome6";
        theme = "solarized-dark";
      };
    };
  };
}
