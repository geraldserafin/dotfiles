{ lib, namespace, ... }:

{
  mkBoolOption = description:
    lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = description;
    };

  mkStringOption = value: description:
    lib.mkOption {
      type = lib.types.str;
      default = value;
      description = description;
    };

  mkModule = name: config: args:
    let enable = config.${namespace}.${name}.enable;
    in {
      options.${namespace}.${name} = {
        enable = lib.mkEnableOption name;
      } // (args.options or { });

      config = let in lib.mkIf enable (args.config or { });
    };

  enabled = { enable = true; };
  disabled = { enable = false; };
}
