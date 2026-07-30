{
  # Aktifkan optimasi bytecode
  performance = {
    byteCompileLua = {
      enable = true;
      nvimRuntime = true; # Mengompilasi juga runtime Neovim
      configs = true;     # Mengompilasi konfigurasi Anda
      plugins = true;     # Mengompilasi plugin yang terpasang
      initLua = true;
      luaLib = true;
    };
    combinePlugins = {
      enable = true;
      standalonePlugins = [ "friendly-snippets" ];
      # Menentukan plugin mana yang akan digabungkan
      # 'default = true' berarti menggabungkan sebagian besar plugin
    };
  };

  # ... sisa konfigurasi Anda
}
