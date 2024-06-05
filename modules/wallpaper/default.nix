{ ... }:

{
  home.file.".background-image".source = ./background-image;

  xsession.initExtra = ''
    feh --bg-scale ~/.background-image &
  '';
}
