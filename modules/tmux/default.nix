{ ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      set -g prefix ^a
      set -g status-left-length 128
      set -g mouse on
      set -g escape-time 10

      set-option -g status-position top

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';
  };
}
