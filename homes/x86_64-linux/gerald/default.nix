{
  pkgs,
  lib,
  inputs,
  config,
  namespace,
  system,
  ...
}:

let
  inherit (lib.${namespace}) enabled disabled;
in
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";

  manual.manpages.enable = false;
  manual.html.enable = false;
  manual.json.enable = false;

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
    gemini-cli
    livebook
    tree
    postman
    devenv
    chromium
    btop
    pkgs.llm-agents.claude-code
    pkgs.llm-agents.pi
    inputs.helium.packages.${system}.default
    jujutsu
  ];

  home.sessionVariables = {
    TERMINAL = "kitty";
    BROWSER = "zen";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen-twilight.desktop";
      "x-scheme-handler/http" = "zen-twilight.desktop";
      "x-scheme-handler/https" = "zen-twilight.desktop";
      "x-scheme-handler/about" = "zen-twilight.desktop";
      "x-scheme-handler/unknown" = "zen-twilight.desktop";
    };
  };

  home.activation.cleanupBackups = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    $DRY_RUN_CMD find  $HOME -name "*.home-backup" -type f -delete
  '';

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ inputs.llm-agents.overlays.default ];
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
    kitty = enabled // {
      setAsDefault = true;
    };
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
    ghostty = enabled;
    opencode = enabled;
    emacs = enabled;
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
