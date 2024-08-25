local g = vim.g
local opt = vim.opt
local map = vim.keymap.set

--- config ---
opt.ignorecase = true
opt.smartcase = true

--- style ---
opt.guicursor = { "i:hor20", "n-v:block" }

--- key bindings ---
map("n", ";", ":", { desc = "CMD enter command mode" })
-- windows
map({"n", "x"}, "<C-w>t", function() require("vscode-neovim").call('workbench.action.terminal.focus') end)
map({"n", "x"}, "<C-w>e", function() require("vscode-neovim").call('workbench.action.focusSideBar') end)
map({"n", "x"}, "<C-w>p", function() require("vscode-neovim").call('workbench.action.focusPanel') end)
--actions
map({"n", "x"}, "gr", function() require("vscode-neovim").call('editor.action.goToReferences') end)
