source $HOME/.config/nvim/coc-default.vim 

" Settings

set number
set tabstop=4
set shiftwidth=4
set smarttab
set cursorline

let mapleader = " "

let g:ale_disable_lsp=1
" Plugins

call plug#begin('$HOME/.local/share/nvim/site/plugged')
	Plug 'jiangmiao/auto-pairs'
	Plug 'preservim/nerdtree'
	Plug 'lervag/vimtex'
	Plug 'sheerun/vim-polyglot'
	Plug 'dense-analysis/ale'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'dylanaraps/wal.vim'
call plug#end()

" LaTeX settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Key-bindings
map <leader>h :noh<CR>

" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"hi CocSearch ctermfg=12 guifg=#18A3FF
"hi CocMenuSel ctermbg=109 guibg=#13354A

nnoremap <C-m> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

colorscheme wal
syntax on
hi CursorLine cterm=NONE ctermbg=0 ctermfg=NONE
hi cursorLineNr cterm=NONE ctermfg=NONE gui=bold guifg=NONE
hi Identifier ctermbg=NONE ctermfg=4
hi Type cterm=NONE ctermfg=6 cterm=BOLD
"hi Structure ctermbg=NONE ctermfg=7 cterm=BOLD
