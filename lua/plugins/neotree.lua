return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  event = 'VimEnter',
  cmd = 'Neotree',
  keys = {
    { '<leader>ee', '<cmd>Neotree toggle filesystem reveal=false<cr>', desc = 'Toggle explorer' },
    { '<leader>ef', '<cmd>Neotree reveal filesystem<cr>', desc = 'Reveal current file' },
    { '<leader>eg', '<cmd>Neotree git_status<cr>', desc = 'Explorer git status' },
    { '<leader>eb', '<cmd>Neotree buffers<cr>', desc = 'Explorer buffers' },
  },
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = {
        enabled = true,
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          '.git',
          'node_modules',
        },
      },
      use_libuv_file_watcher = true,
    },
    window = {
      width = 32,
      mappings = {
        ['<space>'] = 'none',
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)

    vim.schedule(function()
      if #vim.api.nvim_list_uis() == 0 then
        return
      end

      vim.cmd 'Neotree show filesystem reveal=true'
    end)
  end,
}
