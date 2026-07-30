{
  plugins.mini-keymap = {
    enable = true;
    luaConfig.post = ''
      -- Navigasi 'mini.completion' menu dengan Tab / S-Tab
      MiniKeymap.map_multistep("i", "<Tab>", { "pmenu_next" })
      MiniKeymap.map_multistep("i", "<S-Tab>", { "pmenu_prev" })

      -- Pada CR (Enter), terima item completion, fall back ke minipairs
      MiniKeymap.map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })

      -- Pada BS (Backspace), jalankan logika pasangan (mini.pairs)
      MiniKeymap.map_multistep("i", "<BS>", { "minipairs_bs" })
    '';
  };
}
