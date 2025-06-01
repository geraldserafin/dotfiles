{ pkgs, ... }:

{
  programs.home-manager.enable = true;

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
  home.stateVersion = "23.11";

  fonts.fontconfig.enable = true;

  dotfiles = {
    kitty.enable = true;
    git = {
      enable = true;
      userName = "geraldserafin";
      userEmail = "serafingerald@protonmail.com";
    };
    neovim.enable = true;
    tmux.enable = true;
    zsh.enable = true;
    discord.enable = true;
  };
}
