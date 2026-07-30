{
  plugins.lsp = {
    enable = true;
    # lazyLoad = {
    #   enable = true;
    #   settings = {
    #     event = [
    #       "BufReadPre"
    #       "BufNewFile"
    #     ];
    #   };
    # };
  };
  plugins.lsp.servers = {
    nil_ls.enable = true;
    # tsserver.enable = true;
    ts_ls.enable = true;
    vtsls.enable = true;
    tsgo.enable = true;
  };
}
