{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        tsserver.enable = true;
        svelte.enable = true;
        elixirls.enable = true;
        hls.enable = true;
        tailwindcss.enable = true;
        eslint = {
          enable = true;
          cmd = [ "eslint" ];
        };
      };
      inlayHints = true;
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
