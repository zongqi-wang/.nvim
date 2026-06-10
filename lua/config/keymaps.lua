-- [[ Basic Keymaps ]]

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable Ex mode' })

for _, mode in ipairs { 'n', 'x', 'o' } do
  pcall(vim.keymap.del, mode, 'gc')
end
pcall(vim.keymap.del, 'n', 'gcc')

vim.keymap.set('n', '<leader>/', function()
  return require('vim._comment').operator() .. '_'
end, { expr = true, desc = 'Toggle comment line' })
vim.keymap.set('x', '<leader>/', function()
  return require('vim._comment').operator()
end, { expr = true, desc = 'Toggle comment selection' })
vim.keymap.set('n', 'g/', function()
  return require('vim._comment').operator()
end, { expr = true, desc = 'Toggle comment' })
vim.keymap.set('o', 'g/', function()
  require('vim._comment').textobject()
end, { desc = 'Comment textobject' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus left' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus down' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus up' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus right' })

vim.keymap.set('n', '<C-f>', '<C-f>zz', { desc = 'Page down centered' })
vim.keymap.set('n', '<C-b>', '<C-b>zz', { desc = 'Page up centered' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up centered' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result centered' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result centered' })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setqflist, { desc = 'Diagnostics quickfix' })

vim.keymap.set('n', '<leader>qq', '<cmd>copen<CR>', { desc = 'Open quickfix' })
vim.keymap.set('n', ']q', '<cmd>cnext<CR>zz', { desc = 'Next quickfix item' })
vim.keymap.set('n', '[q', '<cmd>cprev<CR>zz', { desc = 'Previous quickfix item' })
vim.keymap.set('n', ']l', '<cmd>lnext<CR>zz', { desc = 'Next location item' })
vim.keymap.set('n', '[l', '<cmd>lprev<CR>zz', { desc = 'Previous location item' })

vim.keymap.set('n', '<leader><Tab>n', '<cmd>tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader><Tab>d', '<cmd>tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader><Tab>]', '<cmd>tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader><Tab>[', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader><Tab>o', '<cmd>tabonly<CR>', { desc = 'Close other tabs' })
