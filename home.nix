{ pkgs, ... }:

{
  home.username = "gerald";
  home.stateVersion = "23.11";
  home.sessionVariables = {
    TERMINAL = "alacritty";
    BROWSER = "firefox";
  };

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    xmobar
    firefox
    killall
    telegram-desktop
    pavucontrol
    gcc
    lua-language-server
    stylua
    nixd
    nixfmt-classic
    zsh-powerlevel10k
    spotify
    postman
    discord
    lazygit
    obsidian
    google-chrome
    ripgrep
    rofi-screenshot
    maim
    xclip
    tor
    steam
    feh
  ];

  home.keyboard = { variant = "workman"; };

  imports = [
    (import ./modules/wallpaper)
    (import ./modules/xmonad)
    (import ./modules/xmobar)
    (import ./modules/git)
    (import ./modules/alacritty)
    (import ./modules/nvim)
    (import ./modules/zsh)
    (import ./modules/tmux)
    (import ./modules/rofi)
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
}
