{
  plugins.oil = {
    enable = true;
    settings.columns = [ "permissions" "size" ];
  };
  plugins.oil-git-status.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>-";
      action = "<cmd>Oil<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Open Oil file explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>o";
      action = "<cmd>Oil .<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Open Oil in current directory";
      };
    }
  ];
}
