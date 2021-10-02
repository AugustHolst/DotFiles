" Settings

set number
set tabstop=4
set shiftwidth=4
set smarttab

" Plugins

call plug#begin('.local/share/nvim/site/plugged')
	Plug 'preservim/nerdtree'
	Plug 'lervag/vimtex'
call plug#end()

" LaTeX settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Key-bindings

nnoremap <C-m> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
