{ lib, ... }:

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
}
