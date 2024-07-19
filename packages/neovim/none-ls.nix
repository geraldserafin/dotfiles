{
  plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        nixfmt.enable = true;
        prettierd.enable = true;
      };
      completion.luasnip.enable = true;
    };
    settings = {
      on_attach =
        # lua
        ''
          function(client, bufnr)
          	if client.supports_method("textDocument/formatting") then
          		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          		vim.api.nvim_create_autocmd("BufWritePre", {
          			group = augroup,
          			buffer = bufnr,
          			callback = function()
          				vim.lsp.buf.format()
          			end
          	  })
          	end
          end
        '';
    };
  };
}
