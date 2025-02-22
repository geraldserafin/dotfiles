{ pkgs, ... }:

{
  home.packages = with pkgs; [
    killall
    telegram-desktop
    pavucontrol
    spotify
    postman
    lazygit
    obsidian
    ripgrep
    maim
    xclip
    feh
    libnotify
    brave
    dconf
    path-of-building
    firefox

  ];

  home.sessionVariables.TERMINAL = "kitty";

  dotfiles = {
    alacritty.enable = true;
    kitty.enable = true;
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
    bash.enable = true;
    pomodoro-clock-cli.enable = true;
    discord.enable = true;
    zen-browser.enable = true;
  };
}
