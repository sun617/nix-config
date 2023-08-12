{ pkgs, ... }:

{
  imports = [
    ./waybar.nix
  ];

  programs.fish.loginShellInit = ''
    if test (tty) = /dev/tty1
      exec Hyprland > /tmp/hyprland-"$(date +%Y%m%d%H%M)".log 2>&1
    end
  '';

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = false;
    };
    settings = {
      # See https://wiki.hyprland.org/Configuring/Monitors/
      # monitor=,preferred,auto,auto
      monitor = [
        "DP-3,preferred,0x0,1"
        "eDP-1,preferred,3840x540,1"
      ];


      # See https://wiki.hyprland.org/Configuring/Keywords/ for more

      # Execute your favorite apps at launch
      # exec-once = waybar & hyprpaper & firefox
      # exec-once = xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 1

      # Source a file (multi-file configs)
      # source = ~/.config/hypr/myColors.conf

      # Some default env vars.
      env = [
        "XCURSOR_SIZE,24"
      ];

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";

          layout = "dwindle";
      };

      decoration = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          rounding = 10;

          blur = {
            enabled = true;
            size = 3;
            passes = 1;
          };

          drop_shadow = "yes";
          shadow_range = 4;
          shadow_render_power = 3;
          "col.shadow" = "rgba(1a1a1aee)";
      };

      # animations = {
      #     enabled = "yes";

      #     # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

      #     bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      #     animation = [
      #       "windows, 1, 7, myBezier"
      #       "windowsOut, 1, 7, default, popin 80%"
      #       "border, 1, 10, default"
      #       "borderangle, 1, 8, default"
      #       "fade, 1, 7, default"
      #       "workspaces, 1, 6, default"
      #     ];
      # };

      dwindle = {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = "yes"; # you probably want this
      };

      master = {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true;
      };

      gestures = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = "off";
      };

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      "device:epic-mouse-v1" = {
          sensitivity = -0.5;
      };

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      workspace = [
        "name:firefox, monitor:DP-3"
        "name:slack, monitor:eDP-1"
      ];
      windowrulev2 = [
        "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
        "float,class:^(firefox)$,title:^(Firefox — Sharing Indicator)$"
        "float,class:^(org.fcitx.)$"
        "float,class:^(imv)$"
        "workspace name:firefox,class:^(firefox)$"
        "workspace name:slack,class:^(Slack)$"
      ];

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      "$mainMod" = "SUPER";

      bind = [
        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        # Launch
        "$mainMod, Return, exec, wezterm"
        "$mainMod, space, exec, wofi --show drun"
        # take screenshot
        ''CONTROL $mainMod, a, exec, ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy --type image/png && ${pkgs.wl-clipboard}/bin/wl-paste > $(${pkgs.xdg-user-dirs}/bin/xdg-user-dir PICTURES)/$(date +'%Y%m%d_%H%M%S_grim.png')''
        "CONTROL $mainMod, s, exec, ${pkgs.grim}/bin/grim -o $(hyprctl -j monitors | ${pkgs.jq}/bin/jq --raw-output '.[] | select(.focused) | .name') - | ${pkgs.wl-clipboard}/bin/wl-copy --type image/png && ${pkgs.wl-clipboard}/bin/wl-paste > $(${pkgs.xdg-user-dirs}/bin/xdg-user-dir PICTURES)/$(date +'%Y%m%d_%H%M%S_grim.png')"
        # recording
        "CONTROL $mainMod, r, exec, ${pkgs.wf-recorder}/bin/wf-recorder -o $(hyprctl -j monitors | ${pkgs.jq}/bin/jq --raw-output '.[] | select(.focused) | .name') -c h264_vaapi -d /dev/dri/renderD128 -f $(${pkgs.xdg-user-dirs}/bin/xdg-user-dir VIDEOS)/$(date +'recording_%Y%m%d_%H%M%S.mp4')"
        "CONTROL $mainMod, BackSpace, exec, ${pkgs.killall}/bin/killall -s SIGINT wf-recorder"
        # lockscreen
        "CONTROL $mainMod, l, exec, ${pkgs.swaylock}/bin/swaylock -eFki ${pkgs.hyprland}/share/hyprland/wall_4K.png"

        # Focus app window
        "$mainMod, a, focuswindow, ^(Insomnia)$"
        "$mainMod, b, focuswindow, ^(firefox)$"
        "$mainMod, c, focuswindow, ^(google-chrome)$"
        "$mainMod, d, focuswindow, ^(DBeaver)$"
        "$mainMod, e, focuswindow, ^(Microsoft-edge)$"
        "$mainMod, m, focuswindow, ^(Slack)$"
        "$mainMod, s, focuswindow, ^(RedisInsight-v2)$"
        "$mainMod, t, focuswindow, ^(org.wezfurlong.wezterm)$"
        "$mainMod, v, focuswindow, ^(Code - Insiders)$"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        # Move focus with mainMod + hjkl
        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"
        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        # Switch next or previous existing workspaces with mainMod + [np]
        "$mainMod, n, workspace, e+1"
        "$mainMod, p, workspace, e-1"
        "$mainMod, backslash, workspace, previous"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        # Move active window to next or previous existing workspaces with mainMod + SHIFT + [np]
        "$mainMod SHIFT, n, movetoworkspace, e+1"
        "$mainMod SHIFT, p, movetoworkspace, e-1"
        "$mainMod SHIFT, backslash, movetoworkspace, previous"
        # Move active window in a direction
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

        # Dispatchers
        "$mainMod ALT, e, exit"
        "$mainMod ALT, f, fullscreen"
        "$mainMod ALT, m, togglefloating"
        "$mainMod ALT, p, pseudo"
        "$mainMod ALT, q, killactive"
        "$mainMod ALT, s, togglesplit"

        # Hot keys
        ",XF86AudioRaiseVolume, exec, pulsemixer --change-volume +5"
        ",XF86AudioLowerVolume, exec, pulsemixer --change-volume -5"
        ",XF86AudioMute, exec, pulsemixer --toggle-mute"
        ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ",XF86AudioStop, exec, ${pkgs.playerctl}/bin/playerctl stop"
        ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
        ",XF86MonBrightnessDown, exec, ${pkgs.light}/bin/light -U 10"
        ",XF86MonBrightnessUp, exec, ${pkgs.light}/bin/light -A 10"
        ",XF86Sleep, exec, systemctl suspend"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
