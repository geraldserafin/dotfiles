{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.xmobar;
  colors = config.stylix.base16Scheme;
in {
  options.${namespace}.xmobar.enable = mkBoolOption "Weather to enable xmobar";

  config = lib.mkIf cfg.enable {
    xdg.configFile."xmobar/xmobarrc".text = ''
      Config { font = "ZedMono Nerd Font 17"
             , additionalFonts = ["ZedMono Nerd Font Bold 10"]
             , bgColor = "#${colors.base01}"
             , fgColor = "#${colors.base04}"
             , position = TopH 24
             , lowerOnStart = True
             , allDesktops = True
             , overrideRedirect = False
             , persistent = True
             , iconRoot = "/home/gerald/.config/xmobar/xbm/"
             , commands = [ Run Network "enp7s0" ["-t", "<fc=#${colors.base05}>\xf484 <dev></fc>"] 10
                          , Run Cpu ["-t", "<fc=#${colors.base05}>\xf035b <total>%</fc>"] 10
          		            , Run Date "%d-%b-%Y" "date" 10
      		                , Run Date "%H:%M" "time" 10
                          , Run Com "sh" ["-c", "~/.pomodoro/pomodoro-clock-cli status -f \"<fc=#${colors.base05}>{title} - {time} ({state}), {goal}/{cycle}</fc> |\""] "pomodoroTime" 10
      		                , Run StdinReader
                          ]
             , sepChar = "%"
             , alignSep = "}{"
             , template = " %StdinReader% } { %pomodoroTime% %time% %date% "
             }
    '';
    home.packages = with pkgs; [ xmobar ];
  };
}
