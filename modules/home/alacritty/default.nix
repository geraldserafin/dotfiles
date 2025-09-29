{ config, lib, namespace, ... }:

lib.${namespace}.mkModule "alacritty" config {
  config = {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          decorations = "None";
          opacity = lib.mkForce 0.9;
        };
        env.TERM = "alacritty-direct";
      };
    };
  };
}
