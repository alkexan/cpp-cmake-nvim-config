-- Общие
vim.opt.colorcolumn = '90'              -- Разделитель на 90 символов
vim.opt.cursorline = true               -- Подсветка строки с курсором
vim.opt.number = true                   -- Включаем нумерацию строк
vim.opt.scrolloff=7                     -- Отступ в 7 строк вокруг курсора при прокрутке

-- Файл
vim.opt.undofile = true                 -- Возможность отката назад
vim.opt.encoding="utf-8"                -- Включение кодировки
vim.opt.fileformat = "unix"
vim.opt.swapfile = false                -- Отключить swap файлы nvim

-- Форматирование
vim.opt.tabstop=4                       -- Размер табуляции
vim.opt.softtabstop=4                   -- Количество пробелов для удаления
vim.opt.shiftwidth=4                    -- Размер таба в начале строки
vim.opt.expandtab=true                  -- Использовать пробелы вместо табуляции
vim.opt.autoindent=true                 -- Копирует отступы с текущей строки при добавлении новой
vim.opt.smartindent = true              -- Копировать отступ на новой строке
vim.opt.cindent = true                  -- Автоотступы
vim.opt.smarttab=true                   -- Включает shifwidth

-- Прочее
vim.opt.hlsearch = true                 -- Подсвечивать результаты поиска
vim.opt.syntax="on"                     -- Подсветка синтаксиса
vim.opt.mouse="a"                       -- Включение поддержки мыши

--[[
-- Устанавливаем клавишу-лидер (leader key) на пробел
vim.g.mapleader = ''
vim.g.maplocalleader = ''
--]]

-- плагин Tagbar
vim.g.tagbar_compact = 1
vim.g.tagbar_sort = 0

vim.cmd('highlight ColorColumn ctermbg=darkgray')     -- Цвет на 90 символе

vim.cmd([[
  filetype indent plugin on
  syntax enable
]])

