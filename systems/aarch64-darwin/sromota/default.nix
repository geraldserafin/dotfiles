{ ... }: {
  system.stateVersion = 5;
  system.primaryUser = "gerald";

  dotfiles = { aerospace.enable = true; };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };
}
