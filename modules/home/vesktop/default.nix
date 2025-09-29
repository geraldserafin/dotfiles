{ config, lib, namespace, pkgs, ... }:

lib.${namespace}.mkModule "vesktop" config {
  config = {
    home.packages = with pkgs; [ vesktop ];
    xdg.configFile."vesktop/themes/catppuccin-mocha-tui.theme.css".source =
      ./catppuccin-mocha-tui.theme.css;
  };
}
