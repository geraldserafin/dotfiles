{ pkgs, inputs, ... }:

{
  home.keyboard.variant = "workman";
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "ZedMono" ]; })
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
    maim
    xclip
    feh
    libnotify
    brave
    dconf
    audacity
  ];

  dotfiles = {
    alacritty.enable = true;
    dunst.enable = true;
    git = {
      enable = true;
      userName = "geraldserafin";
      userEmail = "serafingerald@protonmail.com";
    };
    nvim.enable = true;
    rofi.enable = true;
    tmux.enable = true;
    xmobar.enable = true;
    xmonad.enable = true;
    picom.enable = true;
    zsh.enable = true;
  };
}
