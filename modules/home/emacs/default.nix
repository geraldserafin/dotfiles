{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:

lib.${namespace}.mkModule "emacs" config {
  config = {
    services.emacs = {
      enable = true;
      startWithUserSession = true;
    };
    programs.emacs = {
      enable = true;
      extraPackages = with pkgs.emacsPackages; [
        magit
        eglot
      ];
    };

    home.file.".emacs.d/init.el".source = ./init.el;
  };
}
