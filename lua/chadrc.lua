-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = { load_on_startup = true }

M.mason = {
	pkgs = {
		"bash-language-server",
		"clangd",
		"css-lsp",
		"css-variables-language-server",
		"fish-lsp",
		"gopls",
		"html-lsp",
		"jdtls",
		"json-lsp",
		"lua-language-server",
		"rust-analyzer",
		"svelte-language-server",
		"typescript-language-server",
		"vue-language-server",
		"yaml-language-server",
		"clang-format",
		"prettier",
		"stylua",
	},
}

-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
