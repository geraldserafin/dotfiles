{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.bash;
in {
  options.${namespace}.bash.enable = mkBoolOption "Weather to enable bash";

  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        gswc = "git checkout -b";
        gsw = "git checkout";
        pomodoro = "~/.pomodoro/pomodoro-clock-cli";
      };
    };
  };
}
