{ config, lib, namespace, ... }:

lib.${namespace}.mkModule "ncmpcpp" config {
  config = {
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
