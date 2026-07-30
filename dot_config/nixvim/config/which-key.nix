{ lib, ... }: # Cukup gunakan lib, karena mkRaw ada di dalam lib.nixvim

{
  plugins.which-key = {
    enable = true;
    settings = {
      delay = 0;
      # Menggunakan path yang benar: lib.nixvim.mkRaw
      defer = lib.nixvim.mkRaw "function(ctx) return false end";

      preset = "helix";
      

      spec = [
        { __unkeyed-1 = "<Leader>b"; group = "Buffer"; icon = "󰈔 "; }
        { __unkeyed-1 = "<Leader>e"; group = "Explore/Edit"; icon = "󰙅 "; }
        { __unkeyed-1 = "<Leader>f"; group = "Find"; icon = "󰍉 "; }
        { __unkeyed-1 = "<Leader>g"; group = "Git"; icon = "󰊢 "; }
        { __unkeyed-1 = "<Leader>l"; group = "Language"; icon = "󰌠 "; }
        { __unkeyed-1 = "<Leader>m"; group = "Map"; icon = "󰗺 "; }
        { __unkeyed-1 = "<Leader>o"; group = "Other"; icon = "󰠢 "; }
        { __unkeyed-1 = "<Leader>s"; group = "Session"; icon = "󰆓 "; }
        { __unkeyed-1 = "<Leader>t"; group = "Terminal"; icon = " "; }
        { __unkeyed-1 = "<Leader>v"; group = "Visits"; icon = "󰑣 "; }
        { __unkeyed-1 = "<Leader>w"; group = "Window"; icon = "󱂬 "; }
      ];
    };
  };
}
