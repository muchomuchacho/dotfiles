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
nnoremap <silent><left> :bp<CR>
nnoremap <silent><right> :bn<CR>

" FZF
nnoremap <silent> <C-g> :Rgw<Cr>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> T :call muchomuchacho#functions#GrepForWord("GGrep")<CR>
"" fuzzy find wiki entries
nnoremap <C-w>p :Files ~/Seafile/logbook/Notes/<CR>
nnoremap <silent><C-w>r :Rwiki<space>
nnoremap <silent><C-w>b :Bck<CR>
" nnoremap <C-w>g :Rgw ~/Seafile/logbook/Notes/<Cr>

" No arrow keys --- force yourself to use the home row
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Jump to start and end of line using the home row keys
map H ^
map L $

