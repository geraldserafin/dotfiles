{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.xmonad;
  colors = config.lib.stylix.colors.withHashtag;
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

            base00 = "${colors.base00}"
            base01 = "${colors.base01}"
            base02 = "${colors.base02}"
            base03 = "${colors.base03}"
            base04 = "${colors.base04}"
            base05 = "${colors.base05}"
            base06 = "${colors.base06}"
            base07 = "${colors.base07}"
            base08 = "${colors.base08}"
            base09 = "${colors.base09}"
            base0A = "${colors.base0A}"
            base0B = "${colors.base0B}"
            base0C = "${colors.base0C}"
            base0D = "${colors.base0D}"
            base0E = "${colors.base0E}"
            base0F = "${colors.base0F}"
          '';

          "Options.hs" = pkgs.writeText "Options.hs" ''
            module Options where 

            import XMonad (mod1Mask)

            modMask  = mod1Mask
            terminal = "${config.home.sessionVariables.TERMINAL}"
          '';

        };
      };
    };
  };
}
