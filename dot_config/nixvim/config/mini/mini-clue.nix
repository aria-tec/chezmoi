{ lib, ... }:

{
  plugins.mini-clue = {
    enable = true;
    settings = {
      triggers = [
        # Leader triggers
        { mode = [ "n" "x" ]; keys = "<Leader>"; }

        # mini.basics
        { mode = "n";       keys = "\\"; }

        # -- `[` and `]` keys
        { mode = "n"; keys = "["; }
        { mode = "n"; keys = "]"; }

        # -- Built-in completion
        { mode = "i"; keys = "<C-x>"; }

        # `g` key
        { mode = [ "n" "x" ]; keys = "g"; }

        # Marks
        { mode = [ "n" "x" ]; keys = "'"; }
        { mode = [ "n" "x" ]; keys = "`"; }

        # Registers
        { mode = [ "n" "x" ]; keys = "\""; }
        { mode = [ "i" "c" ]; keys = "<C-r>"; }

        # Window commands
        { mode = "n"; keys = "<C-w>"; }

        # `s` mini-surround
        { mode = ["n" "x"]; keys = "s"; }

        # `z` key
        { mode = [ "n" "x" ]; keys = "z"; }
      ];

      clues = [
        (lib.nixvim.mkRaw "require('mini.clue').gen_clues.square_brackets()")
        (lib.nixvim.mkRaw "require('mini.clue').gen_clues.builtin_completion()")
        (lib.nixvim.mkRaw "require('mini.clue').gen_clues.g()")
        (lib.nixvim.mkRaw "require('mini.clue').gen_clues.marks()")
        (lib.nixvim.mkRaw "require('mini.clue').gen_clues.registers({ show_contents = true })")
        (lib.nixvim.mkRaw "require('mini.clue').gen_clues.windows()")
        (lib.nixvim.mkRaw "require('mini.clue').gen_clues.z()")

        # Clue manual untuk Leader groups
        { mode = "n"; keys = "<Leader>b"; desc = "+Buffer"; }
        { mode = "n"; keys = "<Leader>e"; desc = "+Explore/Edit"; }
        { mode = "n"; keys = "<Leader>f"; desc = "+Find"; }
        { mode = "n"; keys = "<Leader>g"; desc = "+Git"; }
        { mode = "n"; keys = "<Leader>l"; desc = "+Language"; }
        { mode = "n"; keys = "<Leader>m"; desc = "+Map"; }
        { mode = "n"; keys = "<Leader>o"; desc = "+Other"; }
        { mode = "n"; keys = "<Leader>s"; desc = "+Session"; }
        { mode = "n"; keys = "<Leader>t"; desc = "+Terminal"; }
        { mode = "n"; keys = "<Leader>v"; desc = "+Visits"; }
        { mode = "n"; keys = "<Leader>w"; desc = "+Window"; }

        { mode = "x"; keys = "<Leader>g"; desc = "+Git"; }
        { mode = "x"; keys = "<Leader>l"; desc = "+Language"; }
      ];

      window = {
        delay = 0;
      };
    };
  };
}
