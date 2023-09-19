vim.opt.clipboard = "unnamedplus"
local clip = "win32yank.exe"
if vim.fn.executable(clip) then
  vim.g.clipboard = {
      name = clip,
      copy = {
          ["+"] = clip .. " -i --crlf",
          ["*"] = clip .. " -i --crlf",
      },
      paste = {
          ["+"] = clip .. " -o --lf",
          ["*"] = clip .. " -o --lf",
      },
      cache_enabled = true,
  }
end
