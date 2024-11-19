{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
      };
      listener = [
        {
          timeout = 900;
          on_timeout = "hyprlock";
        }
        {
          timeout = 1800;
          on_timeout = "hyprctl dispatch dpms off";
          on_resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 7200;
          on_timeout = "systemctl suspend";
        }
      ];
    };
  };
}