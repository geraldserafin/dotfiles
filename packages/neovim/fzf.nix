{ ... }: {
  plugins.fzf-lua = {
    enable = true;

    settings = {
      winopts = {
        split = "belowright 16new";
        preview = {
          scrollbar = false;
          border = "none";
        };
      };

      fzf_colors = true;
      fzf_opts = {
        "--layout" = "default";
        "--pointer" = "''";
        "--marker" = "''";
        "--separator" = "''";
      };

      defaults = {
        file_icons = false;
        git_icons = false;
        color_icons = false;
        cwd_prompt = false;
        prompt = "";
        no_header = true;
        no_header_i = true;
      };

      files.winopts.preview.hidden = "hidden";
      buffers.fzf_opts."--with-nth" = "3..";
    };

    keymaps = {
      "<C-p>" = "files";
      "<leader>ff" = "files";
      "<leader>gf" = "git_files";
      "<leader>b" = "buffers";
      "<leader>g" = "live_grep";
      "<leader>fw" = "grep_cword";
      "<leader>fr" = "resume";
      "gd" = "lsp_definitions";
      "gr" = "lsp_references";
      "<leader>ds" = "lsp_document_symbols";
      "<leader>ca" = "lsp_code_actions";
    };
  };
}
