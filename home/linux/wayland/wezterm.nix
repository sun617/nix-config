{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local act = wezterm.action

      wezterm.on('update-right-status', function(window, pane)
        window:set_right_status(window:active_workspace())
      end)

      return {
        -- appearances
        font = wezterm.font_with_fallback({
          'JetBrains Mono',
          'Noto Sans Mono CJK JP',
        }),
        color_scheme = 'Solarized Dark Higher Contrast',
        use_fancy_tab_bar = false,
        tab_bar_at_bottom = true,
        tab_max_width = 80,
        -- key bindings
        leader = { key = ';', mods = 'CTRL', timeout_milliseconds = 2000 },
        keys = {
          -- disable default assignment
          { key = 'Enter', mods = 'ALT', action = act.DisableDefaultAssignment },
          -- copy mode
          { key = '/', mods = 'LEADER', action = act.Search('CurrentSelectionOrEmptyString') },
          { key = 'c', mods = 'LEADER', action = act.ActivateCopyMode },
          { key = 'q', mods = 'LEADER', action = act.QuickSelect },
          -- pane
          { key = 's', mods = 'LEADER', action = act.SplitVertical{ domain = 'CurrentPaneDomain' } },
          { key = 'v', mods = 'LEADER', action = act.SplitHorizontal{domain = 'CurrentPaneDomain' } },
          { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection('Left') },
          { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection('Right') },
          { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection('Up') },
          { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection('Down') },
          { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },
          -- tab
          { key = 'n', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain') },
          { key = 'j', mods = 'LEADER|CTRL', action = act.ActivateTabRelative(-1) },
          { key = 'k', mods = 'LEADER|CTRL', action = act.ActivateTabRelative(1) },
          -- workspace
          { key = 'N', mods = 'LEADER', action = act.SwitchToWorkspace },
          { key = ' ', mods = 'LEADER', action = act.ShowLauncherArgs{ flags = 'FUZZY|WORKSPACES' } },
          { key = 'K', mods = 'LEADER', action = act.SwitchWorkspaceRelative(1) },
          { key = 'J', mods = 'LEADER', action = act.SwitchWorkspaceRelative(-1) },
        },
        -- https://github.com/wez/wezterm/pull/5264
        enable_wayland = false
      }
    '';
  };
}
