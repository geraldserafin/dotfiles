{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:

let
  conf = config.${namespace}.ghostty;
in
lib.${namespace}.mkModule "ghostty" config {
  options = with lib.${namespace}; {
    setAsDefault = mkBoolOption "Sets the TERMINAL variable to ghostty when true.";
  };

  config = {
    programs.ghostty = {
      enable = true;
      package = pkgs.ghostty-bin;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    home.sessionVariables = lib.mkIf conf.setAsDefault { TERMINAL = "ghostty"; };
  };
}
