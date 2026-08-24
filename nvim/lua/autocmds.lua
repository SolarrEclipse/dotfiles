require "nvchad.autocmds"

vim.api.nvim_set_hl(0, "YankHighlight", { fg = "#020420", bg = "#00DC82" })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    callback = function()
        vim.highlight.on_yank { higroup = "YankHighlight", timeout = 150 }
    end,
})
