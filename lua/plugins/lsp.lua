-- Настройка подсветки
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "cmake", "make", "devicetree","lua", "python", "bash", "json", "json5"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}

--[[
lspconfig.clangd.setup ({
  cmd = {"clangd", "--background-index"},
  settings = {
      clangd = {
          arguments = {
              "--compile-commands-dir=build", -- Указать директорию, если она стандартная
          },
      },
  },
})
--]]
vim.lsp.config('clangd', { cmd = {"clangd", "--background-index"}, })
vim.lsp.enable('clangd')

vim.lsp.enable('cmake')

vim.lsp.enable('pyright')

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
-- vim.keymap.set('n', '<space>e', vim.diagnostic.show_line_diagnostics)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Mappings.
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', '<F6>', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<F7>', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<F8>', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)

    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.name == 'clangd' then
        vim.keymap.set('n', '<F4>', '<cmd>LspClangdSwitchSourceHeader<CR>', opts)
      -- You could use F9 if you prefer a function key:
      -- vim.keymap.set('n', '<F9>', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
    end
  end
})
