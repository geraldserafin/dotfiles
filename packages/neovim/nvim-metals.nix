{ pkgs, ... }: {
  extraPlugins = [{
    plugin = pkgs.vimPlugins.nvim-metals;
    config = # lua
      ''
        lua << EOF
        local metals_config = require("metals").bare_config()

        metals_config.settings = {
          showImplicitArguments = true,
          excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
          serverVersion = "latest.snapshot",
        }

        metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "scala", "sbt", "java" },
          callback = function()
            require("metals").initialize_or_attach(metals_config)
          end,
          group = nvim_metals_group,
        })
        EOF
      '';
  }];
}
