{ inputs, pkgs, ... }:

{
  imports = [ inputs.stylix.homeManagerModules.stylix ];
  stylix = {
    enable = true;
    image = ./background-image.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets = {
      rofi.enable = false;
      vim.enable = false;
    };
    fonts = {
      sizes = { terminal = 18; };
      monospace = {
        name = "ZedMono Nerd Font";
        package = pkgs.nerdfonts.override { fonts = [ "ZedMono" ]; };
      };
    };
  };
}
