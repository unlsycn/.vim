vim.opt.clipboard = "unnamedplus"
local copy = "wl-copy"
local paste = "wl-paste"
if vim.fn.executable(copy) == 1 and vim.fn.executable(paste) == 1 then
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
end
