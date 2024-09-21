{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.rofi;
  fonts = config.stylix.fonts;
in {
  options.${namespace}.rofi.enable = mkBoolOption "Weather to enable rofi";

  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      font = lib.mkForce "${fonts.monospace.name} 17";
      location = "center";
      extraConfig = { modi = "window,run,combi,keys,filebrowser"; };
    };
  };
}
