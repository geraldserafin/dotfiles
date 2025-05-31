{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.neovim;
in {
  options.${namespace}.neovim = {
    enable = mkBoolOption "Weather to enable neovim";
    defaultEditor = mkBoolOption "Should neovim be the default editor";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ dotfiles.neovim ];
    home.sessionVariables = lib.mkIf cfg.defaultEditor { EDITOR = "nvim"; };
  };
}
