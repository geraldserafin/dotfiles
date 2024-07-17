{
  plugins = {
    luasnip = {
      enable = true;
      fromVscode = [ { } ];
    };
    cmp_luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp = {
      enable = true;
      settings = {
        snippet.expand =
          # lua
          ''
            function(args)
              require("luasnip").lsp_expand(args.body)
            end
          '';
        preselect = "cmp.PreselectMode.None";
        window = {
          completion = {
            border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
            winhighlight =
              "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:PmenuSel,Search:None";
            scrollbar = false;
            sidePadding = 0;
          };
          settings.documentation = {
            border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
            winhighlight =
              "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:PmenuSel,Search:None";
          };
        };
        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<Tab>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping.close()";
          "<Down>" =
            "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
          "<Up>" =
            "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
        };
        sources =
          [ { name = "nvim_lsp"; } { name = "luasnip"; } { name = "buffer"; } ];
      };
    };
  };
}
