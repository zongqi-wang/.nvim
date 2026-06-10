return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
    {
      '<leader>bd',
      function()
        local ok, bufremove = pcall(require, 'mini.bufremove')
        if ok then
          bufremove.delete(0, false)
        else
          vim.cmd 'bdelete'
        end
      end,
      desc = 'Delete Buffer',
    },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
    { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
    { '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', desc = 'Go to buffer 1' },
    { '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', desc = 'Go to buffer 2' },
    { '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', desc = 'Go to buffer 3' },
    { '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', desc = 'Go to buffer 4' },
    { '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', desc = 'Go to buffer 5' },
    { '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', desc = 'Go to buffer 6' },
    { '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', desc = 'Go to buffer 7' },
    { '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', desc = 'Go to buffer 8' },
    { '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', desc = 'Go to buffer 9' },
  },
  opts = {
    options = {
      close_command = function(n)
        local ok, bufremove = pcall(require, 'mini.bufremove')
        if ok then
          bufremove.delete(n, false)
        else
          vim.cmd('bdelete ' .. n)
        end
      end,
      right_mouse_command = function(n)
        local ok, bufremove = pcall(require, 'mini.bufremove')
        if ok then
          bufremove.delete(n, false)
        else
          vim.cmd('bdelete ' .. n)
        end
      end,
      diagnostics = 'nvim_lsp',
      always_show_bufferline = false,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
      callback = function()
        vim.schedule(function()
          pcall(vim.cmd.BufferLineRefresh)
        end)
      end,
    })
  end,
}
