require('luasnip.loaders.from_vscode').load({
    paths = {'~/.local/share/nvim/site/pack/packer/start/friendly-snippets'}
})

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),

        -- ['<C-e>'] = cmp.mapping.close(),
        ['<C-e>'] = cmp.mapping.abort(),

        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },

        -- ['<Down>'] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {"i", "s"}),

        -- ['<Up>'] = cmp.mapping.select_prev_item(),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {"i", "s"})
    }),

    sources = cmp.config.sources({{
        name = 'nvim_lsp'
    }, {
        name = 'luasnip'
    }, {
        name = 'path'
    }, {
        name = 'buffer',
        options = {
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
        }
    }, {
        name = 'nvim_lsp_signature_help'
    }})
})

