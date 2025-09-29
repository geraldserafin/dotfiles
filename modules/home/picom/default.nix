{ config, lib, ... }:

lib.dotfiles.mkModule "picom" config {
  config = {
    services.picom = {
      enable = true;
      vSync = true;
      settings.blur.method = "dual_kawase";
    };
  };
}
