require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree open" })
map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "NvimTree find file" })

map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split Window (Horizontal Split)" })
map("n", "<leader>sv", "<cmd>splitv<CR>", { desc = "Split Window (Vertical Split)" })

map("n", "<leader>sfh", function() end, { desc = "Split Window with File Search (Horizontal Split)" })

map("n", "<leader>sfh", function()
    local builtin = require "telescope.builtin"
    local actions = require "telescope.actions"

    builtin.find_files {
        attach_mappings = function()
            actions.select_default:replace(actions.select_horizontal)
            return true
        end,
    }
end, { desc = "Split Window with File Search (Horizontal Split)" })

map("n", "<leader>sfv", function()
    local builtin = require "telescope.builtin"
    local actions = require "telescope.actions"

    builtin.find_files {
        attach_mappings = function()
            actions.select_default:replace(actions.select_vertical)
            return true
        end,
    }
end, { desc = "Split Window with File Search (Horizontal Split)" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
