{
  services.kanshi = {
    enable = true;
    profiles = {
      home = {
        outputs = [
          {
            criteria = "DP-3";
            # mode = "3840x2160";
            position = "0,0";
          }
          {
            criteria = "eDP-1";
            # mode = "1920x1080";
            position = "3840,540";
          }
        ];
      };
      nomad = {
        outputs = [
          {
            criteria = "eDP-1";
            # mode = "";
            position = "0,0";
          }
        ];
      };
    };
  };
}
