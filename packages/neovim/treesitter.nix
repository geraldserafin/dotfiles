{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        auto_install = true;
        highlight.enable = true;
        indent = {
          enable = true;
          disable = [ "asm" ];
        };
      };
    };
    treesitter-textobjects.enable = true;
  };
}
