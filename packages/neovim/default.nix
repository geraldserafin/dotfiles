{ pkgs, inputs, ... }:
let
  black-metal-theme = pkgs.vimUtils.buildVimPlugin {
    pname = "base16-black-metal-scheme";
    version = "master";
    src = inputs.base16-black-metal-scheme;
  };
in inputs.nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
  inherit pkgs;
  module = {
    imports = [
      ./alpha.nix
      ./options.nix
      ./lualine.nix
      ./catppuccin.nix
      ./lsp.nix
      ./neo-tree.nix
      ./none-ls.nix
      ./telescope.nix
      ./treesitter.nix
      ./completions.nix
      ./lazygit.nix
      ./zen-mode.nix
      ./oil.nix
      ./markdown-preview.nix
      ./image.nix
      ./avante.nix
      ./keymaps.nix
      ./tmux-navigator.nix
      ./marks.nix
      ./harpoon.nix
    ];

    extraPlugins = [ black-metal-theme ];

    colorscheme = "base16-black-metal-marduk";

    extraConfigVim = ''
      autocmd FileType asm setlocal noautoindent nosmartindent indentexpr=
      autocmd FileType asm,nasm,gas setlocal indentkeys=!^F
    '';
  };
}
