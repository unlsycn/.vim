local g = vim.g
local opt = vim.opt
local keymap = vim.keymap

--- style ---
opt.guicursor = { "i:hor20", "n-v:block" }

--- key bindings ---
-- windows
keymap.set({"n", "x"}, "<C-w>t", function() require("vscode-neovim").call('workbench.action.terminal.focus') end)
keymap.set({"n", "x"}, "<C-w>e", function() require("vscode-neovim").call('workbench.action.focusSideBar') end)
keymap.set({"n", "x"}, "<C-w>p", function() require("vscode-neovim").call('workbench.action.focusPanel') end)
--actions
keymap.set({"n", "x"}, "gr", function() require("vscode-neovim").call('editor.action.goToReferences') end)
