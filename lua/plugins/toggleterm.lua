require("toggleterm").setup({
  size = 20,
  open_mapping = [[<c-\>]], -- Ctrl+\ для быстрого открытия обычного терминала
  hide_numbers = true,
  shade_terminals = true,
  direction = 'horizontal',
  float_opts = {
    border = 'curved',
  },
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- Применяем маппинги только для окон ToggleTerm
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*toggleterm#*",
  callback = function()
    set_terminal_keymaps()
  end,
})


-- Lazygit 
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction="float"
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "tt", "<cmd>lua _lazygit_toggle()<CR>", {
  noremap = true,
  silent = true,
  desc = "Toggle Lazygit"
})
