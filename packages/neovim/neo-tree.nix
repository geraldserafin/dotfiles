{
  plugins.neo-tree = {
    enable = false;
    settings = {
      hide_root_node = true;
      window.width = 32;
    };
  };
  keymaps = [{
    key = "<C-b>";
    action = "<CMD>Neotree filesystem toggle left<CR>";
  }];
}
