{
  plugins.lualine = {
    enable = true;
    alwaysDivideMiddle = true;
    globalstatus = true;
    ignoreFocus = [ "neo-tree" ];
    extensions = [ "fzf" ];
    componentSeparators = {
      left = "|";
      right = "|";
    };
    sectionSeparators = {
      left = "";
      right = "";
    };
    sections = {
      lualine_a = [{
        name = "mode";
        icon = "";
      }];
      lualine_b = [
        {
          name = "branch";
          icon = "";
        }
        "diff"
        "diagnostics"
      ];
      lualine_c = [ "filename" ];
      lualine_x = [ "" ];
      lualine_y = [ "filetype" ];
      lualine_z = [ "hostname" ];
    };
  };
}
