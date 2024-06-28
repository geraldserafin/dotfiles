{ pkgs, ... }:

{
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
    (import ./modules/openpomodoro-cli)
  ];

  home = {
    username = "gerald";
    stateVersion = "23.11";
    sessionVariables = {
      TERMINAL = "alacritty";
      BROWSER = "firefox";
    };
    keyboard.variant = "workman";
    packages = with pkgs; [
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
      tor-browser
      feh
      openpomodoro-cli
      neofetch
    ];
  };

  services.picom = {
    enable = true;
    vSync = true;
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
}
