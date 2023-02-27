"=============================================================================
" init.vim --- Entry file for neovim
" Copyright (c) 2016-2022 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

"== VSCode Neovim ==
if exists('g:vscode')
"==== plugins ====
    call plug#begin()
    Plug 'unlsycn/vim-verible-format'
    Plug 'asvetliakov/vim-easymotion'
    Plug 'zhaosheng-pan/vim-im-select'
    Plug 'machakann/vim-sandwich'
    Plug 'bkad/CamelCaseMotion'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-entire'
    Plug 'michaeljsmith/vim-indent-object'
    call plug#end()

"==== style ====
    set guicursor=i:hor20

"==== key bindings ====
    let mapleader=';'
    "windows
    nnoremap <C-w>t <Cmd>call VSCodeNotify('workbench.action.terminal.focus')<CR>
    xnoremap <C-w>t <Cmd>call VSCodeNotify('workbench.action.terminal.focus')<CR>
    nnoremap <C-w>e <Cmd>call VSCodeNotify('workbench.action.focusSideBar')<CR>
    xnoremap <C-w>e <Cmd>call VSCodeNotify('workbench.action.focusSideBar')<CR>
    nnoremap <C-w>p <Cmd>call VSCodeNotify('workbench.action.focusPanel')<CR>
    xnoremap <C-w>p <Cmd>call VSCodeNotify('workbench.action.focusPanel')<CR>
    "actions
    nnoremap gr <Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>
    xnoremap gr <Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>

"==== input method switch ====
    let g:im_select_command='/mnt/c/Users/Humph/.bin/im-select.exe'
    let g:im_select_default='1033'

"==== camel case motion ====
    let g:camelcasemotion_key = '<leader>'
"==== yank to clipboard ====
    set clipboard=unnamedplus
    if has('clipboard') || exists('g:vscode')
        let s:clip = '/mnt/c/Windows/System32/clip.exe'
        if executable(s:clip)
            augroup WSLYank
                autocmd!
                autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
            augroup END
        endif
    endif

"==== vim-sandwich ====
    highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline
    highlight OperatorSandwichChange guifg='#edc41f' gui=underline ctermfg='yellow' cterm=underline
    highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none
    highlight OperatorSandwichDelete guibg='#cf5963' gui=none ctermbg='red' cterm=None

"==== vim-verible-format ====
    let g:verible_format_arguments = '--column_limit=80 --indentation_spaces=4'
    let g:verible_path_regex = '.*kali-linux'
    vnoremap <Leader>f <Esc>:FormatSelection<CR>
"== Space vim ==
else
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'
endif

