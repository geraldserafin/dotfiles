{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        tsserver.enable = true;
        svelte.enable = true;
        elixirls.enable = true;
        hls = {
          enable = true;
          settings.haskell.formattingProvider = "fourmolu";
        };
        tailwindcss.enable = true;
        eslint.enable = true;
        metals.enable = true;
        pylsp.enable = true;
        clangd.enable = true;
        bashls.enable = true;
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
}
