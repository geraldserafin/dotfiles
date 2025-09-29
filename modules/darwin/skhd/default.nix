{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.skhd;
in {
  options.${namespace}.skhd.enable = mkBoolOption "Wether to enable skhd";

  config = lib.mkIf cfg.enable {
    services.skhd = {
      enable = true;
      skhdConfig = ''
        alt - return : open -na kitty 

        alt - q : yabai -m window --close

        alt - space : yabai -m space --layout next || yabai -m space --layout first 

        alt - j : yabai -m window --focus stack.next || yabai -m window --focus first 
        alt - k : yabai -m window --focus stack.prev || yabai -m window --focus last 
        alt - m : yabai -m window --focus first

        alt - return : yabai -m window --swap first
        alt + shift - j : yabai -m window --swap stack.next || yabai -m window --swap first
        alt + shift - k : yabai -m window --swap stack.prev || yabai -m window --swap last

        alt - h : yabai -m window --resize left:-20:0 || yabai -m window --resize right:-20:0
        alt - l : yabai -m window --resize right:20:0 || yabai -m window --resize left:20:0

        alt - 1 : yabai -m space --focus 1
        alt - 2 : yabai -m space --focus 2
        alt - 3 : yabai -m space --focus 3
        alt - 4 : yabai -m space --focus 4
        alt - 5 : yabai -m space --focus 5
        alt - 6 : yabai -m space --focus 6
        alt - 7 : yabai -m space --focus 7
        alt - 8 : yabai -m space --focus 8
        alt - 9 : yabai -m space --focus 9

        alt + shift - 1 : yabai -m window --space 1; yabai -m space --focus 1
        alt + shift - 2 : yabai -m window --space 2; yabai -m space --focus 2
        alt + shift - 3 : yabai -m window --space 3; yabai -m space --focus 3
        alt + shift - 4 : yabai -m window --space 4; yabai -m space --focus 4
        alt + shift - 5 : yabai -m window --space 5; yabai -m space --focus 5
        alt + shift - 6 : yabai -m window --space 6; yabai -m space --focus 6
        alt + shift - 7 : yabai -m window --space 7; yabai -m space --focus 7
        alt + shift - 8 : yabai -m window --space 8; yabai -m space --focus 8
        alt + shift - 9 : yabai -m window --space 9; yabai -m space --focus 9

        alt - t : yabai -m window --toggle float # Toggles float state
      '';
    };
  };
}
