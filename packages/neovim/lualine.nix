{
  plugins.lualine = {
    enable = true;

    settings = {
      options = {
        icons_enabled = false;
        section_separators = "";
        component_separators = "";
        globalstatus = true;
      };

      ignoreFocus = [ "neo-tree" ];
      alwaysDivideMiddle = true;

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" "diff" "diagnostics" ];
        lualine_c = [ "filename" ];
        lualine_x = [ "" ];
        lualine_y = [ "filetype" ];
        lualine_z = [ "hostname" ];
      };
    };
  };
}
