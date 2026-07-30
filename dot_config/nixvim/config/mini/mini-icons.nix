{
  plugins.mini-icons = {
    enable = true;
    mockDevIcons = true;

  };
  extraConfigLua = ''
    require('mini.icons').tweak_lsp_kind()
  '';
}
