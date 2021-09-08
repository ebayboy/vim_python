
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'davidhalter/jedi-vim'           "代码补全: <.>
Plugin 'ervandew/supertab'              "补全jedi && supertab
Plugin 'kien/ctrlp.vim'                 "模糊搜索:<Ctrl -p>
Plugin 'Yggdroot/indentLine'            "代码缩进、颜色,自动配置 :IndentLinesToggle
Plugin 'hhatto/autopep8'                "代码格式化 autopep8 && vim-autopep8
Plugin 'tell-k/vim-autopep8'            "代码格式化: F2
Plugin 'jiangmiao/auto-pairs'           "自动补全括号等
Plugin 'kien/rainbow_parentheses.vim'   "多彩括号显示
Plugin 'tpope/vim-fugitive'             "git操作插件
Plugin 'nvie/vim-flake8'                "代码检查: F7
Plugin 'SirVer/ultisnips'               "for snipeets
Plugin 'honza/vim-snippets'
Plugin 'VundleVim/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'dgryski/vim-godef'
Plugin 'alvan/vim-closetag'


call vundle#end()                       

" indentLine set 
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239
" 关闭引号隐藏等功能
map <C-i> :IndentLinesToggle<CR> 
let g:indentLine_enabled = 1

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

" ============================= VIM PYTHON ==================================
autocmd FileType python noremap <buffer> <F2> :call Autopep8()<CR>

" F4 键快速注释和反注释当前行
" map <F4> <leader>ci <CR>
map <F4> :call PBUILD()<CR>
func! PBUILD()
    if &filetype == 'go'
        exec"!go build %"
    endif
endfunc


" 按 F5 执行当前 Python 代码"
map <F5> :call PRUN()<CR>
func! PRUN()
    exec"w"
    if &filetype == 'python'
        exec"!python %"
    endif
    if &filetype == 'go'
        exec"!go run %"
    endif
endfunc

"gocode 语法检查
imap <F6> <C-x><C-o>

" F7 python代码语法检查

" ============================= VIM GO ==================================
"for gotags
let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
			\ ],
			\ 'sro' : '.',
			\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
			\ },
			\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
			\ },
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }

" 设置tagbar的窗口宽度
let g:tagbar_width=30
" 映射Tagbar的快捷键,按F9自动打开
map <F9> :TagbarToggle<CR>
map <F12> :!gotags -R $GOPATH/src/github.com > tags <CR>

let g:godef_split=3 """左右打开新窗口的时候
let g:godef_same_file_in_same_window=1 """函数在同一个文件中时不需要打开新窗口

autocmd FileType go nnoremap <buffer> gd :call GodefUnderCursor()<cr>
autocmd FileType go nnoremap <buffer> <C-]> :call GodefUnderCursor()<cr>
let g:godef_split=3 """左右打开新窗口的时候
let g:godef_same_file_in_same_window=1 """函数在同一个文件中时不需要打开新窗口
"autocmd BufWritePre *.go :Fmt

"snip代码补全
let g:UltiSnipsExpandTrigger="ii"
let g:UltiSnipsListSnippets="iI"
let g:UltiSnipsJumpForwardTrigger="II"
let g:UltiSnipsJumpBackwardTrigger="OO"

