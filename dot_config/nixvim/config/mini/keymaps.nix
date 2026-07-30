{
  keymaps = [
    {
      mode = "n";
      key = "[p";
      # Kita gunakan <Cmd> dan memastikan sintaks string-nya benar
      action = "<Cmd>exe 'iput! ' . v:register<CR>";
      options = {
        desc = "Paste Above";
      };
    }
    {
      mode = "n";
      key = "]p";
      action = "<Cmd>exe 'iput ' . v:register<CR>";
      options = {
        desc = "Paste Below";
      };
    }

    # Buffer Mappings (<Leader>b)
    { mode = "n"; key = "<Leader>ba"; action = "<Cmd>b#<CR>"; options = { desc = "Alternate"; }; }
    { mode = "n"; key = "<Leader>bd"; action = "<Cmd>lua MiniBufremove.delete()<CR>"; options = { desc = "Delete"; }; }
    { mode = "n"; key = "<Leader>bD"; action = "<Cmd>lua MiniBufremove.delete(0, true)<CR>"; options = { desc = "Delete!"; }; }
    { mode = "n"; key = "<Leader>bw"; action = "<Cmd>lua MiniBufremove.wipeout()<CR>"; options = { desc = "Wipeout"; }; }
    { mode = "n"; key = "<Leader>bW"; action = "<Cmd>lua MiniBufremove.wipeout(0, true)<CR>"; options = { desc = "Wipeout!"; }; }

    # Scratch buffer (menggunakan fungsi Lua in-line)
    {
      mode = "n";
      key = "<Leader>bs";
      action = "<Cmd>lua vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))<CR>";
      options = { desc = "Scratch"; };
    }

    # Sidebar Navigation (NvimTree)
    # {
    #   mode = "n";
    #   key = "<Leader>ed";
    #   action = "<Cmd>NvimTreeToggle<CR>";
    #   options = { desc = "Toggle Sidebar"; };
    # }
    # {
    #   mode = "n";
    #   key = "<Leader>ef";
    #   action = "<Cmd>NvimTreeFindFile<CR>";
    #   options = { desc = "Find in Sidebar"; };
    # }

    # Mini files
    {
      mode = "n";
      key = "<Leader>ed";
      action = "<Cmd>lua MiniFiles.open()<CR>";
      options = { desc = "Directory"; };
    }
    {
 mode = "n";
      key = "<Leader>ef";
      action = "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>";
      options = { desc = "File Directory"; };
    }


    # Notifications (MiniNotify)
    {
      mode = "n";
      key = "<Leader>en";
      action = "<Cmd>lua MiniNotify.show_history()<CR>";
      options = { desc = "Notifications"; };
    }

    # Quickfix & Loclist
    # Langsung memanggil fungsi inline untuk toggle tanpa bantuan helper Lua di luar
    {
      mode = "n";
      key = "<Leader>eq";
      action = "<Cmd>lua if vim.fn.getqflist({winid=0}).winid ~= 0 then vim.cmd('cclose') else vim.cmd('copen') end<CR>";
      options = { desc = "Quickfix list"; };
    }
    {
      mode = "n";
      key = "<Leader>eQ";
      action = "<Cmd>lua if vim.fn.getloclist(0, {winid=0}).winid ~= 0 then vim.cmd('lclose') else vim.cmd('lopen') end<CR>";
      options = { desc = "Location list"; };
    }

    { mode = "n"; key = "<Leader>f/"; action = "<Cmd>Pick history scope='/'<CR>"; options = { desc = "'/' history"; }; }
    { mode = "n"; key = "<Leader>f:"; action = "<Cmd>Pick history scope=':'<CR>"; options = { desc = "':' history"; }; }
    { mode = "n"; key = "<Leader>fa"; action = "<Cmd>Pick git_hunks scope='staged'<CR>"; options = { desc = "Added hunks (all)"; }; }
    { mode = "n"; key = "<Leader>fA"; action = "<Cmd>Pick git_hunks path='%' scope='staged'<CR>"; options = { desc = "Added hunks (buf)"; }; }
    { mode = "n"; key = "<Leader>fb"; action = "<Cmd>Pick buffers<CR>"; options = { desc = "Buffers"; }; }
    { mode = "n"; key = "<Leader>fc"; action = "<Cmd>Pick git_commits<CR>"; options = { desc = "Commits (all)"; }; }
    { mode = "n"; key = "<Leader>fC"; action = "<Cmd>Pick git_commits path='%'<CR>"; options = { desc = "Commits (buf)"; }; }
    { mode = "n"; key = "<Leader>fd"; action = "<Cmd>Pick diagnostic scope='all'<CR>"; options = { desc = "Diagnostic workspace"; }; }
    { mode = "n"; key = "<Leader>fD"; action = "<Cmd>Pick diagnostic scope='current'<CR>"; options = { desc = "Diagnostic buffer"; }; }
    { mode = "n"; key = "<Leader>ff"; action = "<Cmd>Pick files<CR>"; options = { desc = "Files"; }; }
    { mode = "n"; key = "<Leader>fg"; action = "<Cmd>Pick grep_live<CR>"; options = { desc = "Grep live"; }; }
    { mode = "n"; key = "<Leader>fG"; action = "<Cmd>Pick grep pattern='<cword>'<CR>"; options = { desc = "Grep current word"; }; }
    { mode = "n"; key = "<Leader>fh"; action = "<Cmd>Pick help<CR>"; options = { desc = "Help tags"; }; }
    { mode = "n"; key = "<Leader>fH"; action = "<Cmd>Pick hl_groups<CR>"; options = { desc = "Highlight groups"; }; }
    { mode = "n"; key = "<Leader>fl"; action = "<Cmd>Pick buf_lines scope='all'<CR>"; options = { desc = "Lines (all)"; }; }
    { mode = "n"; key = "<Leader>fL"; action = "<Cmd>Pick buf_lines scope='current'<CR>"; options = { desc = "Lines (buf)"; }; }
    { mode = "n"; key = "<Leader>fm"; action = "<Cmd>Pick git_hunks<CR>"; options = { desc = "Modified hunks (all)"; }; }
    { mode = "n"; key = "<Leader>fM"; action = "<Cmd>Pick git_hunks path='%'<CR>"; options = { desc = "Modified hunks (buf)"; }; }
    { mode = "n"; key = "<Leader>fr"; action = "<Cmd>Pick resume<CR>"; options = { desc = "Resume"; }; }
    { mode = "n"; key = "<Leader>fR"; action = "<Cmd>Pick lsp scope='references'<CR>"; options = { desc = "References (LSP)"; }; }
    { mode = "n"; key = "<Leader>fs"; action = "<Cmd>Pick lsp scope='workspace_symbol_live'<CR>"; options = { desc = "Symbols workspace (live)"; }; }
    { mode = "n"; key = "<Leader>fS"; action = "<Cmd>Pick lsp scope='document_symbol'<CR>"; options = { desc = "Symbols document"; }; }
    { mode = "n"; key = "<Leader>fv"; action = "<Cmd>Pick visit_paths cwd=''<CR>"; options = { desc = "Visit paths (all)"; }; }
    { mode = "n"; key = "<Leader>fV"; action = "<Cmd>Pick visit_paths<CR>"; options = { desc = "Visit paths (cwd)"; }; }




    # Git Mappings (<Leader>g)
    { mode = "n"; key = "<Leader>ga"; action = "<Cmd>Git diff --cached<CR>"; options = { desc = "Added diff"; }; }
    { mode = "n"; key = "<Leader>gA"; action = "<Cmd>Git diff --cached -- %<CR>"; options = { desc = "Added diff buffer"; }; }
    { mode = "n"; key = "<Leader>gc"; action = "<Cmd>Git commit<CR>"; options = { desc = "Commit"; }; }
    { mode = "n"; key = "<Leader>gC"; action = "<Cmd>Git commit --amend<CR>"; options = { desc = "Commit amend"; }; }
    { mode = "n"; key = "<Leader>gd"; action = "<Cmd>Git diff<CR>"; options = { desc = "Diff"; }; }
    { mode = "n"; key = "<Leader>gD"; action = "<Cmd>Git diff -- %<CR>"; options = { desc = "Diff buffer"; }; }

    # Log commands (langsung dimasukkan string-nya)
    {
      mode = "n";
      key = "<Leader>gl";
      action = "<Cmd>Git log --pretty=format:%h\\ %as\\ │\\ %s --topo-order<CR>";
      options = { desc = "Log"; };
    }
    {
      mode = "n";
      key = "<Leader>gL";
      action = "<Cmd>Git log --pretty=format:%h\\ %as\\ │\\ %s --topo-order --follow -- %<CR>";
      options = { desc = "Log buffer"; };
    }

    # MiniGit & MiniDiff
    { mode = "n"; key = "<Leader>go"; action = "<Cmd>lua MiniDiff.toggle_overlay()<CR>"; options = { desc = "Toggle overlay"; }; }
    { mode = "n"; key = "<Leader>gs"; action = "<Cmd>lua MiniGit.show_at_cursor()<CR>"; options = { desc = "Show at cursor"; }; }
    { mode = "x"; key = "<Leader>gs"; action = "<Cmd>lua MiniGit.show_at_cursor()<CR>"; options = { desc = "Show at selection"; }; }




    # LSP & Code Actions (<Leader>l)
    { mode = "n"; key = "<Leader>la"; action = "<Cmd>lua vim.lsp.buf.code_action()<CR>"; options = { desc = "Actions"; }; }
    { mode = "n"; key = "<Leader>ld"; action = "<Cmd>lua vim.diagnostic.open_float()<CR>"; options = { desc = "Diagnostic popup"; }; }
    { mode = "n"; key = "<Leader>lf"; action = "<Cmd>lua require('conform').format()<CR>"; options = { desc = "Format"; }; }
    { mode = "n"; key = "<Leader>li"; action = "<Cmd>lua vim.lsp.buf.implementation()<CR>"; options = { desc = "Implementation"; }; }
    { mode = "n"; key = "<Leader>lh"; action = "<Cmd>lua vim.lsp.buf.hover()<CR>"; options = { desc = "Hover"; }; }
    { mode = "n"; key = "<Leader>ll"; action = "<Cmd>lua vim.lsp.codelens.run()<CR>"; options = { desc = "Lens"; }; }
    { mode = "n"; key = "<Leader>lr"; action = "<Cmd>lua vim.lsp.buf.rename()<CR>"; options = { desc = "Rename"; }; }
    { mode = "n"; key = "<Leader>lR"; action = "<Cmd>lua vim.lsp.buf.references()<CR>"; options = { desc = "References (LSP)"; }; }
    { mode = "n"; key = "<Leader>ls"; action = "<Cmd>lua vim.lsp.buf.definition()<CR>"; options = { desc = "Source definition"; }; }
    { mode = "n"; key = "<Leader>lt"; action = "<Cmd>lua vim.lsp.buf.type_definition()<CR>"; options = { desc = "Type definition"; }; }

    # Visual Mode
    { mode = "x"; key = "<Leader>lf"; action = "<Cmd>lua require('conform').format()<CR>"; options = { desc = "Format selection"; }; }



    # Map (<Leader>m)
    { mode = "n"; key = "<Leader>mf"; action = "<Cmd>lua MiniMap.toggle_focus()<CR>"; options = { desc = "Focus (toggle)"; }; }
    { mode = "n"; key = "<Leader>mr"; action = "<Cmd>lua MiniMap.refresh()<CR>"; options = { desc = "Refresh"; }; }
    { mode = "n"; key = "<Leader>ms"; action = "<Cmd>lua MiniMap.toggle_side()<CR>"; options = { desc = "Side (toggle)"; }; }
    { mode = "n"; key = "<Leader>mt"; action = "<Cmd>lua MiniMap.toggle()<CR>"; options = { desc = "Toggle"; }; }

    # Other (<Leader>o)
    { mode = "n"; key = "<Leader>or"; action = "<Cmd>lua MiniMisc.resize_window()<CR>"; options = { desc = "Resize to default width"; }; }
    { mode = "n"; key = "<Leader>ot"; action = "<Cmd>lua MiniTrailspace.trim()<CR>"; options = { desc = "Trim trailspace"; }; }
    { mode = "n"; key = "<Leader>oz"; action = "<Cmd>lua MiniMisc.zoom()<CR>"; options = { desc = "Zoom toggle"; }; }

    # Session (<Leader>s)
    { mode = "n"; key = "<Leader>sd"; action = "<Cmd>lua MiniSessions.select('delete')<CR>"; options = { desc = "Delete"; }; }
    { mode = "n"; key = "<Leader>sr"; action = "<Cmd>lua MiniSessions.select('read')<CR>"; options = { desc = "Read"; }; }
    { mode = "n"; key = "<Leader>sR"; action = "<Cmd>lua MiniSessions.restart()<CR>"; options = { desc = "Restart"; }; }
    # { mode = "n"; key = "<Leader>sR"; action = "<Cmd>restart()<CR>"; options = { desc = "Restart"; }; }
    { mode = "n"; key = "<Leader>sw"; action = "<Cmd>lua MiniSessions.write()<CR>"; options = { desc = "Write current"; }; }

    # Terminal (<Leader>t)
    { mode = "n"; key = "<Leader>tT"; action = "<Cmd>horizontal term<CR>"; options = { desc = "Terminal (horizontal)"; }; }
    { mode = "n"; key = "<Leader>tt"; action = "<Cmd>vertical term<CR>"; options = { desc = "Terminal (vertical)"; }; }

    # Visits (<Leader>v)
    { mode = "n"; key = "<Leader>vv"; action = "<Cmd>lua MiniVisits.add_label('core')<CR>"; options = { desc = "Add \"core\" label"; }; }
    { mode = "n"; key = "<Leader>vV"; action = "<Cmd>lua MiniVisits.remove_label('core')<CR>"; options = { desc = "Remove \"core\" label"; }; }
    { mode = "n"; key = "<Leader>vl"; action = "<Cmd>lua MiniVisits.add_label()<CR>"; options = { desc = "Add label"; }; }
    { mode = "n"; key = "<Leader>vL"; action = "<Cmd>lua MiniVisits.remove_label()<CR>"; options = { desc = "Remove label"; }; }

    # Window (<Leader>w)
    { mode = "n"; key = "<Leader>wc"; action = "<Cmd>close<CR>"; options = { desc = "Close window"; }; }
    { mode = "n"; key = "<Leader>wn"; action = "<Cmd>new<CR>"; options = { desc = "New window (horizontal)"; }; }
    { mode = "n"; key = "<Leader>wN"; action = "<Cmd>vnew<CR>"; options = { desc = "New window (vertical)"; }; }
    { mode = "n"; key = "<Leader>wo"; action = "<Cmd>only<CR>"; options = { desc = "Close other windows"; }; }
    { mode = "n"; key = "<Leader>ws"; action = "<Cmd>split<CR>"; options = { desc = "Split horizontally"; }; }
    { mode = "n"; key = "<Leader>wv"; action = "<Cmd>vsplit<CR>"; options = { desc = "Split vertically"; }; }

    # Session (<Leader>s) - Inlining vim.ui.input
    {
      mode = "n";
      key = "<Leader>sn";
      action = "<Cmd>lua vim.ui.input({ prompt = 'Session name: ' }, MiniSessions.write)<CR>";
      options = { desc = "New"; };
    }

    # Visits (<Leader>v) - Inlining logika filter
    {
      mode = "n";
      key = "<Leader>vc";
      action = "<Cmd>lua MiniExtra.pickers.visit_paths({ cwd = '', filter = 'core', sort = MiniVisits.gen_sort.default({ recency_weight = 1 }) }, { source = { name = 'Core visits (all)' } })<CR>";
      options = { desc = "Core visits (all)"; };
    }
    {
      mode = "n";
      key = "<Leader>vC";
      action = "<Cmd>lua MiniExtra.pickers.visit_paths({ cwd = nil, filter = 'core', sort = MiniVisits.gen_sort.default({ recency_weight = 1 }) }, { source = { name = 'Core visits (cwd)' } })<CR>";
      options = { desc = "Core visits (cwd)"; };
    }

    # ... sisa keymap lainnya sama seperti sebelumnya ...
  ];
}
