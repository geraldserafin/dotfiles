{ config, lib, namespace, ... }:

let
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.aerospace;
in {
  options.${namespace}.aerospace.enable =
    mkBoolOption "Weather to enable Aerospace";

  config = lib.mkIf cfg.enable {
    services.aerospace = {
      enable = true;
      settings = {
        # Place this in your home-manager configuration
        # After that, you can edit it to your liking

        # Commands that run after login to macOS user session
        # 'start-at-login' needs to be 'true' for 'after-login-command' to work
        after-login-command = [ ];

        # 'after-startup-command' is run after 'after-login-command'
        after-startup-command = [ ];

        # Normalizations
        enable-normalization-flatten-containers = true;
        enable-normalization-opposite-orientation-for-nested-containers = true;

        # Layout configurations
        default-root-container-layout = "tiles";
        default-root-container-orientation = "auto";

        # Mouse behavior
        on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

        # App behavior
        automatically-unhide-macos-hidden-apps = false;

        # Key mapping preset
        key-mapping = { preset = "qwerty"; };

        # Window gaps configuration
        gaps = {
          inner = {
            horizontal = 10;
            vertical = 10;
          };
          outer = {
            left = 10;
            bottom = 10;
            top = 10;
            right = 10;
          };
        };

        # Binding modes configuration
        mode = {
          main.binding = {
            alt-slash = "layout tiles horizontal vertical";
            alt-comma = "layout accordion horizontal vertical";

            cmd-h = [ ];
            cmd-alt-h = [ ];

            alt-h = "focus left";
            alt-j = "focus down";
            alt-k = "focus up";
            alt-l = "focus right";

            alt-shift-h = "move left";
            alt-shift-j = "move down";
            alt-shift-k = "move up";
            alt-shift-l = "move right";

            alt-shift-minus = "resize smart -50";
            alt-shift-equal = "resize smart +50";

            alt-1 = "workspace 1";
            alt-2 = "workspace 2";
            alt-3 = "workspace 3";
            alt-4 = "workspace 4";
            alt-5 = "workspace 5";
            alt-6 = "workspace 6";
            alt-7 = "workspace 7";
            alt-8 = "workspace 8";
            alt-9 = "workspace 9";
            alt-shift-1 = "move-node-to-workspace 1";
            alt-shift-2 = "move-node-to-workspace 2";
            alt-shift-3 = "move-node-to-workspace 3";
            alt-shift-4 = "move-node-to-workspace 4";
            alt-shift-5 = "move-node-to-workspace 5";
            alt-shift-6 = "move-node-to-workspace 6";
            alt-shift-7 = "move-node-to-workspace 7";
            alt-shift-8 = "move-node-to-workspace 8";
            alt-shift-9 = "move-node-to-workspace 9";

            alt-tab = "workspace-back-and-forth";
            alt-shift-tab = "move-workspace-to-monitor --wrap-around next";
            alt-shift-semicolon = "mode service";
          };

          service.binding = {
            "esc" = [ "reload-config" "mode main" ];
            "r" = [ "flatten-workspace-tree" "mode main" ];
            "f" = [ "layout floating tiling" "mode main" ];
            "backspace" = [ "close-all-windows-but-current" "mode main" ];

            "alt-shift-h" = [ "join-with left" "mode main" ];
            "alt-shift-j" = [ "join-with down" "mode main" ];
            "alt-shift-k" = [ "join-with up" "mode main" ];
            "alt-shift-l" = [ "join-with right" "mode main" ];

            "down" = "volume down";
            "up" = "volume up";
            "shift-down" = [ "volume set 0" "mode main" ];
          };
        };
      };
    };
  };
}
