{
  programs.helix = {
    enable = true;
    settings = {
      theme = "solarized_dark";
      editor.indent-guides = {
        render = true;
      };
      keys.normal = {
        space.w = ":w";
        space.q = ":qa";
      };
    };
  };
}
