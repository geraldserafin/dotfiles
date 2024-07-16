{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.alacritty;
in {
  options.${namespace}.alacritty.enable =
    mkBoolOption "Weather to enable Alacritty";

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          decorations = "None";
          opacity = lib.mkForce 0.8;
        };
        env = { TERM = "alacritty-direct"; };
      };
    };
    home.sessionVariables.TERMINAL = "alacritty";
  };
}
