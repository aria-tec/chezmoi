{ lib, ... }:
{
  plugins.mini-completion = {
    enable = true;
    settings = {
      lsp_completion = {
        source_func = "omnifunc";
        auto_setup = false;
        process_items = lib.nixvim.mkRaw ''
          function(items, base)
            local opts = { kind_priority = { Text = -1, Snippet = 99 } }
            return MiniCompletion.default_process_items(items, base, opts)
          end
        '';
      };
    };
  };
  autoCmd = [
    {
      event = ["LspAttach"];
      callback = {
        __raw = ''
          function(ev)
            vim.bo[ev.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
          end
        '';
      };
      desc = "Set 'omnifunc' untuk mini.completion";
    }
  ];
  extraConfigLua = ''
    -- Menggunakan MiniCompletion yang benar untuk capabilities
    vim.lsp.config("*", { capabilities = MiniCompletion.get_lsp_capabilities() })
  '';
}
