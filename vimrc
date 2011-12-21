" .vimrc
" 
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

set tabstop=4       
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.
set showmatch       " When a bracket is inserted, briefly jump to the matching
set matchtime=1
set incsearch       " While typing a search command, show immediately where the
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
set nocp 
set autoindent      " Copy indent from current line when starting a new line
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
 
set ruler           " Show the line and column number of the cursor position,
 
set background=dark " When set to "dark", Vim will try to use colors that look
 
set mouse=a         " Enable the use of the mouse.
set scrolloff=3


set foldmethod=syntax
set foldclose=all
filetype plugin indent on
syntax on

let g:clang_complete_copen=1
map <F2> :call g:ClangUpdateQuickFix() <CR>
au BufRead /tmp/mutt-* set tw=72
au BufWinLeave * mkview
au BufWinEnter * silent loadview
au! BufRead,BufNewFile *.py call Setpython()

function! Setpython()
set foldclose=all
set foldmethod=expr
set foldexpr=getline(v:lnum)[0]=='\ '
endfunction
