{ pkgs, ... }:

{
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
    ];
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      set -g status-left-length 128
      set-option -g status-position top

      set-option -g default-terminal "screen-256color"
    '';
  };
}
