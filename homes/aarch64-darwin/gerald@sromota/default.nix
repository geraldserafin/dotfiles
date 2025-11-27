{ pkgs, lib, namespace, ... }:

let inherit (lib.${namespace}) enabled;
in {
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    killall
    lazygit
    ripgrep
    libnotify
    dconf
    yazi
    gemini-cli
    devenv
    live-server
    # google-chrome
  ];

  home.sessionVariables.TERMINAL = "kitty";
  home.stateVersion = "23.11";

  fonts.fontconfig.enable = true;

  dotfiles = {
    kitty = enabled;
    git = enabled // {
      userName = "geraldserafin";
      userEmail = "serafingerald@protonmail.com";
    };
    neovim = enabled;
    tmux = enabled;
    zsh = enabled;
    starship = enabled;
    direnv = enabled;
  };
}
