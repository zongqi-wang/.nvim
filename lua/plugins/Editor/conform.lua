return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = { 'n', 'v' },
      desc = 'Format buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local format_on_save_filetypes = {
        go = true,
        lua = true,
        rust = true,
      }

      if not format_on_save_filetypes[vim.bo[bufnr].filetype] then
        return nil
      end

      return {
        timeout_ms = 1000,
        lsp_format = 'fallback',
      }
    end,
    formatters_by_ft = {
      css = { 'prettier', stop_after_first = true },
      go = { 'goimports', 'gofumpt' },
      html = { 'prettier', stop_after_first = true },
      javascript = { 'prettier', stop_after_first = true },
      javascriptreact = { 'prettier', stop_after_first = true },
      json = { 'prettier', stop_after_first = true },
      jsonc = { 'prettier', stop_after_first = true },
      lua = { 'stylua' },
      markdown = { 'prettier', stop_after_first = true },
      rust = { 'rustfmt' },
      typescript = { 'prettier', stop_after_first = true },
      typescriptreact = { 'prettier', stop_after_first = true },
      yaml = { 'prettier', stop_after_first = true },
      zig = { 'zigfmt' },
    },
  },
}
