{ pkgs, ... }:
{
  plugins = {
    lsp = {
      enable = true;
      # inlayHints = true;
      servers = {
        nixd.enable = true;
        ts_ls.enable = true;
        svelte.enable = true;
        elixirls = {
          enable = true;
          settings.elixirLS.formatterOptions = {
            autoParentheses = false;
          };
        };
        hls = {
          enable = true;
          packageFallback = true;
          installGhc = false;
          settings.haskell = {
            formattingProvider = "fourmolu";
            plugin.hlint.globalOn = false;
          };
        };
        tailwindcss.enable = true;
        metals.enable = true;
        pylsp.enable = true;
        clangd.enable = true;
        bashls.enable = true;
        rust_analyzer = {
          enable = true;
          packageFallback = true;
          installCargo = true;
          installRustc = true;
        };
        jdtls = {
          enable = true;
          package = pkgs.jdt-language-server;
          settings.java = {
            signatureHelp.enabled = true;
            imports = {
              gradle.enabled = true;
              maven = {
                enabled = true;
                wrapper.enabled = true;
              };
            };
          };
        };
        ruff.enable = true;
        asm_lsp.enable = true;
        cssls.enable = true;
        tinymist.enable = true;
        sqls.enable = true;
        phpactor.enable = true;
      };
      keymaps = {
        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          # "<leader>." = "code_action";
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

          vim.keymap.set("n", "<leader>d", function() vim.lsp.buf.hover{ border = _border } end)

          vim.diagnostic.config {
            float = { border = border },
            virtual_text = {
              spacing = 4, 
              source = "if_many", 
            },
            signs = true,
            underline = true,
          }

          vim.keymap.set("n", "<leader>e", function()
            vim.diagnostic.open_float(nil, {
              focusable = false,
              border = _border,
              source = "always",
              prefix = "",
            })
          end)
        '';
    };
  };
}
