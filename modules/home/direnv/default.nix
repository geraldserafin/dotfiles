{ config, lib, namespace, ... }:

lib.${namespace}.mkModule "direnv" config {
  config = {
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
