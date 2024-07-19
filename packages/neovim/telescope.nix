{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<C-p>" = "find_files";
      "<leader>/" = "live_grep";
    };
    extensions.ui-select.enable = true;
    extensions.ui-select.settings.specific_opts.codeactions = true;
    extensions.undo.enable = true;
    settings.defaults.mappings.i."<esc>" = {
      __raw = ''
        function(...)
          return require("telescope.actions").close(...)
        end
      '';
    };
  };
}
