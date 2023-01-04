-- This file is automatically loaded by plugins.config

local util = require("lazyvim.util")

-- Move to window using the <meta> movement keys
vim.keymap.set("n", "<A-left>", "<C-w>h")
vim.keymap.set("n", "<A-down>", "<C-w>j")
vim.keymap.set("n", "<A-up>", "<C-w>k")
vim.keymap.set("n", "<A-right>", "<C-w>l")

-- Resize window using <shift> arrow keys
vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- Move Lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Switch buffers with <ctrl>
vim.keymap.set("n", "<C-Left>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>bnext<cr>")

-- Easier pasting
vim.keymap.set("n", "[p", ":pu!<cr>")
vim.keymap.set("n", "]p", ":pu<cr>")

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
vim.keymap.set("n", "gw", "*N")
vim.keymap.set("x", "gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- save in insert mode
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Open Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Open Quickfix List" })

-- toggle options
vim.keymap.set("n", "<leader>tf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Format on Save" })
vim.keymap.set("n", "<leader>ts", function()
  util.toggle("spell")
end, { desc = "Spelling" })
vim.keymap.set("n", "<leader>tw", function()
  util.toggle("wrap")
end, { desc = "Word Wrap" })
vim.keymap.set("n", "<leader>tn", function()
  util.toggle("relativenumber", true)
  util.toggle("number")
end, { desc = "Line Numbers" })

-- lazygit
vim.keymap.set("n", "<leader>gg", function()
  require("lazyvim.util").float_term({ "lazygit" })
end, { desc = "Lazygit (cwd)" })
vim.keymap.set("n", "<leader>gG", function()
  util.float_term({ "lazygit" }, { cwd = util.get_root() })
end, { desc = "Lazygit (root dir)" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  vim.keymap.set("n", "<leader>hl", vim.show_pos, { desc = "Highlight Groups at cursor" })
end
