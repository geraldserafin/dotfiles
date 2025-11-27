{ config, lib, namespace, ... }:

lib.${namespace}.mkModule "direnv" config {
  config = {
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      config = {
        hide_env_diff = true;
        log_filter = "^$";
      };
    };
    home.sessionVariables = { };
  };
}
