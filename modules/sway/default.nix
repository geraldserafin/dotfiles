{ lib, ... }:

let mod = "Mod4";
in {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = mod;
      bars = [{ command = "waybar"; }];
      terminal = "alaritty";
      input = {
        "*" = {
          xkb_layout = "us";
          xkb_variant = "workman";
        };
      };
      defaultWorkspace = "workspace number 1";
      keybindings = lib.mkOptionDefault {
        "${mod}+Return" = "exec alacritty";
        "${mod}+q" = "kill";
      };
      floating = { criteria = [{ class = "Pavucontrol"; }]; };
      window = { titlebar = false; };
    };
  };
}
