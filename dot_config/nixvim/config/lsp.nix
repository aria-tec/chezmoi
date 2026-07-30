{
  plugins.lsp = {
    enable = true;
  };

  plugins.lsp.servers = {
    nil_ls.enable = true;
    vtsls.enable = true;

    rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
      settings = {
        cargo = {
          allFeatures = true;
          buildScripts = {
            enable = true;
          };
        };
        check = {
          command = "clippy";
        };
        procMacro = {
          enable = true;
        };
        inlayHints = {
          typeHints.enable = true;
          parameterHints.enable = true;
          chainingHints.enable = true;
        };
      };
    };
  };
}
