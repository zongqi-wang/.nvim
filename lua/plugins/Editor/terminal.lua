return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    {
      '<leader>tt',
      '<cmd>1ToggleTerm direction=horizontal size=15<cr>',
      mode = { 'n', 't' },
      desc = 'Toggle bottom terminal',
    },
    {
      '<leader>tf',
      '<cmd>2ToggleTerm direction=float<cr>',
      mode = { 'n', 't' },
      desc = 'Toggle floating terminal',
    },
  },
  opts = {
    close_on_exit = true,
    direction = 'horizontal',
    hide_numbers = true,
    insert_mappings = true,
    persist_size = true,
    shade_terminals = true,
    start_in_insert = true,
    terminal_mappings = true,
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      end

      return math.floor(vim.o.columns * 0.4)
    end,
    float_opts = {
      border = 'rounded',
      height = function()
        return math.floor(vim.o.lines * 0.8)
      end,
      width = function()
        return math.floor(vim.o.columns * 0.85)
      end,
    },
  },
}
