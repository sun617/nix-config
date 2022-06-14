{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sun";
  home.homeDirectory = "/home/sun";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.awscli2
    # pkgs.ssm-session-manager-plugin
    # pkgs.aws-client-vpn
    pkgs.bat
    pkgs.bottom
    pkgs.curl
    pkgs.fd
    pkgs.gopls
    pkgs.jq
    pkgs.nodePackages.typescript-language-server
    pkgs.nodePackages.vls
    pkgs.nodePackages.vscode-langservers-extracted
    pkgs.nodePackages.yaml-language-server
    pkgs.ripgrep
    pkgs.rnix-lsp
    pkgs.rustup
    pkgs.rust-analyzer
    pkgs.skim
    pkgs.sumneko-lua-language-server
    pkgs.unar
    pkgs.zip
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Hongri Cui";
    userEmail = "hongri.cui@gmail.com";
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 10;
    keyMode = "vi";
    prefix = "'C-\\'";
    terminal = "screen-256color";

    extraConfig = ''
      set-option -g  focus-events on
      # set-option -g  history-limit 100000
      set-option -g  renumber-windows on
      set-option -ag update-environment I3SOCK
      set-option -ag update-environment SWAYSOCK
      set-option -as terminal-overrides ",foot:Tc"

      # source config
      # bind s source-file ~/.tmux.conf
      source-file -q ~/.local/share/nvim/site/pack/packer/start/nightfox.nvim/extra/nightfox/nightfox_tmux.tmux

      # server
      bind-key q confirm-before -p "kill-server? (y/n)" kill-server

      # session
      bind-key -T root M-Space choose-tree -s
      bind-key -T root M-N command-prompt "new-session -s '%%'"
      bind-key -T root M-L switch-client -n
      bind-key -T root M-H switch-client -p
      bind-key -T root 'M-;' switch-client -l

      # window
      bind-key -T root M-n new-window -c "#{pane_current_path}"
      bind-key -T root M-K next-window
      bind-key -T root M-J previous-window
      bind-key -T root M-/ choose-tree -w
      bind-key -T root 'M-\' last-window
      bind-key -T root M-1 select-window -t :=1
      bind-key -T root M-2 select-window -t :=2
      bind-key -T root M-3 select-window -t :=3
      bind-key -T root M-4 select-window -t :=4
      bind-key -T root M-5 select-window -t :=5
      bind-key -T root M-6 select-window -t :=6
      bind-key -T root M-7 select-window -t :=7
      bind-key -T root M-8 select-window -t :=8
      bind-key -T root M-9 select-window -t :=9

      # pane
      bind-key -T root M-h if-shell "[[ 'nvim' == $(tmux display-message -p '#{pane_current_command}') ]]" "send-keys M-h" "select-pane -L"
      bind-key -T root M-j if-shell "[[ 'nvim' == $(tmux display-message -p '#{pane_current_command}') ]]" "send-keys M-j" "select-pane -D"
      bind-key -T root M-k if-shell "[[ 'nvim' == $(tmux display-message -p '#{pane_current_command}') ]]" "send-keys M-k" "select-pane -U"
      bind-key -T root M-l if-shell "[[ 'nvim' == $(tmux display-message -p '#{pane_current_command}') ]]" "send-keys M-l" "select-pane -R"
      bind-key -T root M-s split-window -v -c "#{pane_current_path}"
      bind-key -T root M-v split-window -h -c "#{pane_current_path}"
      bind-key -T root M-z resize-pane -Z

      # copy-mode
      # bind-key -T root M-/ command-prompt -p "(search up)" "send -X search-backward \"%%%\""

      # popup
      bind-key -T root M-o display-popup -w 80% -h 80%
    '';

    plugins = with pkgs; [
      tmuxPlugins.resurrect
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
        '';
      }
    ];
  };

  # https://git.sr.ht/~jshholland/nixos-configs/tree/master/home/sway.nix
  wayland.windowManager.sway = {
    enable = true;
    config = {
      bars = [{
        fonts = {
          names = [ "DejaVu Sans Mono" "Font Awesome 6 Free" ];
          size = 12.0;
        };
        position = "top";
        statusCommand = "i3status-rs ~/.config/i3status-rs/config.toml";
      }];
      input = {
        "type:keyboard" = {
          xkb_options = "caps:escape,altwin:prtsc_rwin";
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
          "Control+Mod1+a" = ''exec grim -g "$(slurp)" - | wl-copy --type image/png && wl-paste > $(xdg-user-dir PICTURES)/$(date +'%Y%m%d_%H%M%S_grim.png')'';
          "Control+Mod1+s" = "exec grim -o $(swaymsg -t get_outputs | jq --raw-output '.[] | select(.focused) | .name') - | wl-copy --type image/png && wl-paste > $(xdg-user-dir PICTURES)/$(date +'%Y%m%d_%H%M%S_grim.png')";
          # recording
          "Control+Mod1+r" = "exec wf-recorder -o $(swaymsg -t get_outputs | jq --raw-output '.[] | select(.focused) | .name') -c h264_vaapi -d /dev/dri/renderD128 -f $(xdg-user-dir VIDEOS)/$(date +'recording_%Y%m%d_%H%M%S.mp4')";
          "Control+Mod1+BackSpace" = "exec killall -s SIGINT wf-recorder";
          # lockscreen
          "Control+${modifier}+l" = "exec swaylock -eFki /usr/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png";
          # start your launcher
          "${modifier}+Return" = "exec ${config.wayland.windowManager.sway.config.menu}";
          # Switch application
          "${modifier}+a" = ''[app_id="pavucontrol"] focus'';
          "${modifier}+c" = ''[class="Google-chrome"] focus'';
          "${modifier}+d" = ''[app_id="DBeaver"] focus'';
          "${modifier}+f" = ''[app_id="firefox"] focus'';
          "${modifier}+p" = ''[class="Postman"] focus'';
          "${modifier}+s" = ''[class="Slack"] focus'';
          "${modifier}+t" = ''[app_id="foot"] focus'';

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
          "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume 0 +5%";
          "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume 0 -5%";
          "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute 0 toggle";
          "XF86MonBrightnessDown" = "exec --no-startup-id light -U 10";
          "XF86MonBrightnessUp" = "exec --no-startup-id light -A 10";
          "XF86Sleep" = "exec systemctl suspend";
          "XF86AudioPlay" = "exec playerctl play-pause";
          "XF86AudioStop" = "exec playerctl stop";
          "XF86AudioPrev" = "exec playerctl previous";
          "XF86AudioNext" = "exec playerctl next";
        };
      menu = "wofi --insensitive --show drun";
      modifier = "Mod4";
      output = { "*".bg = "/usr/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png fill"; };
      startup = [
        { command = "udiskie --tray"; }
        { command = "fcitx5 -d"; }
        { command = "mako"; }
        { command = "swayrd"; }
        { command = "foot --server"; }
        { command = "pkill kanshi; exec kanshi"; always = true; }
        {
          command = ''
            swayidle -w \
                    timeout 900  "swaylock -efFki /usr/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png" \
                    timeout 1800  "swaymsg 'output * dpms off'" \
                          resume "swaymsg 'output * dpms on'" \
                    timeout 7200 "systemctl suspend"
          '';
        }
      ];
      terminal = "footclient";
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
            criteria.class = "Google-chrome";
          }
          {
            # File upload etc.
            command = "floating enable";
            criteria.app_id = "xdg-desktop-portal-gtk";
          }
          {
            command = "floating enable";
            criteria.class = "fcitx5-config-qt";
          }
          {
            command = "floating enable";
            criteria.app_id = "pavucontrol";
          }
        ];
      };
    };
  };

  # programs.fish = {
  #   enable = true;
  #   plugins = [
  #     {
  #       name="foreign-env";
  #       src = pkgs.fetchFromGitHub {
  #         owner = "oh-my-fish";
  #         repo = "plugin-foreign-env";
  #         rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
  #         sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
  #       };
  #     }
  #   ];
  #   shellInit = ''
  #     if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  #       fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  #     end
  #   '';
  # };
}
