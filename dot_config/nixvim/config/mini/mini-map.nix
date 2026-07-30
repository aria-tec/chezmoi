{ lib, ... }:

{
  plugins.mini-map = {
    enable = true;
    settings = {
      # Kita tidak menggunakan mkRaw langsung ke MiniMap,
      # tapi menggunakan fungsi yang akan memanggil 'require' nanti
      symbols = {
        encode = lib.nixvim.mkRaw "require('mini.map').gen_encode_symbols.dot('4x2')";
      };

      integrations = lib.nixvim.mkRaw ''
        {
          require('mini.map').gen_integration.builtin_search(),
          require('mini.map').gen_integration.diff(),
          require('mini.map').gen_integration.diagnostic(),
        }
      '';
    };

    luaConfig.post = ''
      for _, key in ipairs({ "n", "N", "*", "#" }) do
        local rhs = key
          .. "zv"
          .. "<Cmd>lua require('mini.map').refresh({}, { lines = false, scrollbar = false })<CR>"
        vim.keymap.set("n", key, rhs)
      end
    '';
  };
}
