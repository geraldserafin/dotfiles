{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.xmobar;
  colors = config.stylix.base16Scheme;
  fonts = config.stylix.fonts;
in {
  options.${namespace}.xmobar.enable = mkBoolOption "Weather to enable xmobar";

  config = lib.mkIf cfg.enable {
    xdg.configFile."xmobar/xmobarrc".text =
      # haskell
      ''
        Config { font = "${fonts.monospace.name} 12"
               , additionalFonts = [ "${fonts.monospace.name} 24" ]
               , bgColor = "#${colors.base01}"
               , fgColor = "#${colors.base04}"
               , position = BottomH 32
               , lowerOnStart = True
               , allDesktops = True
               , overrideRedirect = False
               , persistent = True
               , commands = [ Run Network "enp7s0" ["-t", "<fc=#${colors.base0E}> <dev></fc>"] 10
                            , Run Cpu [ "-t", "<fc=#${colors.base0B}>󰍛 <total>%</fc>"
                                      , "-L", "25"
                                      , "-H", "65"
                                      , "--low"   , "#${colors.base0B}"
                                      , "--normal", "#${colors.base09}"
                                      , "--high"  , "#${colors.base08}"
                                      ] 10
                            , Run Memory ["-t", "<fc=#${colors.base0C}> <usedratio>%</fc>"] 10
            		            , Run Date "<fc=#${colors.base0D}> %d %b %Y</fc>" "date" 10
        		                , Run Date "<fc=#${colors.base07}>󱑌 %H:%M</fc>"    "time" 10
                            , Run Com "sh" [ "-c", "pomodoro status"] "pomodoroTime" 10
        		                , Run StdinReader
                            ]
               , sepChar = "%"
               , alignSep = "}{"
               , template = " <fc=#${colors.base0E}><fn=1></fn></fc> \
                            \ %StdinReader% } { \
                            \ %pomodoroTime% \
                            \ %memory% \
                            \ %cpu% \
                            \ %enp7s0% \
                            \ %date% \
                            \ %time% "
               }
      '';
    home.packages = with pkgs; [ xmobar ];
  };
}
