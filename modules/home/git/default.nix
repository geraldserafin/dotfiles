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
      settings = {
        user.name = config.${namespace}.git.userName;
        user.email = config.${namespace}.git.userEmail;
        credential.helper = "store";
        url."ssh://git@host".insteadOf = "otherhost";
      };
      lfs.enable = true;
    };
  };

}
