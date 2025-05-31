{ inputs, config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.mopidy;
in {
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  options.${namespace}.mopidy.enable = mkBoolOption "Wether to enable mopidy";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ mpc-cli ];
    services.mopidy = {
      enable = true;
      extensionPackages = with pkgs; [
        mopidy-mpd
        mopidy-spotify
        mopidy-soundcloud
      ];
      settings = {
        spotify = {
          bitrate = 320;
          allow_cache = true;
          timeout = 20;
        };
        mpd = {
          enabled = true;
          hostname = "127.0.0.1";
          port = 6600;
        };
      };
      extraConfigFiles = [ config.sops.templates."mopidy-spotify.conf".path ];
    };

    sops.templates."mopidy-spotify.conf".content = ''
      [spotify]
      client_id = ${config.sops.placeholder.spotify-client-id}
      client_secret = ${config.sops.placeholder.spotify-client-secret}
    '';
  };
}
