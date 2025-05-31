{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<C-p>" = "find_files";
      "<leader>/" = "live_grep";
    };
    extensions.ui-select.enable = true;
    extensions.undo.enable = true;
    settings.defaults.mappings.i."<esc>" = {
      __raw = ''
        function(...)
          return require("telescope.actions").close(...)
        end
      '';
    };
    settings.defaults.borderchars = [ "─" "│" "─" "│" "┌" "┐" "┘" "└" ];
    settings.defaults.disable_devicons = true;
    settings.extensions.__raw =
      "{ ['ui-select'] = { require('telescope.themes').get_dropdown() } }";
  };
}
