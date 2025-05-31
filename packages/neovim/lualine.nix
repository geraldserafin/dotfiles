{
  plugins.lualine = {
    enable = true;

    settings = {
      options = {
        icons_enabled = false;
        section_separators = "";
        component_separators = "";
      };

      globalstatus = true;
      ignoreFocus = [ "neo-tree" ];
      extensions = [ "fzf" ];
      alwaysDivideMiddle = true;
      sections = {
        lualine_a = [{ name = "mode"; }];
        lualine_b = [ { name = "branch"; } "diff" "diagnostics" ];
        lualine_c = [ "filename" ];
        lualine_x = [ "" ];
        lualine_y = [ "filetype" ];
        lualine_z = [ "hostname" ];
      };
    };
  };
}
