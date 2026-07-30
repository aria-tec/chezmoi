{ lib, ... }:

{
  plugins.mini-snippets = {
    enable = true;
    settings = {
      snippets = [
        # Kita gunakan mkRaw untuk fungsi generator yang membutuhkan evaluasi Lua
        (lib.nixvim.mkRaw "require('mini.snippets').gen_loader.from_file(vim.fn.stdpath('config') .. '/snippets/global.json')")
        (lib.nixvim.mkRaw ''
          require('mini.snippets').gen_loader.from_lang({
            lang_patterns = {
              tex = { "latex/**/*.json", "**/latex.json" },
              plaintex = { "latex/**/*.json", "**/latex.json" },
              markdown_inline = { "markdown.json" },
              blade = { "blade/**/*.json" },
            }
          })
        '')
      ];
    };
  };

  # Tetap gunakan ini untuk memicu server LSP in-process
  extraConfigLuaPost = ''
    MiniSnippets.start_lsp_server()
  '';
}
