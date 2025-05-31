{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.direnv;
in {
  options.${namespace}.direnv.enable = mkBoolOption "Weather to enable Direnv";

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
