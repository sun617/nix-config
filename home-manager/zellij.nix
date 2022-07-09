{
  programs.zellij = {
    enable = true;
    settings = {
      scrollback_editor = "hx";
      theme = "solarized-dark";
      themes.solarized-dark = {
        bg = [0 43 54];
        red = [220 50 47];
        green = [133 153 0];
        yellow = [181 137 0];
        blue = [38 139 210];
        magenta = [211 54 130];
        orange = [203 75 22];
        fg = [253 246 227];
        cyan = [42 161 152];
        black = [7 54 66];
        white = [238 232 213];
      };
      ui.pane_frames.rounded_corners = true;
    };
  };

  programs.fish.shellAbbrs = {
    zj = "zellij";
  };
}
