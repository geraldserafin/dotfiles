{ ... }: {
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd.enable = true;
        ts_ls.enable = true;
        svelte.enable = true;
        elixirls = {
          enable = true;
          settings = {
            elixirLS = {
              dialyzerEnabled = false;
              enableTestLenses = false;
              mixTarget = "local";
              formatterOptions = { autoParentheses = false; };
            };
          };
        };
        hls = {
          enable = true;
          settings.haskell.formattingProvider = "fourmolu";
          installGhc = false;
        };
        tailwindcss.enable = true;
        eslint.enable = true;
        metals.enable = true;
        pylsp.enable = true;
        clangd.enable = true;
        bashls.enable = true;
        jdtls = {
          enable = true;
          settings.java = {
            signatureHelp.enabled = true;
            imports = {
              maven = {
                enabled = true;
                wrapper.enabled = true;
              };
            };
          };
        };
        asm_lsp.enable = true;
      };
      keymaps = {
        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "<leader>." = "code_action";
          "n" = "rename";
        };
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
      };
      postConfig =
        # lua
        ''
          local _border = "single"

          vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover, {
              border = 'single'
            }
          )

          vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
              border = 'single'
            }
          )

          vim.keymap.set("n", "<leader>d", function() vim.lsp.buf.hover{ border = _border } end)
          vim.keymap.set("n", "<leader>e", function() vim.lsp.buf.signature_help{border = _border} end)

          vim.diagnostic.config {
            float = { border = border },
            virtual_text = {
              spacing = 4, 
              source = "if_many", 
            },
            signs = true,
            underline = true,
          }
        '';
    };
  };
}
