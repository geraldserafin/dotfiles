{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.neovim;
in {
  options.${namespace}.neovim = {
    enable = mkBoolOption "Weather to enable neovim";
  };

  config =
    lib.mkIf cfg.enable { home.packages = with pkgs; [ dotfiles.neovim ]; };
}
