{ config, lib, namespace, inputs, system, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.nvim;
in {
  options.${namespace}.nvim = {
    enable = mkBoolOption "Weather to enable neovim";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ inputs.neovim.packages.${system}.default ];
  };
}
