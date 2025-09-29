{ config, lib, namespace, pkgs, ... }:

let fifoPath = "/tmp/spotify.fifo";
in lib.${namespace}.mkModule "mpd" config {
  config = {
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
