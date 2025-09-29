{ config, lib, namespace, specialArgs, ... }@args:

builtins.trace "ARGS: ${toString (builtins.attrNames specialArgs)}"
lib.${namespace}.mkModule "git" config {
  options = with lib.${namespace}; {
    userName = mkStringOption user.name "A name to be used.";
    userEmail = mkStringOption user.email "An email to be used.";
  };

  config = {
    programs.git = {
      enable = true;
      userName = config.${namespace}.git.userName;
      userEmail = config.${namespace}.git.userEmail;
      extraConfig = {
        credential.helper = "store";
        url."ssh://git@host".insteadOf = "otherhost";
      };
      lfs.enable = true;
    };
  };

}
