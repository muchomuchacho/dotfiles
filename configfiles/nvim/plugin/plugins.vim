call muchomuchacho#defer#defer('call muchomuchacho#plugins#abolish()')

call muchomuchacho#plugin#lazy({
      \   'pack': 'vim-mundo',
      \   'plugin': 'mundo.vim',
      \   'nnoremap': {
      \     '<silent> <F5>': ':MundoToggle<CR>'
      \   },
      \   'beforeload': [
      \     'call muchomuchacho#mundo#init()'
      \   ]
      \ })
