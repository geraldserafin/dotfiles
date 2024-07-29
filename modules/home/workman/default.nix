{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.workman;
in {
  options.${namespace}.workman.enable =
    mkBoolOption "Weather to enable Workman keyboard layout";

  config = lib.mkIf cfg.enable {
    home.keyboard = {
      layout = "workman_pl";
      options = [ "caps:escape" ];
    };
  };
}
