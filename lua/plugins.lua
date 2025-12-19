local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Цветовые схемы
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{ 'norcalli/nvim-colorizer.lua' },


  -- иконки
  -- use 'ryanoasis/vim-devicons'

  -- подсветка табуляции
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },

  -- Информационная строка внизу
	{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Табы вверху
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  -- иконки в выпадающем списке автодополнений (прямо как в vscode)
  { 'onsails/lspkind-nvim' },

  -- 'folke/which-key.nvim',            -- Всплывающие подсказки по клавишам

  -- LSP
	{ 'williamboman/mason.nvim' },
	
  { 'neovim/nvim-lspconfig', },
	
  { 'nvim-treesitter/nvim-treesitter' }, -- Улучшенная подсветка синтаксиса

  -- Autocomplete
  { 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'saadparwaiz1/cmp_luasnip' },       -- автодополнения для сниппетов
  { 'L3MON4D3/LuaSnip' },                 -- движок сниппетов
  
  -- набор готовых сниппетов для всех языков
  { "rafamadriz/friendly-snippets" },

  -- Comments
	{
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },

  -- Интеграция с CMake
  {
    'Civitasv/cmake-tools.nvim',
    config = function() require("plugins.lsp") end
  },

  { 'nvim-neotest/nvim-nio' },          -- зависимость для dap

  -- Клиент отладчика (DAP)
  {
    'mfussenegger/nvim-dap',
    config = function() require("plugins.dap") end
  },

  -- Интерфейс для отладчика
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
        require("dapui").setup()
        -- Привязка событий dap к dapui
        --[[
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("DapUIAutoOpen", { clear = true }),
            pattern = {"*"},
            callback = function()
                require("dapui").open({ reset = true })
            end,
        })
        vim.api.nvim_create_autocmd("BufLeave", {
            group = vim.api.nvim_create_augroup("DapUIAutoClose", { clear = true }),
            pattern = {"*"},
            callback = function()
                require("dapui").close()
            end,
        })
        --]]
    end
  },
  
  -- Даже если включена русская раскладка vim команды будут работать
  { "powerman/vim-plugin-ruscmd" },

  -- Закрывает автоматом скобки
  { 'cohama/lexima.vim' },

	{ 'RRethy/vim-illuminate' },

  -- Файловый менеджер
	{
	  "nvim-tree/nvim-tree.lua",
	  version = "*",
	  lazy = false,
	  dependencies = {
	    "nvim-tree/nvim-web-devicons",
	  },
	  config = function()
	    require("nvim-tree").setup {}
	  end,
	},
  
  -- Навигация внутри файла по классам и функциям
  { 'majutsushi/tagbar' },

  -- Поиск
  {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

  -- Обрамляет или снимает обрамление. Выдели слово, нажми S и набери <h1>
  { 'tpope/vim-surround' },
  
  -- 'Автоформатирование' кода для всех языков
  -- use 'vim-autoformat/vim-autoformat'

  -- Линтер, работает для всех языков
  {
    'dense-analysis/ale',
    config = function()
        -- Configuration goes here.
        local g = vim.g

        g.ale_linters = {
          python = {'pyright'},
          lua = {'lua_language_server'},
          c = {'clangd'},
          cpp = {'clangd'}
        }
    end
  },

  -- Терминал
	{'akinsho/toggleterm.nvim', version = "*", config = true},
})
