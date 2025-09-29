{ config, lib, namespace, ... }:

lib.${namespace}.mkModule "kitty" config {
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
        shell = "/home/gerald/.nix-profile/bin/nu";
      };
    };
  };
}
