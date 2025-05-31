{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.rmpc;
in {
  options.${namespace}.rmpc.enable = mkBoolOption "Wether to enable rmpc";

  config = lib.mkIf cfg.enable {
    programs.rmpc.enable = true;
    xdg.configFile."rmpc/config.ron".source = ./config.ron;
  };
}
