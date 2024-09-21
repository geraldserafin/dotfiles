{ config, lib, namespace, inputs, ... }:

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
      };
      sessionVariables.TERM = "xterm-256color";
      bashrcExtra =
        # sh
        ''
          export OSH=${inputs.oh-my-bash}

          completions=(
            git
            composer
            ssh
          )

          aliases=(
            general
          )

          plugins=(
            git
            bashmarks
          )

          source $OSH/oh-my-bash.sh
          source ${./tweaked-lambda.theme.sh}
        '';
    };
  };
}
