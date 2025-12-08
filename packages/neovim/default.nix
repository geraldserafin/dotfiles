{ pkgs, inputs, ... }:
let
  black-metal-theme = pkgs.vimUtils.buildVimPlugin {
    pname = "base16-black-metal-scheme";
    version = "master";
    src = inputs.base16-black-metal-scheme;
  };
in
inputs.nixvim.legacyPackages.${pkgs.stdenv.hostPlatform.system}.makeNixvimWithModule {
  inherit pkgs;

  module = {
    imports = [
      ./lsp.nix
      ./none-ls.nix
      ./treesitter.nix
      ./completions.nix
      ./oil.nix
      ./keymaps.nix
      ./fzf.nix
      ./lualine.nix
    ];

    plugins = {
      image.enable = true;
      typst-preview.enable = true;
      tmux-navigator = {
        enable = true;
        settings.no_mappings = 1;
      };
      markdown-preview = {
        enable = true;
        settings.auto_start = 0;
      };
      opencode = {
        enable = true;
      };
    };

    extraPlugins = [
      black-metal-theme
      pkgs.vimPlugins.vim-dispatch
    ];

    opts = {
      updatetime = 100;
      number = true;
      relativenumber = true;
      splitbelow = true;
      splitright = true;
      scrolloff = 4;
      autoindent = true;
      clipboard = "unnamedplus";
      expandtab = true;
      shiftwidth = 2;
      smartindent = true;
      wrap = false;
      ignorecase = true;
      incsearch = true;
      smartcase = true;
      wildmode = "list:longest";
      swapfile = false;
      undofile = true;
      termguicolors = true;
      showmode = false;
    };

    globals.mapleader = " ";

    colorscheme = "base16-black-metal-marduk";
  };
}
