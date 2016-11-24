set number
set encoding=utf-8
scriptencoding utf-8
set modeline
set modelines=5
set tabstop=4
set shiftwidth=4

call plug#begin('~/.vim/plugged')
	Plug 'altercation/vim-colors-solarized'
	Plug 'croaker/mustang-vim'
	Plug 'nanotech/jellybeans.vim'
	Plug 'tomasr/molokai'
	Plug 'fatih/vim-go'
	Plug 'Shougo/neocomplete.vim'
	Plug 'bling/vim-airline'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'scrooloose/syntastic'
	Plug 'altercation/vim-colors-solarized'
call plug#end()
filetype off
filetype plugin indent off

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
if s:plug.is_installed('molokai')
	syntax on
	colorscheme molokai
endif

" neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

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

" NERDTress File highlighting
" show hiddenfiles
let NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
let g:vim_json_syntax_conceal = 0

if s:plug.is_installed('scrooloose/nerdtree')
	autocmd vimenter * NERDTree
endif


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction


call NERDTreeHighlightFile('go', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('py', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


filetype plugin indent on
