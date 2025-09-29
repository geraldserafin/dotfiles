{ config, lib, namespace, pkgs, ... }:

lib.${namespace}.mkModule "ncspot" config {
  config = {
    programs.ncspot = {
      enable = true;
      package = pkgs.ncspot.override { withCover = true; };
      settings = {
        use_nerdfont = true;
        notify = true;
        keybindings."quit" = "Ctrl+q";
      };
    };
  };
}
