{
  plugins.mini-files = {
    enable = true;
    settings = {
      windows = {
        preview = true;
        width_preview = 70;
      };
    };
  };
  # autoCmd = [
  #   {
  #     event = [ "User" ];
  #     pattern = [ "MiniFilesBufferCreate" ];
  #     group = "mini-files-setup";
  #     callback = {
  #       __raw = ''
  #         function(args)
  #           local b = args.data.buf_id
  #
  #           -- Fungsi lokal Anda
  #           local set_cwd = function()
  #             local path = (MiniFiles.get_fs_entry() or {}).path
  #             if path == nil then return vim.notify('Cursor is not on valid entry') end
  #             vim.fn.chdir(vim.fs.dirname(path))
  #             vim.notify('CWD changed to: ' .. vim.fn.getcwd())
  #           end
  #
  #           local yank_path = function()
  #             local path = (MiniFiles.get_fs_entry() or {}).path
  #             if path == nil then return vim.notify('Cursor is not on valid entry') end
  #             vim.fn.setreg(vim.v.register, path)
  #             vim.notify('Path yanked: ' .. path)
  #           end
  #
  #           local ui_open = function() 
  #             local entry = MiniFiles.get_fs_entry()
  #             if entry then vim.ui.open(entry.path) end
  #           end
  #
  #           -- Injeksi keymap ke buffer mini.files
  #           vim.keymap.set('n', 'g~', set_cwd,   { buffer = b, desc = 'Set cwd' })
  #           vim.keymap.set('n', 'gX', ui_open,   { buffer = b, desc = 'OS open' })
  #           vim.keymap.set('n', 'gy', yank_path, { buffer = b, desc = 'Yank path' })
  #         end
  #       '';
  #     };
  #   }
  # ];
}
