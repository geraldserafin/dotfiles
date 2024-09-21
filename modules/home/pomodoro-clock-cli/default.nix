{ config, lib, namespace, inputs, system, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.pomodoro-clock-cli;
in {
  options.${namespace}.pomodoro-clock-cli = {
    enable = mkBoolOption "Weather to enable pomodoro-clock-cli";
  };

  config = lib.mkIf cfg.enable {
    home.packages =
      [ inputs.pomodoro-clock-cli.outputs.packages.${system}.default ];
  };
}
