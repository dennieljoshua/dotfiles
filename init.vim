syntax on
set number
set showcmd
let mapleader=";"

" --- vimplug
call plug#begin()

" editors
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'editorconfig/editorconfig-vim'

" themes
Plug 'tanvirtin/monokai.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" nodejs / ts
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()
" --- vimplug#end


" --- Theme stuffs
colorscheme monokai


" --- Plugin configurations

" --- Nerdtree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-n> :NERDTree<CR>
let NERDTreeShowHidden=1

" --- Fzf
nnoremap <silent> <C-f> :Files<CR>

" --- CoC
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

set signcolumn=number

nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

