{ config, lib, namespace, ... }:

lib.${namespace}.mkModule "rmpc" config {
  config = {
    programs.rmpc.enable = true;
    xdg.configFile."rmpc/config.ron".source = ./config.ron;
  };
}
