-- bootstrap lazy.nvim --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local g = vim.g
local api = vim.api
require("lazy").setup({
  {
    "unlsycn/vim-verible-format",
    config = function()
      g.verible_format_arguments = '--column_limit=80 --indentation_spaces=4'
      g.verible_path_regex = '.*gentoo'
    end
  },
  {
    "zhaosheng-pan/vim-im-select",
    config = function()
      g.im_select_default = "1033"
    end
  },
  {
    "ggandor/leap.nvim",
    name = "leap",
    lazy = false,
    dependencies = "tpope/vim-repeat",
    config = function()
      require('leap').add_default_mappings(true)
    end
  },
  {
    "ggandor/flit.nvim",
    dependencies = "leap",
    config = function()
      require("flit").setup()
    end
  },
  {
    "machakann/vim-sandwich",
    init = function()
      g.operator_sandwich_no_default_key_mappings = true
    end,
    config = function()
      api.nvim_set_hl(0, "OperatorSandwichBuns", {
        fg = "#aa91a0",
        underline = true,
        ctermfg = 172,
        cterm = { underline = true }
      })
      api.nvim_set_hl(0, "OperatorSandwichChange",
        { fg = "#edc41f", underline = true, ctermfg = yellow, cterm = { underline = true } })
      api.nvim_set_hl(0, "OperatorSandwichAdd", { fg = "#b1fa87", underline = false, ctermfg = green })
      api.nvim_set_hl(0, "OperatorSandwichDelete", { fg = "#cf5963", underline = false, ctermfg = red })
    end,
    keys = {
      { "<leader>a",  "<Plug>(sandwich-add)",          mode = { "n", "x", "o" } },
      { "<leader>d",  "<Plug>(sandwich-delete)",       mode = { "n", "x" } },
      { "<leader>r",  "<Plug>(sandwich-replace)",      mode = { "n", "x" } },
      { "<leader>db", "<Plug>(sandwich-delete-auto)",  mode = "n" },
      { "<leader>rb", "<Plug>(sandwich-replace-auto)", mode = "n" }
    }
  },
  {
    "bkad/CamelCaseMotion",
    config = function()
      g.camelcasemotion_key = "<leader>"
    end
  },
  {
    "kana/vim-textobj-entire",
    dependencies = "kana/vim-textobj-user"
  },
  "michaeljsmith/vim-indent-object",
  {
    "mg979/vim-visual-multi",
    config = function()
      g.VM_leader = "\\"
      g.VM_theme = "neon"
    end
  }
})
