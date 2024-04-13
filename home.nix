{ config, pkgs, ... }:

{
  home.username = "gerald";
  home.homeDirectory = "/home/gerald";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    firefox
    xmobar
    killall
    rofi
    spotify
    telegram-desktop
    pavucontrol
  ];

  home.sessionVariables = {
    TERMINAL = "alacritty";
    BROWSER = "firefox";
  };

  imports = [ 
    (import ./modules/xmonad)
    (import ./modules/xmobar)
    (import ./modules/alacritty)
    (import ./modules/git)
    (import ./modules/nvim)
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
}
