{ pkgs, inputs, ... }:

inputs.nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
  inherit pkgs;
  module = {
    imports = [
      ./options.nix
      ./lualine.nix
      ./catppuccin.nix
      ./lsp.nix
      ./neo-tree.nix
      ./none-ls.nix
      ./telescope.nix
      ./treesitter.nix
      ./completions.nix
      ./alpha.nix
      ./lazygit.nix
      ./zen-mode.nix
    ];
  };
}
