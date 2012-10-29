" .vimrc
" 
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details


filetype indent plugin on
set smartindent
set tabstop=4
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set expandtab
set showcmd         " Show (partial) command in status line.
set softtabstop=4
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
 
set tags=./tags;/

set virtualedit=block
set tabpagemax=15
 
set mouse=a         " Enable the use of the mouse.
set scrolloff=3
let g:netrw_http_cmd='curl'
let g:netrw_http_xcmd='-o'
let g:netrw_silent=1
"let g:clang_library_path = "/usr/lib"


set foldmethod=syntax
set foldopen=all
set nocp
syntax on
colo gardener
hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
let g:clang_complete_copen=1
map <F2> :call g:ClangUpdateQuickFix() <CR>
au BufRead,BufNew /tmp/mutt* so ~/.mutt/mutt.vim
au BufRead *.txt set tw=94
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
"au! BufRead,BufNewFile *.py call Setpython()
au BufNewFile *zshcle* setft=zsh
au BufWinEnter,BufRead,BufNewFile *.java set filetype=java makeprg=javamake ts=4 sw=4 noet
au BufNewFile,BufRead *.svg setf svg 
autocmd BufReadPre *.pdf set ro nowrap
autocmd BufReadPost *.pdf silent %!pdftotext "%" -nopgbrk -layout -q -eol unix -
autocmd BufWritePost *.pdf silent !rm -rf ~/PDF/%
autocmd BufWritePost *.pdf silent !lp -s -d pdffg "%"
autocmd BufWritePost *.pdf silent !until [ -e ~/PDF/% ]; do sleep 1; done
autocmd BufWritePost *.pdf silent !mv ~/PDF/% %:p:h
au BufNewFile,BufRead /etc/nginx/conf/* set ft=nginx
autocmd BufReadPost ~/pastes/* noremap q <esc>:q!<esc>
autocmd BufReadPost /tmp/* noremap q <esc>:q!<esc>
au BufRead,BufNewFile *systemd* set filetype=systemd

au BufWinEnter,BufRead,BufNewFile *.c set filetype=c ts=4 sw=4 noet
