{ ... }:

{
  home.stateVersion = "23.11";
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}
