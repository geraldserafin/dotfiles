{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.rofi;
in {
  options.${namespace}.rofi.enable = mkBoolOption "Weather to enable rofi";

  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      font = lib.mkForce "ZedMono Nerd Font 17";
      location = "center";
      extraConfig = { modi = "window,run,combi,keys,filebrowser"; };
    };
  };
}
