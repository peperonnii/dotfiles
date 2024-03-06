local lsp = require("lspconfig")
local cmp = require("cmp")
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls"}
})

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Enter>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback() -- You can define a fallback function if needed
            end
        end, { 'i', 's' }),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = function(entry, vim_item)
            -- Load the `nvim-web-devicons` module
            local devicons = require'nvim-web-devicons'
            local kind_icons = {
                Text = '',
                Method = 'ƒ',
                Function = '',
                Constructor = '',
                Field = '',
                Variable = '',
                Class = 'פּ',
                Interface = '',
                Module = '',
                Property = 'ﰠ',
                Unit = '',
                Value = '',
                Enum = '',
                Keyword = '',
                Snippet = '',
                Color = '',
                File = '',
                Reference = '',
                Folder = '',
                EnumMember = '',
                Constant = '',
                Struct = '',
                Event = '',
                Operator = '',
                TypeParameter = ''
            }
            -- Insert the icon at the beginning of the completion item
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
        end
    },
})
-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

local on_attach = function(_, _)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require("telescope.builtin").lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        },
    },
}
lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lsp.html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lsp.tsserver.setup {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        -- Use the same on_attach function for consistency
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
}
lsp.astro.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lsp.astro.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
