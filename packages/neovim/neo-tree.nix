{
  plugins.neo-tree = {
    enable = true;
    hideRootNode = true;
    window.width = 32;
  };
  keymaps = [{
    key = "<C-b>";
    action = "<CMD>Neotree filesystem toggle left<CR>";
  }];
}
