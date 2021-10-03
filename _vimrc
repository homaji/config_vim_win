"Basic Config
filetype plugin on
filetype indent on
syntax on
syntax enable

"" runtime path
let $MY_VIMRUNTIME = $HOME . '/vimfiles'
let $VIMPLUG = $MY_VIMRUNTIME . '/plugged'

"" ^=を使うことで、検索ディレクトリを前に追加
set runtimepath^=$MY_VIMRUNTIME
set runtimepath^=$VIMPLUG

"" Create Directory
if !isdirectory($MY_VIMRUNTIME . '/vimtemp')
	call mkdir($MY_VIMRUNTIME . '/vimtemp', 'p')
endif

"" Vim-Plug
call plug#begin(expand($VIMPLUG))
    Plug 'junegunn/vim-plug'
    Plug 'cocopon/iceberg.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'vifm/vifm'
    Plug 'thinca/vim-quickrun'
    Plug 'tpope/vim-fugitive'
    Plug 'reireias/vim-cheatsheet'
    ""For markdown
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'tyru/open-browser.vim'
    Plug 'previm/previm'
    Plug 'skanehira/preview-markdown.vim'
    Plug 'dhruvasagar/vim-table-mode'
    ""LSP
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'mattn/vim-lsp-icons'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
"    Plug 'prabirshrestha/async.vim'
call plug#end()

"" Read setting files from init directory
" https://mattn.kaoriya.net/software/vim/20191231001537.htm
call map(sort(split(globpath($HOME, 'init/*.vim'))), {->[execute('exec "so" v:val')]})

""Encoding
set encoding=utf-8
set fileencodings=utf-8,cp932

""Directories
set autochdir
set backup
set backupdir=$MY_VIMRUNTIME/vimtemp
set directory=$MY_VIMRUNTIME/vimtemp
set undodir=$MY_VIMRUNTIME/vimtemp
set viminfo+='1000,n$MY_VIMRUNTIME/viminfo.txt

""Use Clipboard"
set clipboard=unnamed,autoselect

""Buffer
set hidden

""set Wildmode. Bash like complement
set wildmenu
set wildmode=list:longest

""Search
set incsearch
set ignorecase
set smartcase
set hlsearch

""TabWidth
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" KeyConfig
""Change <Leader>
let g:mapleader = ','

""Cursol move
set whichwrap=b,s,h,l,<,>,[,],~

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

""move to other Windows
"http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
"s+hjkl move to window
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
"s+nptT move to tab
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
"s+sv split window
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
"s+qQ kill buffer or window
nnoremap sQ :<C-u>q<CR>
nnoremap sq :<C-u>bd<CR>

""ESC in insert-mode
inoremap jj <ESC>

""No hlsearch with ESC-ESC
nnoremap <ESC><ESC> :<C-u>set nohlsearch!<CR>

""Toggle relativenumber
nnoremap <F2> :<C-u>setlocal relativenumber!<CR>

"Display Setting

""Cursol
set number
set cursorline

""number
"set relativenumber


autocmd  WinLeave * set nocursorline 
autocmd  WinEnter * set cursorline 

""Show Invisible Characters""
"http://qiita.com/X___MOON___X/items/26d3f292537bad197f64
map <silent> <F3> :set list!<CR>
set list
set listchars=tab:>_,trail:_

""Show all lines
"http://itchyny.hatenablog.com/entry/2014/12/25/090000
set display=lastline


""Set Tab line
"http://d.hatena.ne.jp/thinca/20111204/1322932585
set showtabline=2
set guioptions-=e

""Set list height
set pumheight=10
""Set matching
set showmatch
set matchtime=1

""Color Scheme
set t_Co=256
set background=dark
colorscheme iceberg

