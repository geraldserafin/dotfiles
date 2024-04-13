{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "geraldserafin";
    userEmail = "serafingerald@protonmail.com";
    extraConfig = {
      credential.helper = "store";
    };
  };
}
