{ inputs, ... }:

{
  imports =
    [ ./hardware-configuration.nix inputs.home-manager.nixosModules.default ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "babylon";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.picom = {
    enable = true;
    vSync = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;

  services.xserver = {
    enable = true;
    displayManager.session = [{
      manage = "desktop";
      name = "xsession";
      start = "";
    }];
    xkb = {
      layout = "us,pl";
      variant = "workman,";
    };
  };

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

  users.users.gerald = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "gerald" = import ./home.nix; };
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}
