{ pkgs, inputs, ... }:

inputs.nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
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
      # ./nvim-metals.nix
    ];
  };
}
