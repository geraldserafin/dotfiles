{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    nameservers = [ "8.8.8.8" "1.1.1.1" ]; # Google + Cloudflare DNS
    enableIPv6 = false;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config = {
    pulseaudio = true;
    allowUnfree = true;
  };

  services = {
    pulseaudio.enable = false;
    xserver = {
      enable = true;
      displayManager.session = [{
        manage = "desktop";
        name = "xsession";
        start = "";
      }];
    };
  };

  environment.systemPackages = with pkgs; [ snowfallorg.flake ];

  time.timeZone = "Europe/Warsaw";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  console.keyMap = "pl2";
  system.stateVersion = "23.11";

  home-manager.backupFileExtension = "home-backup";
  home-manager.useGlobalPkgs = false;

  dotfiles = {
    steam.enable = true;
    workman.enable = true;
  };
}
