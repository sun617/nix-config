{ config, lib, pkgs, ... }:

{
  imports = [
    ./fcitx5.nix
    ./i3status-rust.nix
    ./kanshi.nix
    ./mako.nix
    ./mpv.nix
    ./udiskie.nix
    ./wezterm.nix
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    gnome.adwaita-icon-theme
    grim
    imv
    killall
    light
    playerctl
    slurp
    swayidle
    wf-recorder
    wl-clipboard
    wofi
  ];

  programs.fish.loginShellInit = ''
    if test (tty) = /dev/tty1
      exec sway > ~/sway.log 2>&1
    end
  '';

  # https://git.sr.ht/~jshholland/nixos-configs/tree/master/home/sway.nix
  wayland.windowManager.sway = {
    enable = true;
    extraSessionCommands = ''
      # firefox
      export MOZ_ENABLE_WAYLAND=1
    '';
    config = {
      bars = [{
        fonts = {
          names = [ "DejaVu Sans Mono" "Font Awesome 6 Free" ];
          size = 12.0;
        };
        position = "top";
        statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
      }];
      input = {
        # https://major.io/2022/05/24/sway-reload-causes-a-firefox-crash/
        # "type:keyboard" = {
        #   xkb_options = "caps:escape,altwin:prtsc_rwin";
        # };
        "1:1:AT_Translated_Set_2_keyboard" = {
          xkb_options = "caps:escape,altwin:prtsc_rwin";
        };
        "1452:272:Bluetooth_Keyboard" = {
          xkb_options = "caps:escape";
        };
        "type:touchpad" = {
          dwt = "enabled";
          middle_emulation = "enabled";
          natural_scroll = "enabled";
          tap = "enabled";
        };
      };
      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in
        lib.mkOptionDefault {
          # take screenshot
          "Control+Mod1+a" = ''exec ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy --type image/png && ${pkgs.wl-clipboard}/bin/wl-paste > $(${pkgs.xdg-user-dirs}/bin/xdg-user-dir PICTURES)/$(date +'%Y%m%d_%H%M%S_grim.png')'';
          "Control+Mod1+s" = "exec ${pkgs.grim}/bin/grim -o $(swaymsg -t get_outputs | ${pkgs.jq}/bin/jq --raw-output '.[] | select(.focused) | .name') - | ${pkgs.wl-clipboard}/bin/wl-copy --type image/png && ${pkgs.wl-clipboard}/bin/wl-paste > $(${pkgs.xdg-user-dirs}/bin/xdg-user-dir PICTURES)/$(date +'%Y%m%d_%H%M%S_grim.png')";
          # recording
          "Control+Mod1+r" = "exec ${pkgs.wf-recorder}/bin/wf-recorder -o $(swaymsg -t get_outputs | ${pkgs.jq}/bin/jq --raw-output '.[] | select(.focused) | .name') -c h264_vaapi -d /dev/dri/renderD128 -f $(${pkgs.xdg-user-dirs}/bin/xdg-user-dir VIDEOS)/$(date +'recording_%Y%m%d_%H%M%S.mp4')";
          "Control+Mod1+BackSpace" = "exec ${pkgs.killall}/bin/killall -s SIGINT wf-recorder";
          # lockscreen
          "Control+${modifier}+l" = "exec ${pkgs.swaylock}/bin/swaylock -eFki ${pkgs.sway}/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png";
          # start your launcher
          "${modifier}+space" = "exec ${config.wayland.windowManager.sway.config.menu}";
          # Switch workspace
          "${modifier}+p" = "workspace prev_on_output";
          "${modifier}+n" = "workspace next_on_output";
          "${modifier}+Backslash" = "workspace back_and_forth";
          # Move container to workspace
          "${modifier}+Shift+p" = "move container to workspace prev_on_output";
          "${modifier}+Shift+n" = "move container to workspace next_on_output";
          "${modifier}+Shift+Backslash" = "move container to workspace back_and_forth";
          # Switch application
          "${modifier}+c" = ''[app_id="google-chrome"] focus'';
          "${modifier}+d" = ''[app_id="DBeaver"] focus'';
          "${modifier}+f" = ''[app_id="firefox"] focus'';
          "${modifier}+s" = ''[class="Slack"] focus'';
          "${modifier}+t" = ''[app_id="org.wezfurlong.wezterm"] focus'';

          "Control+${modifier}+a" = "focus parent";
          "Control+${modifier}+f" = "fullscreen";
          "Control+${modifier}+v" = "splith";
          "Control+${modifier}+s" = "splitv";
          # Switch the current container between different layout styles
          "Control+${modifier}+w" = "layout stacking";
          "Control+${modifier}+t" = "layout tabbed";
          "Control+${modifier}+e" = "layout toggle split";
          # Toggle the current focus between tiling and floating mode
          "${modifier}+Mod1+m" = "floating toggle";
          # Swap focus between the tiling area and the floating area
          "Control+${modifier}+m" = "focus mode_toggle";

          # Hot keys
          "XF86AudioRaiseVolume" = "exec --no-startup-id pulsemixer --change-volume +5";
          "XF86AudioLowerVolume" = "exec --no-startup-id pulsemixer --change-volume -5";
          "XF86AudioMute" = "exec --no-startup-id pulsemixer --toggle-mute";
          "XF86MonBrightnessDown" = "exec --no-startup-id ${pkgs.light}/bin/light -U 10";
          "XF86MonBrightnessUp" = "exec --no-startup-id ${pkgs.light}/bin/light -A 10";
          "XF86Sleep" = "exec systemctl suspend";
          "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
          "XF86AudioStop" = "exec ${pkgs.playerctl}/bin/playerctl stop";
          "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
          "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        };
      menu = "${pkgs.wofi}/bin/wofi --gtk-dark --insensitive --show drun";
      modifier = "Mod4";
      output = { "*".bg = "${pkgs.sway}/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png fill"; };
      startup = [
        { command = "${pkgs.mako}/bin/mako"; }
        {
          command = ''
            ${pkgs.swayidle}/bin/swayidle -w \
                    timeout 900  "${pkgs.swaylock}/bin/swaylock -efFki ${pkgs.sway}/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png" \
                    timeout 1800  "swaymsg 'output * dpms off'" \
                          resume "swaymsg 'output * dpms on'" \
                    timeout 7200 "systemctl suspend"
          '';
        }
      ];
      terminal = "wezterm";
      window = {
        commands = [
          {
            command = "inhibit_idle fullscreen";
            criteria.app_id = "firefox";
          }
          {
            command = "floating enable";
            criteria = {
              app_id = "firefox";
              title = "Picture-in-Picture";
            };
          }
          {
            command = "inhibit_idle fullscreen";
            criteria.app_id = "google-chrome";
          }
          {
            # File upload etc.
            command = "floating enable";
            criteria.app_id = "xdg-desktop-portal-gtk";
          }
          {
            command = "floating enable";
            criteria.app_id = "org.fcitx.";
          }
          {
            command = "floating enable";
            criteria.app_id = "pavucontrol";
          }
        ];
      };
      workspaceOutputAssign = [
        { workspace = "1"; output = "eDP-1"; }
        { workspace = "2"; output = "eDP-1"; }
        { workspace = "3"; output = "eDP-1"; }
        { workspace = "4"; output = "eDP-1"; }
        { workspace = "4"; output = "eDP-1"; }
        { workspace = "chrome"; output = "eDP-1"; }
        { workspace = "db"; output = "eDP-1"; }
        { workspace = "slack"; output = "eDP-1"; }
        { workspace = "5"; output = "DP-3 eDP-1"; }
        { workspace = "6"; output = "DP-3 eDP-1"; }
        { workspace = "7"; output = "DP-3 eDP-1"; }
        { workspace = "8"; output = "DP-3 eDP-1"; }
        { workspace = "9"; output = "DP-3 eDP-1"; }
        { workspace = "dolphin"; output = "DP-3 eDP-1"; }
        { workspace = "firefox"; output = "DP-3 eDP-1"; }
        { workspace = "postman"; output = "DP-3 eDP-1"; }
      ];
      assigns = {
        "chrome" = [{ app_id = "google-chrome"; }];
        "db" = [{ app_id = "DBeaver"; }];
        "dolphin" = [{ app_id = "org.kde.dolphin"; }];
        "firefox" = [{ app_id = "firefox"; }];
        "postman" = [{ class = "Postman"; }];
        "slack" = [{ class = "Slack"; }];
      };
    };
  };
}
