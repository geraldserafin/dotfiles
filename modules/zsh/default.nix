{ config, pkgs, ... }:

{
  home.sessionVariables.SHELL = "${pkgs.zsh}/bin/zsh";
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    initExtra = ''
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
    '';
    shellAliases = {
      rebuild =
        "sudo nixos-rebuild switch --flake '${config.home.homeDirectory}/repos/dotfiles#default'";
      develop = "nix develop -c zsh";
      gswc = "git checkout -b";
      gsw = "git checkout";
      pomodoro = "~/.pomodoro/pomodoro-clock-cli";
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
