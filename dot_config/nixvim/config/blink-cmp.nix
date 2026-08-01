{
  plugins.blink-cmp = {
    enable = true;

    settings = {
      # Skema shortcut tombol menggunakan preset default Neovim/Vim
      keymap = {
        preset = "default";
      };

      # Sumber data completion (LSP, path, snippets, buffer)
      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
      };

      # Tampilan dokumentasi popup & ghost text
      completion = {
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 200;
        };
        ghost_text = {
          enabled = true;
        };
      };

      # Fuzzy matcher engine
      fuzzy = {
        implementation = "prefer_rust_with_warning";
      };
    };
  };
}
