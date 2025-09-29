{ config, lib, namespace, pkgs, ... }:

lib.${namespace}.mkModule "nushell" config {
  config = {
    programs.nushell = {
      enable = true;
      package = pkgs.nushell;
      configFile.text = ''
        $env.config.show_banner = false
        $env.config.buffer_editor = "nvim"
      '';
    };

    home.sessionVariables.SHELL = "${pkgs.nushell}/bin/nu";
  };
}
