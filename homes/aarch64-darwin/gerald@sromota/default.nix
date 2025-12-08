{
  pkgs,
  lib,
  namespace,
  ...
}:

let
  inherit (lib.${namespace}) enabled;
in
{
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    killall
    lazygit
    ripgrep
    libnotify
    dconf
    yazi
    gemini-cli
    live-server
    telegram-desktop
    claude-code
    jujutsu
    devenv
    sox
    spec-kit
  ];

  home.sessionVariables.TERMINAL = "kitty";
  home.stateVersion = "23.11";

  home.activation = {
    rsync-home-manager-applications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      rsyncArgs="--archive --checksum --chmod=-w --copy-unsafe-links --delete"
      apps_source="$genProfilePath/home-path/Applications"
      monterey_apps_target="$HOME/Applications/Nix Apps"
      mkdir -p "$monterey_apps_target"
      ${pkgs.rsync}/bin/rsync $rsyncArgs "$apps_source/" "$monterey_apps_target"
    '';
  };

  manual.manpages.enable = false;
  manual.html.enable = false;
  manual.json.enable = false;

  fonts.fontconfig.enable = true;

  dotfiles = {
    kitty = enabled;
    ghostty = enabled;
    git = enabled // {
      userName = "geraldserafin";
      userEmail = "serafingerald@protonmail.com";
    };
    firefox = enabled;
    neovim = enabled;
    tmux = enabled;
    zsh = enabled;
    nushell = enabled;
    starship = enabled;
    direnv = enabled;
    opencode = enabled;
  };
}
