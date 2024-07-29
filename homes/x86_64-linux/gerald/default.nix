{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "ZedMono" ]; })
    killall
    telegram-desktop
    pavucontrol
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
    neovim.enable = true;
    rofi.enable = true;
    tmux.enable = true;
    xmobar.enable = true;
    xmonad.enable = true;
    picom.enable = true;
    zsh.makeDefault = true;
    zsh.enable = true;
    bash.enable = true;
    workman.enable = true;
  };
}
