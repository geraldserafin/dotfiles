{ inputs, pkgs, ... }:

{
  imports = [
    (import ./modules/xmonad)
    (import ./modules/xmobar)
    (import ./modules/git)
    (import ./modules/alacritty)
    (import ./modules/nvim)
    (import ./modules/zsh)
    (import ./modules/tmux)
    (import ./modules/rofi)
    (import ./modules/openpomodoro-cli)
    (import ./modules/dunst)
    inputs.stylix.homeManagerModules.stylix
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
      (nerdfonts.override { fonts = [ "JetBrainsMono" "ZedMono" ]; })
      xmobar
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
      ripgrep
      rofi-screenshot
      maim
      xclip
      tor-browser
      feh
      neofetch
      libnotify
      brave
      dconf
      audacity
    ];
  };

  stylix = {
    enable = true;
    image = ./background-image.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets = {
      rofi.enable = false;
      vim.enable = false;
    };
    fonts = {
      sizes = { terminal = 18; };
      monospace = {
        name = "ZedMono Nerd Font";
        package = pkgs.nerdfonts.override { fonts = [ "ZedMono" ]; };
      };
    };
  };

  services.picom = {
    enable = true;
    vSync = true;
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
}
