{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.bash;
in {
  options.${namespace}.bash.enable = mkBoolOption "Wether to enable bash";

  config = lib.mkIf cfg.enable {
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
      initExtra = ''
        PS1='[\u@\h:\w]\$ '
      '';
      bashrcExtra = ''
        if [[ -f ~/.keys.sh ]]; then
          source ~/.keys.sh
        fi
      '';
    };
  };
}
