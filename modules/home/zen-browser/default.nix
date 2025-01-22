{ config, lib, namespace, inputs, system, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.zen-browser;
in {
  options.${namespace}.zen-browser.enable =
    mkBoolOption "Weather to enable zen-browser";

  config = lib.mkIf cfg.enable {
    home.packages = [ inputs.zen-browser.packages."${system}".default ];
  };
}
