
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'           "代码补全: <.>
Plugin 'ervandew/supertab'              "补全jedi && supertab
Plugin 'kien/ctrlp.vim'                 "模糊搜索:<Ctrl -p>
Plugin 'Yggdroot/indentLine'            "代码缩进、颜色,自动配置 :IndentLinesToggle
Plugin 'hhatto/autopep8'                "代码格式化 autopep8 && vim-autopep8
Plugin 'tell-k/vim-autopep8'            "代码格式化: F8
Plugin 'jiangmiao/auto-pairs'           "自动补全括号等
Plugin 'kien/rainbow_parentheses.vim'   "多彩括号显示
Plugin 'preservim/nerdcommenter'        "高效代码注释插件 : map <F4> <leader>ci <CR>
Plugin 'tpope/vim-fugitive'             "git操作插件
Plugin 'nvie/vim-flake8'                "代码检查: F7
Plugin 'SirVer/ultisnips'               "for snipeets
Plugin 'honza/vim-snippets'

call vundle#end()                       

filetype plugin indent on    " required
set backspace=indent,eol,start
set autowrite
set ts=4
set expandtab

set nu
set encoding=utf-8
syntax on
set fencs=utf-8,gbk

"括号补全与缩进set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set smartindent
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O

filetype plugin on

" 代码补全 jedi && supertab,使用tab补全
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" F4 键快速注释和反注释当前行
map <F4> <leader>ci <CR>

" 按 F5 执行当前 Python 代码"
map <F5> :call PRUN()<CR>
func! PRUN()
    exec"w"
    if &filetype == 'python'
        exec"!python %"
    endif
endfunc

" F7 python代码语法检查


