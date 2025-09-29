{ ... }: {
  system.stateVersion = 5;
  system.primaryUser = "gerald";

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  nix.settings.download-buffer-size = 536870912; # 512MB
}
