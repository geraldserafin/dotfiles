{
  plugins.zen-mode.enable = true;
  plugins.zen-mode.settings.plugins = {
    options = {
      enabled = true;
      ruler = false;
      showcmd = false;
      laststatus = 0;
    };
    tmux.enabled = true;
    alacritty = {
      enabled = true;
      font = "18";
    };
  };
  keymaps = [{
    key = "<leader>z";
    action = "<CMD>ZenMode<CR>";
  }];
}
