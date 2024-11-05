{ pkgs, ... }:

{
  home.packages = with pkgs; [
    killall
    telegram-desktop
    spotify
    postman
    lazygit
    obsidian
    ripgrep
    libnotify
    dconf
    arc-browser
    snowfallorg.flake
  ];

  home.sessionVariables.TERMINAL = "kitty";

  dotfiles = {
    kitty.enable = true;
    git = {
      enable = true;
      userName = "geraldserafin";
      userEmail = "serafingerald@protonmail.com";
    };
    neovim.enable = true;
    tmux.enable = true;
    bash.enable = true;
    workman.enable = true;
    pomodoro-clock-cli.enable = true;
    discord.enable = true;
  };
}
