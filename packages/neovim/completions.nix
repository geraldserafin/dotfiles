{
  plugins = {
    lspkind.enable = true;
    lspkind.cmp.enable = true;
    luasnip.enable = true;
    friendly-snippets.enable = true;
    cmp_luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        preselect = "cmp.PreselectMode.None";
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet.expand = "luasnip";
        window = {
          completion = {
            border = "single";
            winhighlight =
              "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:PmenuSel,Search:None";
            sidePadding = 0;
          };
          documentation = {
            border = "single";
            winhighlight =
              "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:PmenuSel,Search:None";
            sidePadding = 0;
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
          "<C-k>" =
            "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
          "<C-j>" =
            "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
        };
        sources =
          [ { name = "nvim_lsp"; } { name = "buffer"; } { name = "path"; } ];
      };
    };
  };
}
