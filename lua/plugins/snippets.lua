require('luasnip.loaders.from_vscode').lazy_load()

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local ok_autopairs, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if ok_autopairs then
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),

        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),

        -- Улучшенный Tab для 2025 года: 
        -- 1. Выбирает в списке. 2. Прыгает по полям сниппета.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip',  priority = 750 },
        { name = 'nvim_lsp_signature_help', priority = 600 }, -- важно для C++/Python
        { name = 'path',     priority = 500 },
        { 
            name = 'buffer', 
            priority = 250,
            option = {
                get_bufnrs = function() return vim.api.nvim_list_bufs() end
            }
        },
    })
})

