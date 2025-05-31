{
  plugins.avante = {
    enable = true;
    settings = {
      provider = "deepseek";
      vendors = {
        deepseek = {
          __inherited_from = "openai";
          api_key_name = "DEEPSEEK_API_KEY";
          endpoint = "https://api.deepseek.com";
          model = "deepseek-coder";
        };
      };
      windows.sidebar_header.enabled = false;
    };
  };
}
