"==============
"insorker's vim
"==============
set nocompatible
set shortmess+=I
let mapleader=","

" 不要生成swap文件
setlocal noswapfile

" 自动切换当前目录为当前文件所在目录
set autochdir

" 开启语法高亮、括号补全高亮
syntax on
set showmatch

" 显示行号与相对行号
set number
set relativenumber

" 短暂跳转到匹配括号的时间
set matchtime=2

" 总是显示状态栏
set laststatus=2

" 让退格键更加人性化
set backspace=indent,eol,start

" 允许在有未保存的修改时切换缓冲区
set hidden

" 显示上/下5行的内容
set scrolloff=5

" 开启相关内容
filetype on
filetype plugin on
filetype indent on

" 设置搜索
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap n nzz
nnoremap N Nzz

" 设置缩进
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

" 设置折叠
set foldenable
" due to some bug
" set foldmethod=syntax
set foldmethod=manual
" set foldmethod=indent
set foldcolumn=0
setlocal foldlevel=1
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 消除错误提示音与光标闪烁
set noerrorbells visualbell t_vb=

" 解锁按键
map <C-a> <Nop>
map <C-x> <Nop>
nmap Q <Nop>

" 更快捷自然的窗口操作
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
set splitbelow
set splitright

" 显示命令
set showcmd

" tab提示命令补全
set wildmenu

" 消除你的坏习惯，然而并没有什么用。。。
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" vim插件配置
set tags=./tags,tags;$HOME

"=================
" vim-plug插件配置
"=================
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ervandew/supertab'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
"---> not necessary, since it works only if your code is indented with spaces
"---> with tabs would not work
" Plug 'Yggdroot/indentLine'
"---> it seems that when i used this plug, some mistakes with chinese spelling happened
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
"---> i've forgotten
" Plug 'SirVer/ultisnips'
call plug#end()

"===> [ctrlp.vim]
" 详见github，目前我不需要任何配置

"===> [coc.nvim]
" 安装缺失的extensions
let g:coc_global_extensions=['coc-java', 'coc-pyright', 'coc-clangd', 'coc-json']

"===> [supertab tab]
" 按tab可切换补全（shift-tab反向切换)
let g:SuperTabDefaultCompletionType="context"

"===> [gruvbox]
" 使用gruvbox配色
autocmd vimenter * ++nested colorscheme gruvbox
" 强制使用dark模式
set bg=dark

"===> [nerdcommenter]
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"===> [nerdtree]
nnoremap <leader>t :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

""===> [indentLine]
"" 指定对齐线的尺寸
"let g:indent_guides_guide_size = 1
"" 从第二层开始可视化显示缩进
"let g:indent_guides_start_level = 2
"" highlight conceal color with my colorscheme
"let g:indentLine_setColors = 0

" vim-airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
