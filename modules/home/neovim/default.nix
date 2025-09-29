{ config, lib, namespace, pkgs, ... }@args:

let
  _ = builtins.trace
    "Available args: ${builtins.toJSON (builtins.attrNames args)}" null;
in lib.${namespace}.mkModule "neovim" config {
  config = {
    home.packages = with pkgs; [ dotfiles.neovim ];
    home.sessionVariables = { EDITOR = "nvim"; };
  };
}
