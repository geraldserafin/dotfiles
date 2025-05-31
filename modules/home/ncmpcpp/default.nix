{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.ncmpcpp;
in {
  options.${namespace}.ncmpcpp.enable = mkBoolOption "Wether to enable ncmpmpp";

  config = lib.mkIf cfg.enable {
    programs.ncmpcpp = {
      enable = true;
      settings = {
        mpd_host = "127.0.0.1";
        mpd_port = "6600";
        visualizer_data_source = "/tmp/mpd.fifo";
        visualizer_output_name = "visualizer_fifo";
        data_fetching_delay = "no";
      };
    };
  };
}
