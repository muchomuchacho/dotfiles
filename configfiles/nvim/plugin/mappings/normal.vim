" Normal mode mappings

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v

" Executing python scripts
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" Clear search highlighting
nnoremap <silent> <C-c> :let @/=""<CR><C-l>

" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>

" Move around splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Move by line
nnoremap j gj
nnoremap k gk

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

"" fzf
nnoremap <silent> <C-g> :Rgw<Cr>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>b :Buffers<Cr>
nnoremap <silent> <leader>t :GGrep<Cr>
nnoremap <silent> <Leader>d :GFiles?<Cr>
" nnoremap <silent> <Leader>t :Tags<Cr>
nnoremap <silent> <Leader>cc :Commits<CR>
nnoremap <silent> <Leader>bc :BCommits<CR>
nnoremap <localleader> w :call muchomuchacho#functions#GrepForWord("Rgw")<CR>
nnoremap <silent> T :call muchomuchacho#functions#GrepForWord("GGrep")<CR>
nnoremap <leader> ] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" nnoremap <silent> <Leader>g :Rtags<CR>

" No arrow keys --- force yourself to use the home row
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Jump to start and end of line using the home row keys
map H ^
map L $

