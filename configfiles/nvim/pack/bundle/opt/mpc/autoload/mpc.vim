function! mpc#GetPlaylist() abort
  let command = "mpc --format '%position% @%artist% @%album% @%title%' playlist"
  let [results, playlist] = [split(system(command), '\n'), []]
  let maxLengths = {'position': [], 'artist': [], 'album': []}

  for item in results
    call add(playlist, mpc#EncodeSong(item))
  endfor

  for track in playlist
    call add(maxLengths['position'], len(track.position))
    call add(maxLengths['artist'], len(track.artist))
    call add(maxLengths['album'], len(track.album))
  endfor

  call sort(maxLengths.position, "LargestNumber")
  call sort(maxLengths.artist, "LargestNumber")
  call sort(maxLengths.album, "LargestNumber")

  for track in playlist
    if maxLengths.position[-1] + 1 >  len(track.position)
      let track.position = repeat(' ', maxLengths.position[-1] - len(track.position))
        \ . track.position
    endif
    let track.position .= ' '
    let track.artist .= repeat(' ', maxLengths['artist'][-1] + 2 - len(track.artist))
    let track.album .= repeat(' ', maxLengths['album'][-1] + 2 - len(track.album))
  endfor

  return playlist
endfunction

function! LargestNumber(no1, no2) abort
  return a:no1 == a:no2 ? 0 : a:no1 > a:no2 ? 1 : -1
endfunction

function! mpc#EncodeSong(item) abort
  let item = split(a:item, " @")
  let song = {'position': item[0],
    \ 'artist': '@ar' . item[1] . 'ar@',
    \ 'album': '@al' . item[2] . 'al@',
    \ 'title': '@ti' . item[3] . 'ti@'}
  return song
endfunction

function! mpc#DecodeSong(item) abort
  let line_items = split(substitute(a:item, ' \{2,}', ' ', 'g'), ' @')
  let song = {'position': line_items[0],
    \ 'artist': line_items[1][2:-4],
    \ 'album': line_items[2][2:-4],
    \ 'title': line_items[3][2:-4]}
  return song
endfunction

function! mpc#DisplayPlaylist() abort
  let playlist = mpc#GetPlaylist()

  for track in playlist
    let output = track.position . " "
      \ . track.artist
      \ . track.album
      \ . track.title

    if playlist[0].position == track.position
      execute "normal! 1GdGI" . output
    else
      call append(line('$'), output)
    endif
  endfor
endfunction

" Play a song
function! mpc#PlaySong(no) abort
  let song = split(getline(a:no), " ")
  let results = split(system("mpc --format '%title% (%artist%)' play "
      \ . song[0]), "\n")
  let message = '[mpc] NOW PLAYING: ' . results[0]
  echomsg message
endfunction

function! mpc#TogglePlayback()
  let command = 'mpc toggle'
  let result = split(system(command), '\n')[1]

  let message = '[mpc] '
  let message .= split(result, ' ')[0] == '[paused]' ? 'PAUSED' : 'PLAYING'
  echomsg message
endfunction

function! mpc#ToggleRandom()
  let command = 'mpc random'
  let result = split(system(command), '\n')

  let status = len(result) == 3 ? result[2] : result[0]
  let message = split(status, '   ')[2] == 'random: off'
    \ ? '[mpc] RANDOM: OFF' : '[mpc] RANDOM: ON'
  echomsg message
endfunction

function! mpc#ToggleRepeat()
  let command = 'mpc repeat'
  let result = split(system(command), '\n')

  let status = len(result) == 3 ? result[2] : result[0]
  let message = split(status, '   ')[1] == 'repeat: off'
    \ ? '[mpc] REPEAT: OFF' : '[mpc] REPEAT: ON'
  echomsg message
endfunction
