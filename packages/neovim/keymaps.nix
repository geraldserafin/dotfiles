{
  keymaps = [
    {
      mode = "n";
      key = "<C-Left>";
      action = ":wincmd h<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = ":wincmd l<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-Up>";
      action = ":wincmd k<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = ":wincmd j<CR>";
      options.silent = true;
    }
  ];
}
