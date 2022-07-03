source $HOME/.config/nvim/coc-default.vim 

" Settings

set number
set tabstop=4
set shiftwidth=4
set smarttab

let g:ale_disable_lsp=1
" Plugins

call plug#begin('$HOME/.local/share/nvim/site/plugged')
	Plug 'jiangmiao/auto-pairs'
	Plug 'preservim/nerdtree'
	Plug 'lervag/vimtex'
	Plug 'sheerun/vim-polyglot'
	Plug 'dense-analysis/ale'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" LaTeX settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Key-bindings
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <C-m> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
