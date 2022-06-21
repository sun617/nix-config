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
            block = "networkmanager";
            primary_only = true;
          }
          {
            block = "battery";
          }
          {
            block = "disk_space";
          }
          {
            block = "memory";
            format_mem = "{mem_used}/{mem_total}({mem_used_percents})";
            format_swap = "{swap_used}/{swap_total}({swap_used_percents})";
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
        icons = "awesome5";
        theme = "solarized-dark";
      };
    };
  };
}
