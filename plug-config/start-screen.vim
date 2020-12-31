" Save sessions in this folder
let g:startify_session_dir='~/.config/nvim/session'

" What to show in the vim starting menu
let g:startify_lists = [
  \ { 'type': 'sessions', 'header':['   Sessions'] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
  \ { 'type':  'files', 'header': ['   Current Directory'.getcwd()]},
  \ ]

" Bookmarks
let g:startify_bookmarks = [
  \ {'w': '~/Work'},
  \ '~/Work'
  \ ]

" Automatically Update Sessions
let g:startify_session_persistence = 1

" Get rid of empty buffer and quit
let g:startify_enable_special = 0

" Custom header
let g:startify_custom_header = [
      \ '     +-----------------------------------------+',
      \ '     |He who has a why can bear almost any how.|',
      \ '     +-----------------------------------------+',
  \ ]
