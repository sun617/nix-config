{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "idle_inhibitor"
          "network"
          "pulseaudio"
          "cpu"
          "memory"
          "disk"
          "backlight"
          "battery"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{name}: {icon}";
          format-icons = {
            active = "";
            default = "";

            Browser = "";
            Chat = "󰒱";
            Database = "";
            Editor = "󰨞";
            FileManager = "";
            Terminal = "";
          };
        };
        "hyprland/window" = {
          format = "👉 {}";
          rewrite = {
            "(.*) — Mozilla Firefox" = "🌎 $1";
            "(.*) — fish" = "> [$1]";
          };
          separate-outputs = true;
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          # scroll-step = 1; # %, can be a float
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "${pkgs.pwvucontrol}/bin/pwvucontrol";
        };
        cpu = {
          format = "{usage}% 󰻠";
          tooltip = false;
        };
        memory = {
          interval = 30;
          format = "{used:0.1f}G/{total:0.1f}G 󰍛";
        };
        disk = {
          interval = 30;
          format = "{specific_used:0.2f}G/{specific_total:0.2f}G ";
          unit = "GB";
        };
        backlight = {
          # device = "acpi_video1";
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-good = ""; # An empty format will hide the module
          format-full = "";
          format-icons = [ "" "" "" "" "" ];
        };
        clock = {
          timezone = "Japan/Tokyo";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        tray = {
          icon-size = 21;
          spacing = 10;
        };
      };
    };
  };
}
