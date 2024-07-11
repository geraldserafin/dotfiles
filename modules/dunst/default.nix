{ ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        foreground = "#959595";
        background = "#292929";
        frame_color = "#3c3c3c";
        font = "JetBrainsMono Nerd Font 9";
        progress_bar = true;
        origin = "bottom-right";
        offset = "2x2";
      };
    };
  };
}
