{ config, lib, namespace, ... }:

lib.${namespace}.mkModule "firefox" config {
  config = { programs.firefox.enable = true; };
}
