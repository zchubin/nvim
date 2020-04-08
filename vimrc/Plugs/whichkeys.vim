"===
"=== whichkeys
"===
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader>      : <c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      : <c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> : <c-u>WhichKey  ';'<CR>
nnoremap <silent> <leader>      : WhichKey '<Space>'<CR>

let g:which_key_map =  {}

let g:which_key_map.f = { 'name' : '+file' }

let g:which_key_map.f.d = 'open-vimrc'

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>

" let g:which_key_map.o = {
"       \ 'name' : '+open',
"       \ 'q' : 'open-quickfix'    ,
"       \ 'l' : 'open-locationlist',
"       \ }

