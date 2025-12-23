local builtin = require('telescope.builtin')

vim.keymap.set('i', 'jk', '<esc>')

-- Системный буфер обмена ctrl+c
vim.keymap.set('v', '<C-c>', '"+y')
vim.keymap.set('n', '<C-v>', '"+p')
vim.keymap.set('i', '<C-v>', '<esc>"+p')

-- Автоформат CTRL-f , как в нормальном, так и в insert режиме
vim.keymap.set('n', '<C-S-i>', ':Autoformat<CR>')
vim.keymap.set('i', '<C-S-i>', '<esc>:Autoformat<CR>')

-- Сохранение по CTRL-s , как в нормальном, так и в insert режиме
vim.keymap.set('v', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<esc>:w<CR>')

-- Переключение вкладок с помощью shift-tab (akinsho/bufferline.nvim)
vim.keymap.set('n', 'L', ':BufferLineCycleNext<CR>', { desc = 'След. вкладка' })
vim.keymap.set('n', 'H', ':BufferLineCyclePrev<CR>', { desc = 'Пред. вкладка' })

-- Табуляция
vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Табуляция вправо' })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Табуляция влево' })
vim.keymap.set('n', '<Tab>', '>>', { desc = 'Табуляция строки вправо' })
vim.keymap.set('n', '<S-Tab>', '<<', { desc = 'Табуляция строки влево' })

-- ctrl+b дерево файлов.
-- Если Дерево открыто, то переместить фокус на него
-- Иначе Открыть
vim.keymap.set('n', '<C-b>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>')
vim.keymap.set('i', '<C-b>', '<esc>:NvimTreeRefresh<CR>:NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-e>', ':NvimTreeOpen<CR>:NvimTreeFocus<CR>')
vim.keymap.set('i', '<C-e>', '<esc>:NvimTreeOpen<CR>:NvimTreeFocus<CR>')

-- Выйти
vim.keymap.set('n', '<C-q>', ':q<CR>')
vim.keymap.set('i', '<C-q>', '<esc>:q<CR>')
vim.keymap.set('v', '<C-q>', '<esc>:q<CR>')

-- клавиши для telescope
vim.keymap.set('n', '<leader>fw', builtin.grep_string, {desc = 'Поиск слова под курсором'})
vim.keymap.set('v', '<leader>fw', builtin.grep_string, {desc = 'Поиск слова под курсором'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = 'Поиск слова в модальном окошке'})
vim.keymap.set('v', '<leader>fg', builtin.live_grep, {desc = 'Поиск слова в модальном окошке'})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Поиск файлов'})
vim.keymap.set('v', '<leader>ff', builtin.find_files, {desc = 'Поиск файлов'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Поиск в буфере'})
vim.keymap.set('v', '<leader>fb', builtin.buffers, {desc = 'Поиск в буфере'})

-- Работа с Git
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {desc = 'Git branches'})
vim.keymap.set('n', '<leader>gg', builtin.git_commits, {desc = 'Git commits'})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {desc = 'Git status'})

-- Выбор цветовой схемы
vim.keymap.set('n', '<leader>cs', builtin.colorscheme, {desc = 'Color scheme'})

-----------------------------------------------------------
-- Фн. клавиши по F1 .. F12
-----------------------------------------------------------
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
vim.keymap.set('n', '<F9>', ':TagbarToggle<CR>')

-- <F12> переключить комментарий в строке
-- vim.keymap.set('n', '<F12>', '<gc>', {})
-- vim.keymap.set('i', '<F12>', '<esc><gc>', {})

-- переключить блок комментария для визуального режима
-- vim.keymap.set('v', '<F12>', '<gb>')

