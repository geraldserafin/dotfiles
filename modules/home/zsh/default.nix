{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.zsh;
in {
  options.${namespace}.zsh = { enable = mkBoolOption "Wether to enable zsh"; };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = false;
      shellAliases = {
        develop = "nix develop -c zsh";
        gswc = "git checkout -b";
        gsw = "git checkout";
        
        # Nix Maintenance Aliases
        nix-gc-projects = "sudo find /nix/var/nix/gcroots/auto -type l -delete && sudo nix-collect-garbage -d";
        nix-wipe-all = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && nix-store --optimise";
      };
    };
  };
}
