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

" Insert time
nnoremap <C-t>t "=strftime("%c")<CR>P

" FZF
nnoremap <silent> <C-g> :Rgw<Cr>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> T :call muchomuchacho#functions#GrepForWord("GGrep")<CR>
"" fuzzy find wiki entries
nnoremap <C-w>p :Files ~/git/md_wiki<CR>
nnoremap <C-w>r :GrepWiki<space>
nnoremap <silent><C-w>b :Bck<CR>
" nnoremap <C-w>g :Rgw ~/Seafile/logbook/Notes/<Cr>

nnoremap <F8> :TagbarToggle<CR>

" No arrow keys --- force yourself to use the home row
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Jump to start and end of line using the home row keys
map H ^
map L $

