" Visual mode mappings.

" Move between windows.
xnoremap <C-h> <C-w>h
xnoremap <C-j> <C-w>j
xnoremap <C-k> <C-w>k
xnoremap <C-l> <C-w>l

xnoremap <silent> * :<C-u>call muchomuchacho#functions#VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" fzf
xnoremap <silent> J :call muchomuchacho#functions#SearchVisualSelectionWithAg()<CR>
