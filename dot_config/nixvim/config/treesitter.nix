{ config, pkgs, ... }:
{
  plugins.treesitter = {
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
    highlight.enable = true;
    indent.enable = true;
    # folding.enable = true;
    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      bash
      json
      lua
      make
      markdown
      nix
      regex
      toml
      vim
      vimdoc
      xml
      yaml
      javascript
      typescript
      tsx
      blade
      php
    ];
  };
}





