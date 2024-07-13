{ ... }:

{
  programs.rofi = {
    enable = true;
    font = "ZedMono Nerd Font 14";
    location = "center";
    extraConfig = { modi = "window,run,combi,keys,filebrowser"; };
    theme = ./black-mountains.rasi;
  };
}
