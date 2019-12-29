" Leader mappings

nnoremap <silent> <leader>q :bd<Cr>
nnoremap <silent> <leader>o :only<Cr>
" Open Vimrc in a vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Reload the Vimrc file after making changes
nnoremap <leader>sv :source $MYVIMRC<cr>
" Show the path of the current file
nnoremap <Leader>p :echo expand('%')<CR>

" Quickly open a markdown buffer for scribble
map <leader>x :vs ~/Seafile/logbook/logbook.md<cr>

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

