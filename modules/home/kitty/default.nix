{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.kitty;
in {
  options.${namespace}.kitty = {
    enable = mkBoolOption "Wather to enable Kitty";
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      shellIntegration.enableBashIntegration = true;
      shellIntegration.enableZshIntegration = true;
      settings = {
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        cursor_shape = "beam";
        disable_ligatures = "always";
      };
    };
  };
}
