{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.xmobar;
in {
  options.${namespace}.xmobar.enable = mkBoolOption "Weather to enable xmobar";

  config = lib.mkIf cfg.enable {
    xdg.configFile."xmobar/xmobarrc".source = ./xmobarrc;
    home.packages = with pkgs; [ xmobar ];
  };
}
