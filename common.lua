local copy = "wl-copy"
local paste = "wl-paste"
if vim.fn.executable(copy) == 1 and vim.fn.executable(paste) == 1 then
	vim.opt.clipboard = "unnamedplus"
	vim.g.clipboard = {
		name = clip,
		copy = {
			["+"] = copy,
			["*"] = copy,
		},
		paste = {
			["+"] = paste .. " -n",
			["*"] = paste .. " -n",
		},
		cache_enabled = true,
	}
else
	if os.getenv("SSH_TTY") ~= nil then
		function my_paste(reg)
			return function(lines)
				local content = vim.fn.getreg('"')
				return vim.split(content, "\n")
			end
		end
		vim.opt.clipboard:append("unnamedplus")
		vim.g.clipboard = {
			name = "OSC 52",
			copy = {
				["+"] = require("vim.ui.clipboard.osc52").copy("+"),
				["*"] = require("vim.ui.clipboard.osc52").copy("*"),
			},
			paste = {
				["+"] = my_paste(),
				["*"] = my_paste(),
			},
		}
	end
end
