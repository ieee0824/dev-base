set encoding=utf-8
scriptencoding utf-8
set modeline
set modelines=5
set tabstop=4
set shiftwidth=4

call plug#begin('~/.vim/plugged')
	Plug 'tomasr/molokai'
	Plug 'fatih/vim-go'
	Plug 'Shougo/neocomplete.vim'
	Plug 'bling/vim-airline'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'jistr/vim-nerdtree-tabs'
call plug#end()
filetype plugin indent on

let s:plug = {"plugs": get(g:, 'plugs', {})}
function! s:plug.is_installed(name)
	return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction
" key map
nnoremap <Left> <Esc><C-w>h
nnoremap <Right> <Esc><c-w>l
nnoremap <Up> <Esc><c-w>k
nnoremap <Down> <Esc><c-w>j

nnoremap <S-Left> <Esc>:bp<CR>
nnoremap <S-Right> <Esc>:bn<CR>
nnoremap <S-Up> <Esc>:ls<CR>
nnoremap <S-Down> <Esc>:ls<CR>:b<Space>


" molokai
if s:plug.is_installed('tomasr/molokai')
	syntax on
	colorscheme molokai
endif

" neocomplete
let g:neocomplete#enable_at_startup = 1

" vim go
" disable open browser after posting snippet
let g:go_play_open_browser = 0
" enable goimports
let g:go_fmt_command = "goimports"
" enable additional highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1


" vim-airline
set laststatus=2
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'


" show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)
" show type info for the word under your cursor
au FileType go nmap <Leader>gi <Plug>(go-info)
" open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" run Go commands
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>i <Plug>(go-install)
" open the definition/declaration in a new vertical, horizontal or tab for the
" word under your cursor
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)
