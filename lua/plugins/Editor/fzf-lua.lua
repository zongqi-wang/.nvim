return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = 'FzfLua',
  keys = {
    {
      '<leader><leader>',
      function()
        require('fzf-lua').files()
      end,
      desc = 'Find files',
    },
    {
      '<leader>ff',
      function()
        require('fzf-lua').files()
      end,
      desc = 'Find files',
    },
    {
      '<leader>fg',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = 'Live grep',
    },
    {
      '<leader>sg',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = 'Search workspace',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').buffers()
      end,
      desc = 'Find buffers',
    },
    {
      '<leader>fh',
      function()
        require('fzf-lua').help_tags()
      end,
      desc = 'Help tags',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').resume()
      end,
      desc = 'Resume search',
    },
    {
      '<leader>fw',
      function()
        require('fzf-lua').grep_cword()
      end,
      desc = 'Grep word',
    },
    {
      '<leader>fc',
      function()
        require('fzf-lua').commands()
      end,
      desc = 'Commands',
    },
    {
      '<leader>fk',
      function()
        require('fzf-lua').keymaps()
      end,
      desc = 'Keymaps',
    },
  },
  opts = {
    files = {
      cmd = "rg --files --hidden --glob '!.git/*'",
    },
    grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git/*'",
    },
    winopts = {
      height = 0.85,
      width = 0.85,
      preview = {
        layout = 'vertical',
        vertical = 'down:45%',
      },
    },
  },
}
