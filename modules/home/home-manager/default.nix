{ ... }:

{
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
}
