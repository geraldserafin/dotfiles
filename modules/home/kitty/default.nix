{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.kitty;
in {
  options.${namespace}.kitty = {
    enable = mkBoolOption "Weather to enable Kitty";
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      theme = "Catppuccin-Mocha";
      shellIntegration.enableBashIntegration = true;
      settings = {
        confirm_os_window_close = 0;
        enable_audio_bell = false;
      };
    };
  };
}
