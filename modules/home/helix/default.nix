{ config, lib, namespace, ... }:

lib.${namespace}.mkModule "helix" config {
  config = {
    programs.helix = {
      enable = true;
      settings = { };
      languages.language = [{
        name = "nix";
        auto-format = true;
      }];
    };
  };

}
