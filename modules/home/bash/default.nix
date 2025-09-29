{ config, lib, namespace, ... }:

lib.${namespace}.mkModule "bash" config {
  config = {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        gswc = "git checkout -b";
        gsw = "git checkout";
      };
      sessionVariables = {
        TERM = "xterm-256color";
        BASH_SILENCE_DEPRECATION_WARNING = 1;
      };
    };
  };
}
