{ config, pkgs, inputs, ... }:

{
  imports =
    [ ./hardware-configuration.nix inputs.home-manager.nixosModules.default ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "babylon";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.xserver = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
    displayManager.sessionCommands = ''
      xrandr --output "DVI-D-1" --primary --left-of "DP-1"
    '';
    xkb = {
      layout = "pl";
      variant = "";
    };
  };

  # services.postgresql = {
  #   enable = true;
  #   package = pkgs.postgresql_15;
  #   settings.port = 5432;
  #   authentication = pkgs.lib.mkOverride 10 ''
  #     			#type database  DBuser  auth-method
  #           local all       all												trust
  #           host	all				all			127.0.0.1/32			trust
  #   '';
  #   extraPlugins = with pkgs.postgresql15Packages; [ pgvector ];
  # };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  console.keyMap = "pl2";

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      zstyle ':grml:completion:compinit' arguments -C
      source ${pkgs.grml-zsh-config}/etc/zsh/zshrc
      autoload -Uz compinit
      if [[ -n ${"ZDOTDIR:-$HOME"}/.zcompdump(#qN.mh+24) ]]; then
        compinit
      else
        # We don't do `compinit -C` here because the GRML zshrc already did it above.
      fi
    '';
    promptInit = "";
    enableGlobalCompInit = false;
  };

  users.users.gerald = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "gerald" = import ./home.nix; };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ ];

  environment.variables.EDITOR = "nvim";

  system.stateVersion = "23.11";
}
