{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption mkStringOption;
  cfg = config.${namespace}.git;
  user = config.${namespace}.user;
in {
  options.${namespace}.git = {
    enable = mkBoolOption "Weather to enable Git";
    userName = mkStringOption user.name "A name to be used.";
    userEmail = mkStringOption user.email "An email to be used.";
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = cfg.userName;
      userEmail = cfg.userEmail;
      extraConfig = {
        url."ssh://git@host".insteadOf = "https://github.com/";

      };
      lfs.enable = true;
    };
  };

}
