{ ... }: {
  system.stateVersion = 5;
  nixpkgs.config.allowUnfree = true;
  services.nix-daemon.enable = true;

  dotfiles = { aerospace.enable = true; };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };
}
