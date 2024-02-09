{self, pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    colorschemes.dracula.enable = true;
  
    options = {
      number = true;
    };

    plugins = {
      lualine.enable = true;
      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          svelte.enable = true;
          lua-ls.enable = true;
	  nixd.enable = true;
        };
      };
      telescope.enable = true;
      nvim-cmp = {
       enable = true;
       autoEnableSources = true;
       sources = [
         {name="nvim_lsp";}
         {name="path";}
         {name="buffer";}
       ];
     };
   };

 };
}
