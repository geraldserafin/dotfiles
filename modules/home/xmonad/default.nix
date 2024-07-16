{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.xmonad;
  colors = config.stylix.base16Scheme;
in {
  options.${namespace}.xmonad.enable = mkBoolOption "Weather to enable xmonad";

  config = lib.mkIf cfg.enable {
    xsession = {
      enable = true;
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = ./xmonad.hs;
        libFiles = {
          "Colors.hs" = pkgs.writeText "Colors.hs" ''
            module Colors where

            base = "#${colors.base00}"
            mantle = "#${colors.base01}"
            surface0 = "#${colors.base02}"
            surface1 = "#${colors.base03}"
            surface2 = "#${colors.base04}"
            text = "#${colors.base05}"
            rosewater = "#${colors.base06}"
            lavender = "#${colors.base07}"
            red = "#${colors.base08}"
            peach = "#${colors.base09}"
            yellow = "#${colors.base0A}"
            green = "#${colors.base0B}"
            teal = "#${colors.base0C}"
            blue = "#${colors.base0D}"
            mauve = "#${colors.base0E}"
            flaming = "#${colors.base0F}"
          '';
        };
      };
    };
  };
}
