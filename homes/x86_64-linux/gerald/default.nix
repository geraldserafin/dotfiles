{ pkgs, ... }:

{
  home.packages = with pkgs; [
    killall
    telegram-desktop
    pavucontrol
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
    path-of-building
    jetbrains.idea-community
    reaper
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
    workman.enable = true;
    pomodoro-clock-cli.enable = true;
  };
}
