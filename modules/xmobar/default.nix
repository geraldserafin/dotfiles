{ pkgs, ... }:

{
  xdg.configFile."/home/gerald/.config/xmobar/xmobarrc".source = ./xmobarrc;
}
