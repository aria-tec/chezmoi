{ pkgs, ... }:

{
  # 1. Menginstal mini.nvim melalui extraPlugins
  extraPlugins = [
    pkgs.vimPlugins.mini-nvim
  ];

  # 2. Karena plugin diinstal via extraPlugins,
  # Anda WAJIB menjalankan setup() secara manual via extraConfigLua
  extraConfigLuaPost = ''
    require('mini.input').setup()
  '';
}
