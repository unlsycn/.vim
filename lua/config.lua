local g = vim.g
local opt = vim.opt
local keymap = vim.keymap

--- key bindings ---
g.mapleader = ";"
g.VM_leader = "'"
-- windows
keymap.set({"n", "x"}, "<C-w>t", function() require("vscode-neovim").notify('workbench.action.terminal.focus') end)
keymap.set({"n", "x"}, "<C-w>e", function() require("vscode-neovim").notify('workbench.action.focusSideBar') end)
keymap.set({"n", "x"}, "<C-w>p", function() require("vscode-neovim").notify('workbench.action.focusPanel') end)
--actions
keymap.set({"n", "x"}, "gr", function() require("vscode-neovim").notify('editor.action.referenceSearch.trigger') end)
