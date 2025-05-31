{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.ncspot;
in {
  options.${namespace}.ncspot = {
    enable = mkBoolOption "Wether to enable ncspot";
  };

  config = lib.mkIf cfg.enable {
    programs.ncspot = {
      enable = true;
      package = pkgs.ncspot.override { withCover = true; };
      settings = {
        use_nerdfont = true;
        notify = true;
        keybindings."quit" = "Ctrl+q";
      };
    };
  };
}
