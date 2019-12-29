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

" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>

" Move by line
nnoremap j gj
nnoremap k gk

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

