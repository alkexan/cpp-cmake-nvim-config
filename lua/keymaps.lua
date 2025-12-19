local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local builtin = require('telescope.builtin')

map('i', 'jk', '<esc>', default_opts)

-- Системный буфер обмена ctrl+c
map('v', '<C-c>', '"+y', default_opts)
map('n', '<C-v>', '"+p', default_opts)
map('i', '<C-v>', '<esc>"+p', default_opts)

-- Автоформат CTRL-f , как в нормальном, так и в insert режиме
map('n', '<C-S-i>', ':Autoformat<CR>',  default_opts)
map('i', '<C-S-i>', '<esc>:Autoformat<CR>', default_opts)

-- Сохранение по CTRL-s , как в нормальном, так и в insert режиме
map('v', '<C-s>', ':w<CR>',  default_opts)
map('n', '<C-s>', ':w<CR>',  default_opts)
map('i', '<C-s>', '<esc>:w<CR>', default_opts)

-- Переключение вкладок с помощью shift-tab (akinsho/bufferline.nvim)
map('n','<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n','<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)

-- ctrl+b дерево файлов.
-- Если Дерево открыто, то переместить фокус на него
-- Иначе Открыть
map('n', '<C-b>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)
map('i', '<C-b>', '<esc>:NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)
map('n', '<C-e>', ':NvimTreeOpen<CR>:NvimTreeFocus<CR>', default_opts)
map('i', '<C-e>', '<esc>:NvimTreeOpen<CR>:NvimTreeFocus<CR>', default_opts)

-- Выйти
map('n', '<C-q>', ':q<CR>',  default_opts)
map('i', '<C-q>', '<esc>:q<CR>', default_opts)
map('v', '<C-q>', '<esc>:q<CR>', default_opts)

-- клавиши для telescope
-- Поиск слова под курсором
map('n', '<leader>fw', ':Telescope grep_string<CR>',  default_opts)
map('v', '<leader>fw', ':Telescope grep_string<CR>',  default_opts)

-- Поиск слова в модальном окошке
map('n', '<leader>fg', ':Telescope live_grep<CR>',  default_opts)
map('v', '<leader>fg', ':Telescope live_grep<CR>',  default_opts)

-- Поиск файлов
map('n', '<leader>ff', ':Telescope find_files<CR>',  default_opts)
map('v', '<leader>ff', ':Telescope find_files<CR>',  default_opts)

-- Поиск в буфере
map('n', '<leader>fb', ':Telescope buffers<CR>',  default_opts)
map('v', '<leader>fb', ':Telescope buffers<CR>',  default_opts)

-- Работа с Git
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gg', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

-- Выбор цветовой схемы
vim.keymap.set('n', '<leader>cs', builtin.colorscheme, {})

-- Keymaps for DAP (Debugger)
map('n', '<leader>db', ':DapToggleBreakpoint<CR>', default_opts)
map('n', '<leader>dc', ':DapContinue<CR>', default_opts)
map('n', '<leader>dn', ':DapStepOver<CR>', default_opts)
map('n', '<leader>di', ':DapStepInto<CR>', default_opts)

-----------------------------------------------------------
-- Фн. клавиши по F1 .. F12
-----------------------------------------------------------
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
map('n', '<F9>', ':TagbarToggle<CR>', default_opts)

-- <F12> переключить комментарий в строке
-- map('n', '<F12>', '<gc>', {})
-- map('i', '<F12>', '<esc><gc>', {})

-- переключить блок комментария для визуального режима
-- map('v', '<F12>', '<gb>', default_opts)

