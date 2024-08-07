{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = { networkmanager.enable = true; };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.pulseaudio.enable = true;

  nixpkgs.config = {
    pulseaudio = true;
    allowUnfree = true;
  };

  services = {
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

  home-manager.backupFileExtension = "backup";

  dotfiles = {
    steam.enable = true;
    workman.enable = true;
  };
}
