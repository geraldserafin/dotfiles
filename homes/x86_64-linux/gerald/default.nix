{ pkgs, lib, inputs, config, namespace, ... }:

let inherit (lib.${namespace}) enabled disabled;
in {
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
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
    vscode
    sops
    claude-code
    gemini-cli
    livebook
    tree
    postman
  ];

  home.sessionVariables = { TERMINAL = "kitty"; };

  home.activation.cleanupBackups =
    lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      $DRY_RUN_CMD find  $HOME -name "*.home-backup" -type f -delete
    '';

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  dotfiles = {
    alacritty = disabled;
    bash = enabled;
    direnv = enabled;
    dunst = enabled;
    git = enabled // {
      userName = "geraldserafin";
      userEmail = "serafingerald@protonmail.com";
    };
    helix = disabled;
    kitty = enabled;
    mopidy = disabled;
    mpd = disabled;
    ncmpcpp = disabled;
    ncspot = disabled;
    neovim = enabled;
    nushell = enabled;
    picom = enabled;
    pomodoro-clock-cli = disabled;
    rmpc = disabled;
    rofi = enabled;
    starship = enabled;
    tmux = enabled;
    vesktop = enabled;
    workman = disabled;
    xmobar = enabled;
    xmonad = enabled;
    zen-browser = enabled;
    zsh = disabled;
  };

  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    secrets = {
      spotify-client-id = { };
      spotify-client-secret = { };
      deepseek-api-key = { };
    };
  };
}
