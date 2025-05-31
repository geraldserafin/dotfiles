{ inputs, pkgs, ... }:

{
  imports = [ inputs.stylix.homeModules.stylix ];
  stylix = {
    enable = true;
    autoEnable = true;
    image = ./black-mountains.jpg;
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/black-metal-marduk.yaml";
    fonts = {
      sizes = { terminal = 17; };
      monospace = {
        name = "Iosevka Nerd Font";
        package = pkgs.nerd-fonts.iosevka;
      };
    };
  };
}
