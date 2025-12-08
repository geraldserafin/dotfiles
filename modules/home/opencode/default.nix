{
  config,
  lib,
  namespace,
  ...
}:

lib.${namespace}.mkModule "opencode" config {
  config = {
    programs.opencode = {
      enable = true;
      settings = {
        "$schema" = "https://opencode.ai/config.json";
        plugin = [
          "opencode-gemini-auth@latest"
        ];
        provider.google.models = {
          gemini-3-1-pro-preview.options.thinkingConfig = {
            thinkingLevel = "low";
            includeThoughts = false;
          };
        };
      };
    };
  };
}
