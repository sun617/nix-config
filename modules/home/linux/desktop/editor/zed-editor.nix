{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    bind = [ "$mainMod, z, workspace, name:Zed" ];
    windowrule = [ "workspace name:Zed,class:^(dev.zed.Zed)$" ];
  };
  programs.waybar.settings.mainBar."hyprland/workspaces".format-icons.Zed = "";

  programs.zed-editor = {
    enable = true;
    userKeymaps = [
      {
        context = "Editor && vim_mode == insert && !menu";
        bindings = {
          "ctrl-h" = "editor::Backspace";
          "ctrl-d" = "editor::Delete";
          "ctrl-k" = "editor::DeleteToEndOfLine";
          "ctrl-u" = "editor::DeleteToBeginningOfLine";
        };
      }
      {
        context = "EmptyPane || SharedScreen || vim_operator == none && !VimWaiting && vim_mode != insert";
        bindings = {
          "space /" = "pane::DeploySearch";
          "space b" = "tab_switcher::ToggleAll";
          "space c" = "pane::CloseActiveItem";
          "space w" = "workspace::SaveAll";
        };
      }
    ];

    userSettings = {
      helix_mode = true;

      languages = {
        Nix = {
          language_servers = [
            "nil"
            "!nixd"
          ];
        };
      };

      lsp = {
        nil = {
          binary = {
            path = "${pkgs.nil}/bin/nil";
          };
          initialization_options = {
            formatting = {
              command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
            };
          };
        };
      };
    };
  };
}
