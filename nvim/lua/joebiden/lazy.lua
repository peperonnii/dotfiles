local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local plugins = {
    -- Essential plugins
    { "kyazdani42/nvim-web-devicons" },
    -- Telescope for fuzzy finding, file browsing, etc.
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
        },
    },
    -- Onedark theme
    { "navarasu/onedark.nvim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- Treesitter for syntax highlighting and more
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    -- Indentation guides
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- Lualine for status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    -- Auto pairs, integrates with both cmp and treesitter
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end,
    },
    -- Bufferline for tab-like display of buffers
    {'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons'},
    -- Nvim-tree for file explorer
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    -- Mason for managing external tooling (LSP servers, formatters, linters)
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    -- Commenting utility
    {
        "numToStr/Comment.nvim",
        lazy = false,
    },
    -- Colorizer for highlighting color codes
    { "norcalli/nvim-colorizer.lua" },
    -- Completion and snippets
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            {
                "L3MON4D3/LuaSnip",
                dependencies = { "rafamadriz/friendly-snippets" },
                config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
            },
        },
    },
    -- Obsidian plugin
    {
        "epwalsh/obsidian.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Trouble plugin
    {
        "folke/trouble.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    -- Noice and its dependencies
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim'
        },
    },
    { 'HiPhish/rainbow-delimiters.nvim' },
    { 'AlphaTechnolog/pywal.nvim' },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configuration goes here
        },
    }
}
local opts = {} -- Define any options for lazy.nvim setup here
require("lazy").setup(plugins, opts)

local function source()
  vim.cmd('source ~/.config/nvim/after/plugin/pywal.lua')
  vim.cmd('source ~/.config/nvim/after/plugin/lualine.lua')
  vim.defer_fn(source, 2000)
end
source()
