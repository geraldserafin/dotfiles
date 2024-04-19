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
    telegram-desktop
    pavucontrol
    gcc
    lua-language-server
    stylua
    nixd
    nixfmt-classic
    zsh-powerlevel10k
    spotify
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
    (import ./modules/zsh)
    (import ./modules/tmux)
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
}
