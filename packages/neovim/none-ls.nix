{
  plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        nixfmt.enable = true;
        prettierd = {
          enable = true;
          disableTsServerFormatter = true;
        };
        prettierd.enable = true;
        clang_format.enable = true;
      };
      completion.luasnip.enable = true;
    };
    settings = {
      on_attach =
        # lua
        ''
          function(client, bufnr)
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
          end
        '';
    };
  };
}
