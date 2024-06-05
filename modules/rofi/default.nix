{ ... }:

{
  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font 14";
    location = "center";
    extraConfig = { modi = "window,run,combi,keys,filebrowser"; };
    theme = ./black-mountains.rasi;
  };
}
