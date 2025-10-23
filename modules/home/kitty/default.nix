{ config, lib, namespace, ... }:

let conf = config.${namespace}.kitty;
in lib.${namespace}.mkModule "kitty" config {
  options = with lib.${namespace}; {
    setAsDefault =
      mkBoolOption "Sets the TERMINAL variable to kitty when true.";
  };

  config = {
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

    home.sessionVariables = lib.mkIf conf.setAsDefault { TERMINAL = "kitty"; };
  };
}
