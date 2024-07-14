{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.picom;
in {

  options.${namespace}.picom = {
    enable = mkBoolOption "Weather to enable Picom";
  };

  config = lib.mkIf cfg.enable {
    services.picom = {
      enable = true;
      vSync = true;
    };
  };
}
