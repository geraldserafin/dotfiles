{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  name = "helix";
  cfg = config.${namespace}.${name};
in {
  options.${namespace}.${name} = {
    enable = mkBoolOption "Wether to enable ${name}";
  };

  config = lib.mkIf cfg.enable {
    programs.helix = {
      enable = true;
      settings = { };
      languages.language = [{
        name = "nix";
        auto-format = true;
      }];
    };
  };

}
