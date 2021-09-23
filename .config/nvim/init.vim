" Settings

set number
set tabstop=2
set smarttab

" Plugins

call plug#begin('.local/share/nvim/site/plugged')
	Plug 'preservim/nerdtree'
call plug#end()

" Key-bindings

nnoremap <C-m> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
