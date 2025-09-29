{ config, lib, namespace, ... }:

lib.${namespace}.mkModule "rofi" config {
  config = {
    programs.rofi = {
      enable = true;
      font = lib.mkForce "${config.stylix.fonts.monospace.name} 17";
      location = "center";
      extraConfig = { modi = "window,run,combi,keys,filebrowser"; };
    };
  };
}
