{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 5;
  system.primaryUser = "gerald";

  nix = {
    package = pkgs.nixVersions.stable;
    linux-builder = {
      enable = true;
      ephemeral = true;
      maxJobs = 4;
      config = {
        virtualisation = {
          darwin-builder = {
            diskSize = 40 * 1024;
            memorySize = 8 * 1024;
          };
          cores = 6;
        };
      };
    };
    optimise.automatic = true;
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 2;
        Minute = 0;
      };
      options = "--delete-older-than 30d";
    };
    settings = {
      trusted-users = [ "@admin" "root" "gerald" ];
      download-buffer-size = 524288000;
    };
  };

  home-manager.useGlobalPkgs = false;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  environment.shells = [ pkgs.nushell ];
  users.users.gerald.shell = pkgs.nushell;
}
