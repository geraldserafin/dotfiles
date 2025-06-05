{ pkgs, lib, inputs, config, ... }:

{
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
    godot
    sops
    ncmpc
  ];

  home.sessionVariables = { TERMINAL = "kitty"; };

  home.activation.cleanupBackups =
    lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      $DRY_RUN_CMD find  $HOME -name "*.home-backup" -type f -delete
    '';

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

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
    neovim.defaultEditor = true;
    rofi.enable = true;
    tmux.enable = true;
    xmobar.enable = true;
    xmonad.enable = true;
    picom.enable = true;
    bash.enable = true;
    discord.enable = true;
    zen-browser.enable = true;
    direnv.enable = true;
    ncspot.enable = true;
    starship.enable = true;
  };

  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    secrets = {
      spotify-client-id = { };
      spotify-client-secret = { };
    };
  };
}
