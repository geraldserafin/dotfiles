{ pkgs, inputs, ... }: 
let 
  userModulesBasePath = ../../modules/user;
  importModules = name: import ("${userModulesBasePath}/${name}");
in
{
  nixpkgs.config.allowUnfree = true;
 
  home.username = "gerald";
  home.homeDirectory = "/home/gerald";
  home.stateVersion = "23.11";
  
  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    firefox
    xmobar
    killall
    rofi
    spotify
    telegram-desktop
    pavucontrol 
  ];

  home.sessionVariables = {
    TERMINAL = "alacritty";
    BROWSER = "firefox";
  };

  programs.home-manager.enable = true;
 
  fonts.fontconfig.enable = true;
  

  imports = [	
    inputs.nixvim.homeManagerModules.nixvim
  ] ++ map importModules [
    "git"
    "vim" 
    "xmonad" 
    "xmobar" 
    "alacritty" 
  ];
}

