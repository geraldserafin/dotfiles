{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = { decorations = "None"; };
      env = { TERM = "alacritty-direct"; };
    };
  };
}
