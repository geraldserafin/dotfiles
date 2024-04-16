{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    initExtra = ''
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
    '';
    shellAliases = {
      rebuild =
        "sudo nixos-rebuild switch --flake '/home/gerald/.dotfiles#default'";
      develop = "nix develop -c zsh";
    };
    zplug = {
      enable = true;
      plugins = [{
        name = "romkatv/powerlevel10k";
        tags = [ "as:theme" "depth:1" ];
      }];
    };
  };
}
