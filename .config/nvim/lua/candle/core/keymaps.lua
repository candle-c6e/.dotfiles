vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "<C-c>", "<ESC>", { desc = "Exit insert mode" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- harpoon
keymap.set("n", "<leader>a", function()
	require("harpoon.mark").add_file()
end, { desc = "Add file harpoon" })
keymap.set("n", "<C-e>", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle file harpoon" })
keymap.set("n", "<C-h>", function()
	require("harpoon.ui").nav_file(1)
end, { desc = "File hapoon 1" })
keymap.set("n", "<C-t>", function()
	require("harpoon.ui").nav_file(2)
end, { desc = "File hapoon 2" })
keymap.set("n", "<C-n>", function()
	require("harpoon.ui").nav_file(3)
end, { desc = "File hapoon 3" })
keymap.set("n", "<C-s>", function()
	require("harpoon.ui").nav_file(4)
end, { desc = "File hapoon 4" })

-- toggleterm
keymap.set("n", "<leader>wt", function()
	vim.cmd([[ToggleTerm]])
end, { desc = "Toggle terminal" })

-- debug go
keymap.set("n", "<leader>dgt", function()
	require("dap-go").debug_test()
end)

-- dapui
keymap.set("n", "<leader>dt", function()
	require("dapui").toggle()
end, { noremap = true })
keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
keymap.set("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })

-- tabline
keymap.set("n", "<S-h>", ":tabprevious<CR>", { noremap = true })
keymap.set("n", "<S-l>", ":tabnext<CR>", { noremap = true })

-- buffer
-- keymap.set("n", "<leader>bd", ":bd<CR>", { noremap = true })
-- keymap.set("n", "<leader>bD", ":%bd<CR>", { noremap = true })
