{ lib, namespace, config, ... }:

lib.${namespace}.mkModule "dunst" config {
  config = {
    services.dunst = {
      enable = true;
      settings = {
        global = {
          origin = "bottom-right";
          offset = "4x4";
          frame_width = 2;
        };
      };
    };
  };
}
