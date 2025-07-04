{ config, lib, namespace, pkgs, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.tmux;
in {
  options.${namespace}.tmux.enable = mkBoolOption "Weather to enable Tmux";

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      mouse = true;
      newSession = true;
      disableConfirmationPrompt = true;
      baseIndex = 1;
      escapeTime = 10;
      prefix = "C-a";
      customPaneNavigationAndResize = true;
      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '10' # minutes
          '';
        }
        { plugin = tmuxPlugins.vim-tmux-navigator; }
      ];
      extraConfig = ''
        unbind r
        bind r source-file ~/.config/tmux/tmux.conf

        set -g status-left-length 128
        set -g allow-passthrough on

        set-option -g status-position top
        set-option -g default-terminal "tmux-256color"
        set-option -sa terminal-overrides ',xterm-256color:RGB'
      '';
    };
  };
}
