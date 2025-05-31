{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.xmobar;
  colors = config.lib.stylix.colors.withHashtag;
  fonts = config.stylix.fonts;
in {
  options.${namespace}.xmobar.enable = mkBoolOption "Weather to enable xmobar";

  config = lib.mkIf cfg.enable {
    xdg.configFile."xmobar/xmobarrc".text =
      # haskell
      ''
        Config { font = "${fonts.monospace.name} 12"
               , additionalFonts = [ "${fonts.monospace.name} 18" ]
               , bgColor = "${colors.base00}"
               , fgColor = "${colors.base04}"
               , position = BottomH 32
               , lowerOnStart = True
               , allDesktops = True
               , overrideRedirect = False
               , persistent = True
               , commands = [ Run DynNetwork ["-t", "<dev>:<fc=${colors.base0A}><rx>kB/s</fc>|<fc=${colors.base0A}><tx>kB/s</fc>"] 10
                            , Run Cpu [ "-t", "cpu:<total>%"
                                      , "-L", "25"
                                      , "-H", "80"
                                      , "--low"   , "${colors.base0A}"
                                      , "--normal", "${colors.base0A}"
                                      , "--high"  , "${colors.base0A}"
                                      ] 10
                            , Run Memory [ "-t", "mem:<usedratio>%"
                                         , "-L", "25"
                                         , "-H", "80"
                                         , "--low"   , "${colors.base0A}"
                                         , "--normal", "${colors.base0A}"
                                         , "--high"  , "${colors.base0A}"
                                         ] 10
                            , Run Volume "default" "Master" [ "--template" , "vol:<fc=${colors.base0A}><volume></fc>%" ] 10
            		    , Run Date "%d-%m-%Y" "date" 10
        		    , Run Date "%H:%M"    "time" 10
        		    , Run StdinReader
                            ]
               , sepChar = "%"
               , alignSep = "}{"
               , template = " %StdinReader% } { \
                            \ %memory% \
                            \ %cpu% \
                            \ %dynnetwork% \
                            \ <action=`pavucontrol` button=1>%default:Master%</action> \
                            \ %date% \
                            \ %time% "
               }
      '';
    home.packages = with pkgs; [ xmobar ];
  };
}
