set encoding=utf-8
scriptencoding utf-8
set ambiwidth=double
set incsearch
set ignorecase
set smartcase
set hlsearch
set showmatch
source $VIMRUNTIME/macros/matchit.vim
set wildmenu
set history=1000

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"Plugin 'itchyny/lightline.vim'
"set laststatus=2
"let g:lightline = {
      "\ 'colorscheme': 'seoul256',
     "\ }

Plugin 'tpope/vim-surround'
" visual mode :S(

Plugin 'rking/ag.vim'
let g:ag_working_path_mode="r"
"e    to open file and close the quickfix window
"o    to open (same as enter)
"go   to preview file (open but maintain focus on ag.vim results)
"t    to open in new tab
"T    to open in new tab silently
"h    to open in horizontal split
"H    to open in horizontal split silently
"v    to open in vertical split
"gv   to open in vertical split silently
"q    to close the quickfix window

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Shougo/neocomplete'
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Plugin key-mappings.
inoremap <expr><C-g> complete_common_string    neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plugin 'nsf/gocode', {'rtp': 'vim/'}

syntax on
set t_vb=
set visualbell
set noerrorbells
set nowrapscan
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
set autoindent
set smartindent
set clipboard+=unnamed
set clipboard+=autoselect
set cursorcolumn
highlight cursorcolumn ctermbg=black

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.yaml setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.yml setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup fileTypeMapping
    autocmd!
    autocmd FileType go nnoremap <Leader>b :<C-u>GoBuild<Return>
    autocmd FileType go nnoremap <Leader>d :<C-u>GoDoc<Return>
    autocmd FileType go nnoremap <leader>r <Plug>(go-run)
    autocmd FileType go nnoremap <Leader>t :<C-u>GoTest<Return>
    "autocmd FileType go nnoremap <Leader>gtf :<C-u>GoTestFunc<Return>
    autocmd FileType go nnoremap <Leader>g :<C-u>GoDebugStart ./ test<Return>
    autocmd FileType go nnoremap <Leader>p :<C-u>GoDebugBreakpoint<Return>
augroup END

" Mapping
let mapleader = ',' 
inoremap <Leader>dt.  <C-r>=strftime('%Y-%m-%dT%H:%M:%S')<Return> 
nnoremap <Leader>w  :<C-u>tabnew<Return> 
nnoremap <Leader>s  :<C-u>source ~/.vimrc<Return>
nnoremap <Leader>e  :<C-u>tabnew<CR>:e ~/.vimrc<Return>
nnoremap <Leader>m  :<C-u>marks<Return>
nnoremap <Leader>pi  :<C-u>PluginInstall<Return>
nnoremap <Leader>ag  :<C-u>Ag<Return>
nnoremap <Leader>f :GFiles<CR>
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

