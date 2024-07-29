{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.workman;
in {
  options.${namespace}.workman.enable = mkBoolOption "Weather to enable Steam";
  config = lib.mkIf cfg.enable {
    services.xserver.xkb.extraLayouts.workman_pl = {
      description = "Polish Workman";
      languages = [ "eng" "pol" ];
      symbolsFile = pkgs.writeText "workman_pl" ''
        partial alphanumeric_keys
        xkb_symbols "basic" {
          include "us(workman)"
          name[Group1]= "Polish (Workman)";

          key <AC01> { [ a, A, aogonek, Aogonek ] };
          key <AC02> { [ s, S, sacute, Sacute ] };
          key <AC07> { [ n, N, nacute, Nacute ] };
          key <AC08> { [ e, E, eogonek, Eogonek ] };
          key <AC09> { [ o, O, oacute, Oacute ] };

          key <AB01> { [ z, Z, zabovedot, Zabovedot ] };
          key <AB02> { [ x, X, zacute, Zacute ] };
          key <AB04> { [ c, C, cacute, Cacute ] };
          key <AB07> { [ l, L, lstroke, Lstroke ] };

          include "level3(ralt_switch)"
        };
      '';
    };
  };
}
