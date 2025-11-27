{ ... }: {
  system.stateVersion = 5;
  system.primaryUser = "gerald";

  nix.settings = {
    trusted-users = [ "root" "gerald" ];
    download-buffer-size = 524288000;
  };

  # home-manager.useGlobalPkgs = true;
  home-manager.useGlobalPkgs = false;
  # home-manager.useUserPackages = true;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };
}
