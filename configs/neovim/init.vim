call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set ts=2
set sts=2
set sw=2
set et

" COC configuration
set cmdheight=2
set updatetime=300
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break
" undo chain at current position.
" Coc only does snippet and additional edit on
" confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
