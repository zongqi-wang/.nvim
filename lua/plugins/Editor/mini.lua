return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - ysiw) - add parens around inner word
    -- - ds'   - delete surrounding quotes
    -- - cs)'  - replace parens with quotes
    require('mini.surround').setup {
      mappings = {
        add = 'ys',
        delete = 'ds',
        find = 'gsf',
        find_left = 'gsF',
        highlight = 'gsh',
        replace = 'cs',
        suffix_last = '',
        suffix_next = '',
      },
    }

    -- Delete buffers without closing the current window layout.
    require('mini.bufremove').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
