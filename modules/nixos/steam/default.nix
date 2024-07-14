{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.steam;
in {
  options.${namespace}.steam.enable = mkBoolOption "Weather to enable Steam";
  config = lib.mkIf cfg.enable { programs.steam.enable = true; };
}
