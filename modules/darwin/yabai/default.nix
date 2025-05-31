{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.yabai;
in {
  options.${namespace}.yabai.enable = mkBoolOption "Weather to enable Yabai";

  config = lib.mkIf cfg.enable {
    services.yabai = {
      enable = true;
      enableScriptingAddition = true;
      config = {
        layout = "bsp";
        window_placement = "second_child";
        padding = 10;
      };
    };
  };
}
