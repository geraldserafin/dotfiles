{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.zsh;
  colors = config.stylix.base16Scheme;
in {
  options.${namespace}.zsh = { enable = mkBoolOption "Weather to enable zsh"; };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = false;
      initExtra =
        # bash
        ''
          local base='#${colors.base00}'
          local mantle='#${colors.base01}'
          local surface0='#${colors.base02}'
          local surface1='#${colors.base03}'
          local surface2='#${colors.base04}'
          local text='#${colors.base05}'
          local rosewater='#${colors.base06}'
          local lavender='#${colors.base07}'
          local red='#${colors.base08}'
          local peach='#${colors.base09}'
          local yellow='#${colors.base0A}'
          local green='#${colors.base0B}'
          local teal='#${colors.base0C}'
          local blue='#${colors.base0D}'
          local mauve='#${colors.base0E}'
          local flaming='#${colors.base0F}'

          [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
        '';
      shellAliases = {
        develop = "nix develop -c zsh";
        gswc = "git checkout -b";
        gsw = "git checkout";
      };
      zplug = {
        enable = true;
        plugins = [{
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1" ];
        }];
      };
    };
  };
}
