{ pkgs, lib, ... }:
{
  # Menyediakan binary ripgrep (rg) secara otomatis ke dalam Neovim
  extraPackages = [
    pkgs.ripgrep
  ];

  clipboard.register = "unnamedplus";

  globals = {
    mapleader = " ";
    maplocalleader = "\\";

    # Konfigurasi eksplisit OSC 52 Provider Neovim untuk SSH
    clipboard = {
      name = "OSC 52";
      copy = {
        "+" = lib.nixvim.mkRaw "require('vim.ui.clipboard.osc52').copy('+')";
        "*" = lib.nixvim.mkRaw "require('vim.ui.clipboard.osc52').copy('*')";
      };
      paste = {
        "+" = lib.nixvim.mkRaw "require('vim.ui.clipboard.osc52').paste('+')";
        "*" = lib.nixvim.mkRaw "require('vim.ui.clipboard.osc52').paste('*')";
      };
    };

    # LazyVim & plugin globals
    autoformat = true;
    snacks_animate = true;
    ai_cmp = true;
    deprecation_warnings = false;
    trouble_lualine = true;
    markdown_recommended_style = 0;
  };

  opts = {
    autowrite = true; # Enable auto write
    completeopt = [ "menu" "menuone" "noselect" ];
    conceallevel = 2; # Hide * markup for bold and italic
    confirm = true; # Confirm to save changes before exiting modified buffer
    cursorline = true; # Enable highlighting of the current line
    expandtab = true; # Use spaces instead of tabs
    fillchars = {
      foldopen = " ";
      foldclose = " ";
      fold = " ";
      foldsep = " ";
      diff = "╱";
      eob = " ";
    };
    foldlevel = 99;
    foldmethod = "indent";
    foldtext = "";
    formatoptions = "jcroqlnt";
    grepformat = "%f:%l:%c:%m";
    grepprg = "rg --vimgrep"; # Menggunakan ripgrep (membutuhkan pkgs.ripgrep di extraPackages)
    ignorecase = true; # Ignore case
    inccommand = "nosplit"; # Preview incremental substitute
    jumpoptions = "view";
    laststatus = 3; # Global statusline
    linebreak = true; # Wrap lines at convenient points
    list = true; # Show some invisible characters
    mouse = "a"; # Enable mouse mode
    number = true; # Print line number
    pumblend = 10; # Popup blend
    pumheight = 10; # Maximum number of entries in a popup
    relativenumber = true; # Relative line numbers
    ruler = false; # Disable the default ruler
    scrolloff = 4; # Lines of context
    sessionoptions = [
      "buffers"
      "curdir"
      "tabpages"
      "winsize"
      "help"
      "globals"
      "skiprtp"
      "folds"
    ];
    shiftround = true; # Round indent
    shiftwidth = 2; # Size of an indent
    shortmess = "WicC";
    showmode = false; # Don't show mode since statusline is used
    sidescrolloff = 8; # Columns of context
    signcolumn = "yes"; # Always show the signcolumn
    smartcase = true; # Don't ignore case with capitals
    smartindent = true; # Insert indents automatically
    smoothscroll = true;
    spelllang = [ "en" ];
    splitbelow = true; # Put new windows below current
    splitkeep = "screen";
    splitright = true; # Put new windows right of current
    tabstop = 2; # Number of spaces tabs count for
    termguicolors = true; # True color support
    timeoutlen = 300; # Quickly trigger which-key / shortcuts
    undofile = true;
    undolevels = 10000;
    updatetime = 200; # Save swap file and trigger CursorHold
    virtualedit = "block"; # Allow cursor to move where there is no text in visual block mode
    wildmode = "longest:full,full"; # Command-line completion mode
    winminwidth = 5; # Minimum window width
    wrap = false; # Disable line wrap

    # Omitted LazyVim-specific options:
    # formatexpr = "v:lua.LazyVim.format.formatexpr()";
    # statuscolumn = "%!v:lua.LazyVim.statuscolumn()";
  };

  diagnostic.settings = {
    virtual_text = true;
    signs = true;
    underline = true;
    severity_sort = true;
    update_in_insert = true;
  };
}
