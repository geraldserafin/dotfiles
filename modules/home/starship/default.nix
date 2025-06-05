{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.starship;
in {
  options.${namespace}.starship.enable =
    mkBoolOption "Wether to enable starship";

  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;

        format = "$nix_shell\\[$username@$hostname:$directory\\]$character";

        nix_shell.format = "\\($name\\) ";

        username = {
          format = "$user";
          show_always = true;
        };

        hostname = {
          format = "$hostname";
          ssh_only = false;
        };

        directory.format = "[$path]($style)[$read_only]($read_only_style)";

        character.format = "\\$ ";
      };
    };
  };
}
