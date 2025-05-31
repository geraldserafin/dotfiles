{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.mpd;
  fifoPath = "/tmp/spotify.fifo";
in {
  options.${namespace}.mpd.enable = mkBoolOption "Wether to enable mpd";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ mpc-cli ];
    services.librespot = {
      enable = true;
      settings = {
        name = "MPD-Spotify";
        backend = "pipe";
        device = fifoPath;
        format = "S16LE";
      };
    };

    services.mpd = {
      enable = true;
      musicDirectory = "/var/lib/mpd/music";
      extraConfig = ''
        input {
          plugin        "pipe"
          name          "Spotify"
          path          "${fifoPath}"
          format        "44100:16:2" # Sample rate: 44.1kHz, 16-bit, stereo
        }

        audio_output {
          type        "pulse"
          name        "My PulseAudio Output"
          server      "127.0.0.1"
        }
      '';
    };
  };
}
