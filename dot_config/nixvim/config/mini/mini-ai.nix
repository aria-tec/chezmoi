{ lib, ... }:
{
  plugins.mini-ai = {
    enable = true;
    settings = {
      custom_textobjects = {
        B = lib.nixvim.mkRaw "require('mini.extra').gen_ai_spec.buffer()";
        F = lib.nixvim.mkRaw "require('mini.ai').gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' })";
      };
      search_method = "cover";
    };
  };
}
