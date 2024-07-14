{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.dunst;
in {

  options.${namespace}.dunst = {
    enable = mkBoolOption "Weather to enable Dunst";
  };

  config = lib.mkIf cfg.enable {
    services.dunst = {
      enable = true;
      settings = {
        global = {
          origin = "bottom-right";
          offset = "4x4";
        };
      };
    };
  };
}
