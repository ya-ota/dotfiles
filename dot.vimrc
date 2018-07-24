scriptencoding utf-8

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

Plugin 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

Plugin 'tpope/vim-surround'
" visual mode > S(

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

Plugin 'fatih/vim-go'

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

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.yaml setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.yml setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2

    autocmd FileType go nmap <leader>gr <Plug>(go-run-vertical)
    autocmd BufNewFile,BufRead *.go nnoremap <Leader>gb :<C-u>GoBuild<Return>
    "autocmd BufNewFile,BufRead *.go nnoremap <Leader>gd :<C-u>GoDoc<Return>
    autocmd BufNewFile,BufRead *.go nnoremap <Leader>gdb :<C-u>GoDebugStart<Return>
    autocmd BufNewFile,BufRead *.go nnoremap <Leader>gta :<C-u>GoTest<Return>
    autocmd BufNewFile,BufRead *.go nnoremap <Leader>gtf :<C-u>GoTestFunc<Return>
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


