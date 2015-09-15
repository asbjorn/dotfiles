set nocompatible
filetype off

if match($TERM, "screen") != 1
    set term=xterm
endif

set cm=blowfish2


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'wincent/command-t'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nanotech/jellybeans.vim'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-markdown'

" Go development
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode'

" Python development
"Plugin 'Chiel92/vim-autoformat'

" Snake python Vim plugins
Plugin 'amoffat/snake'

" Dockerfile syntax
Bundle "ekalinin/Dockerfile.vim"

call vundle#end()
filetype plugin indent on

" Enable vim-pathogen
execute pathogen#infect()

" Show filename in terminal title bar
"syn on se title
syntax on se title
set ai

set history=100
set laststatus=2
set ts=4 " tabsize

"set wildmode=list:longest
set wildignore+=*.o,*.obj,*.pyc,*/tmp/*,*.so,*.swp*,*.zip
set showmatch
set smartcase
set cmdheight=2
set magic


set ruler
" Set vertical ruler at 80
set colorcolumn=85
highlight ColorColumn guibg=magenta

" colorscheme
"colorscheme blackboard
colorscheme jellybeans

" Map <leader> key to ',' instead of '\'
"let mapleader = ","

" mouse settings
set mouse=a
set mousehide
set mousemodel=popup

" Text-formatting
set autoindent
set smarttab
set expandtab " Convert tabs to spaces
set tabstop=4 " Tab
set shiftwidth=4 " Indent
set softtabstop=4 " Backspace
set textwidth=79 " lines longer will be broken
set shiftround " round indent to multiple of shiftwidth

set formatoptions-=t " don't auto-wrap text
set formatoptions+=corqn
"                  |||||
"                  ||||+-- Recognize numbered lists
"                  |||+--- Allow formatting of comments with 'gq'
"                  ||+---- Insert comment leader after <Enter>
"                  |+----- Insert comment leader after o/O
"                  +------ Auto-wrap comments

set incsearch    " Show search matches as you type
set ignorecase   " Ignore case when searching
set smartcase    " Override 'ignorecase' when needed
set hlsearch     " Highlight search results
set showmatch    " Show matching bracket
set matchtime=2  " ... for .2 seconds

set infercase  " Try to adjust insert completions for case
set completeopt=longest,menu,menuone
"               |       |    |
"               |       |    +-- Show popup even with one match
"               |       +------- Use popup menu with completions
"               +--------------- Insert longest completion match

set wildmenu  " Enable wildmenu for completion
set wildmode=longest:full,list:full
"            |            |
"            |            +-- List matches, complete first match
"            +--------------- Complete longest prefix, use wildmenu


" custom filetypes
au BufRead,BufNewFile SConstruct set filetype=python expandtab ts=6
au BufRead,BufNewFile SConscript set filetype=python expandtab ts=6

au BufRead,BufNewFile *.py set expandtab ts=4 shiftwidth=4
autocmd FileType python set omnifunc=pythoncomplete#Complete

au BufRead,BufNewFile *.f	set expandtab ts=4
au BufRead,BufNewFile *.f90	set expandtab ts=4
au BufRead,BufNewFile *.f77 set expandtab ts=4

au BufRead,BufNewFile *.c set expandtab ts=4 sw=4

au BufRead,BufNewFile .password set noswapfile

"au BufRead,BufNewFile *.js set ft=javascript syntax=jquery

" custom mapping
autocmd BufRead *.py    imap :print print("")<left><left>
autocmd BufRead *.py    imap ;d [default %default]<left><left>
autocmd BufRead SConstruct  imap ;print print("")<left><left>
autocmd BufRead SConscript  imap ;print print("")<left><left>

map <F12> :set number!<CR> " Enable line numbering by pressing F12
map <silent> <f2> ggVG

" complete file names
inoremap <c-f>      <c-x><c-f>

set backspace=2
" change to working dir
"autocmd Bufenter * lcd %:p:h

" doxygen stuff
let g:load_doxygen_syntax=1

" fix mappings to 'tab' commands
map ,t <Esc>:tabnew<CR>
map ,n <Esc>:tabn<CR>
map ,p <Esc>:tabp<CR>

" CtrlP mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" builgs a tag libs for the current working directory (fast)
"map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

" Syntax for multple tag files are 
" set tags=/project/my/dir/tags, /work/project/my/dir/tags
set tags=tags;$HOME/.vim/tags

" TagList Plugin Configuration
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1
map <F7> :TlistToggle<CR>

" viewport controls
" ir moving between split panes
map <silent>,h <C-w>h
map <silent>,j <C-w>j
map <silent>,k <C-w>k
map <silent>,l <C-w>l


" custom dictionary
set dictionary=~/.vim/mydict.dat
set complete-=k complete+=k

" custom abbreviations
"iab pythonmain if __name__ == "__main__":<Cr>


"iab cmain #include <stdio.h><Cr>#include <stdlib.h><Cr>#include <unistd.h><Cr>#include <string.h><Cr><Cr>int main(int argc, char *argv[])<Cr>{<Cr><Cr>return EXIT_SUCCESS;<Cr>}<Esc>03k$a


augroup Xml
	au BufNewFile *.xml :python import vim
	au BufNewFile *.xml :python vim.current.buffer[0:0] = ['<?xml version="1.0"?>']
	au BufNewFile *.xml :python del vim
augroup end

" Set font according to system
set gfn=Monospace\ 10
set shell=/bin/bash


set ffs=unix,dos,mac "Default file types

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Remove all content / lines in file
map <silent>,d :1,$d<CR>

" Comment out C-code
map co <S-I>//<ESC>

" splitting of windows
nnoremap <silent> vv <C-w>v " Vertical
nnoremap <silent> ss <C-w>s " Horizontal

" Change my makeprg to work with SeisSpace (given I have the 'pw' alias set!)
"set makeprg=pw make

" Show ↪ at the beginning of wrapped lines.
let &sbr = nr2char(8618).' '

" Vim-airline customizatino
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#letf_sep = ' '
let g:airline#extensions#tabline#letf_sep = '|'


" Vim jellybean colorscheme customizations
let g:jellybeans_overrides = {
\   'Todo': {'guifg': '303030', 'guibg': 'f0f000', 
\           'ctermfg': 'Black', 'ctermbg': 'Yellow', 
\           'attr': 'bold'}
\}

" Keep vim's directory context same as the current buffer
if exists('+autochdir')
    set autochdir
endif

" YouCompleteMe options
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Disable auto folding for markdown files
let g:vim_markdown_folding_disabled = 1

let g:instant_markdown_autostart = 1

