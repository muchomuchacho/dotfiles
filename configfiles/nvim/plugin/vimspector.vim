let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
let g:vimspector_install_gadgets = ['debugpy']

if get( g:, 'vimspector_clean', 0 )
  finish
endif

scriptencoding utf-8

let g:vimspector_sidebar_with = 75
let g:vimspector_terminal_maxwidth = 55
let g:vimspector_terminal_minwidth = 20
let g:vimspector_bottombar_height = 15

" function! s:SetUpUI() abort
"   call win_gotoid( g:vimspector_session_windows.output )
"   q
" endfunction

" augroup VimspectorCustom
"   au!
"   autocmd User VimspectorUICreated call s:SetUpUI()
" augroup END

let g:vimspector_sign_priority = {
      \ 'vimspectorBP': 11,
      \ 'vimspectorBPCond': 11,
      \ 'vimspectorBPDisabled': 11,
      \ 'vimspectorPC': 12,
      \ }
