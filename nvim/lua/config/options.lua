-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- LEADER
vim.g.mapleader = ","

-- EDITOR
vim.opt.relativenumber = false -- Relative line numbers

-- GLOBAL
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" } -- sets the complete options on popups

-- LSP
vim.g.autoformat = false
