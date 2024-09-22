{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.discord;
in {

  options.${namespace}.discord = {
    enable = mkBoolOption "Weather to enable Discord (Vesktop)";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ vesktop ];

    xdg.configFile."vesktop/themes/catppuccin-mocha-tui.theme.css".source =
      ./catppuccin-mocha-tui.theme.css;
  };
}
