execute pathogen#infect()
syntax on
filetype plugin indent on

"配色
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
" 高亮当前行和列
set cul
set cuc
" 左侧目录窗口
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 开关左侧窗口快捷键 
nmap <F2> :NERDTreeToggle<cr>
" tagList窗口
nmap <F3> :TlistToggle<CR>
" 下方搜索栏
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

"ctags设置，自动加载tags文件
set tags=tags;
set autochdir

" 其他设置
syntax enable
syntax on

set number
set numberwidth=5
set textwidth=100
set mouse=r
