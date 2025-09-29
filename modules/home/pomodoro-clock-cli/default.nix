{ config, lib, namespace, inputs, system, ... }:

lib.${namespace}.mkModule "pomodoro-clock-cli" config {
  config = {
    home.packages =
      [ inputs.pomodoro-clock-cli.outputs.packages.${system}.default ];
  };
}
