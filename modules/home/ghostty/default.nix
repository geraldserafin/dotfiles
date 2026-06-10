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
      package = pkgs.ghostty;
      enableBashIntegration = true;
      enableZshIntegration = true;
      settings = {
        window-decoration = false;
        gtk-titlebar = false;
      };
    };

    home.sessionVariables = lib.mkIf conf.setAsDefault { TERMINAL = lib.mkForce "ghostty"; };
  };
}
