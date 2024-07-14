{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.xmonad;
in {
  options.${namespace}.xmonad.enable = mkBoolOption "Weather to enable xmonad";

  config = lib.mkIf cfg.enable {
    xsession = {
      enable = true;
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = ./xmonad.hs;
      };
    };
  };
}
