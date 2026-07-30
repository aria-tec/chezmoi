{ lib, ... }:
{
  plugins.mini-hipatterns = {
    enable = true;
    settings = {
      highlighters = {
        fixme = lib.nixvim.mkRaw "require('mini.extra').gen_highlighter.words({'FIXME', 'Fixme', 'fixme'}, 'MiniHipatternsFixme')";
        hack = lib.nixvim.mkRaw "require('mini.extra').gen_highlighter.words({'HACK', 'Hack', 'hack'}, 'MiniHipatternsHack')";
        todo = lib.nixvim.mkRaw "require('mini.extra').gen_highlighter.words({'TODO', 'Todo', 'todo'}, 'MiniHipatternsTodo')";
        note = lib.nixvim.mkRaw "require('mini.extra').gen_highlighter.words({'NOTE', 'Note', 'note'}, 'MiniHipatternsNote')";

        # Highlight hex color (#aabbcc)
        hex_color = lib.nixvim.mkRaw "require('mini.hipatterns').gen_highlighter.hex_color()";
      };
    };
  };
}
