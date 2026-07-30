{ lib, ...}:
{
  plugins.mini-animate = {
    enable = true;
    settings = {
      close = {
        enable = true;
        timing = lib.nixvim.utils.mkRaw "require('mini.animate').gen_timing.exponential({ duration = 100, unit = 'total', easing = 'out' })";
      };
      cursor = {
        enable = true;
        timing = lib.nixvim.utils.mkRaw "require('mini.animate').gen_timing.exponential({ duration = 100, unit = 'total', easing = 'out' })";
        path = lib.nixvim.utils.mkRaw ''
          require('mini.animate').gen_path.angle({
          })
        '';
      };
      open = {
        enable = true;
        timing = lib.nixvim.utils.mkRaw "require('mini.animate').gen_timing.exponential({ duration = 100, unit = 'total', easing = 'out' })";
      };
      resize = {
        enable = true;
        timing = lib.nixvim.utils.mkRaw "require('mini.animate').gen_timing.exponential({ duration = 100, unit = 'total', easing = 'out' })";
      };
      scroll = {
        enable = true;
        timing = lib.nixvim.utils.mkRaw "require('mini.animate').gen_timing.exponential({ duration = 100, unit = 'total', easing = 'out' })";
        subscroll = lib.nixvim.utils.mkRaw "require('mini.animate').gen_subscroll.equal({ max_output_steps = 120 })";
      };
    };
  };
}
