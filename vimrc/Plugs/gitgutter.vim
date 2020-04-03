" ==
" == GitGutter
" ==

let g:gitgutter_git_executable = 'D:\Development\Git\bin\Git\bin\git.exe'
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1

autocmd BufWritePost * GitGutter

nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>
