{
  globals = {
    mapleader = " ";
    # clipboard = "osc52";
    # loaded_netrw = 1;
    # loaded_netrwPlugin = 1;
  };
  opts = {
    completeopt = [
        "menu"
        "menuone"
        # "preselect"
        "noinsert"
        "noselect"
        "popup"
      ];
    conceallevel = 2;
    confirm = true;
    cursorline = true;
    expandtab = true;
    # number = true;
    relativenumber = true;
    # clipboard = "unnamedplus";
    laststatus = 3; # Menggunakan statusline global tunggal
    showmode = false; # Menghapus indikator mode bawaan Neovim
    autoindent = true;
    smartindent = true;
    shiftwidth = 2;
    tabstop = 2;
    ruler = false;
    # termguicolors = true;
    winblend = 10;
    pumblend = 10;
    cmdheight = 0;
    updatetime = 300;
    termguicolors = true;
  };
  diagnostic.settings = {
    # Menampilkan semua pesan di akhir baris
    virtual_text = true;

    # Menampilkan ikon di sign column (sisi kiri)
    signs = true;

    # Memberikan efek garis bawah pada kode yang bermasalah
    underline = true;

    # Mengurutkan berdasarkan tingkat keparahan (Error di paling atas)
    severity_sort = true;

    # Memperbarui diagnostik saat Anda mengetik
    update_in_insert = true;
  };
}
