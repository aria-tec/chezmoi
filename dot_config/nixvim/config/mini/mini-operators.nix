{
  plugins.mini-operators = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "(";
      action = "gxiagxila";
      options = {
        remap = true;
        desc = "Swap arg left";
      };
    }
    {
      mode = "n";
      key = ")";
      action = "gxiagxina";
      options = {
        remap = true;
        desc = "Swap arg right";
      };
    }
  ];
}
