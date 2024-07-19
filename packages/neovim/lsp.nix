{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        tsserver.enable = true;
        tsserver.rootDir = "require('lspconfig.util').root_pattern('.git')";
        svelte.enable = true;
        elixirls.enable = true;
        hls.enable = true;
        tailwindcss.enable = true;
        eslint.enable = true;
      };
      keymaps = {
        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "<leader>d" = "hover";
          "<leader>." = "code_action";
          "n" = "rename";
        };
        diagnostic = { "<leader>e" = "open_float"; };
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, 
      { border = _border }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, 
      { border = _border }
    )

    vim.diagnostic.config { float = { border = _border } };

    require('lspconfig.ui.windows').default_options = { border = _border }
  '';
}
