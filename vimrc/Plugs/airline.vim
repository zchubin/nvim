"===
"=== airle
"===

" let g:airline_theme='violet'
let g:airline_theme='base16'

" smart tab line 更智能的标签线
let g:airline#extensions#tabline#enabled = 1

" 为制表行单独配置分隔符，这是定义'直接'制表符的方式
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_powerline_fonts = 1  " 支持 powerline 字体

" 添加特殊字符
set statusline+=%4*\ %F\ %*
hi User4 cterm=bold ctermfg=169 ctermbg=239

" if get(g:, 'deus_termcolors', 256) == 16
"   let s:term_red    = 1
"   let s:term_green  = 2
"   let s:term_yellow = 3
"   let s:term_blue   = 4
"   let s:term_purple = 5
"   let s:term_white  = 7
"   let s:term_black  = 0
"   let s:term_grey   = 8
" else
"   let s:term_red    = 204
"   let s:term_green  = 114
"   let s:term_yellow = 180
"   let s:term_blue   = 39
"   let s:term_purple = 170
"   let s:term_white  = 145
"   let s:term_black  = 235
"   let s:term_grey   = 236
" endif
"
" if get(g:, 'airline#themes#base16#constant', 0)
"   let g:airline#themes#base16#palette = {}
"
"   " Normal mode
"   let s:N1 = [s:gui_dark_gray, s:gui_green, s:cterm_dark_gray, s:cterm_green]
"   if s:improved_contrast
"     let s:N2 = [s:gui_lightlight_gray, s:gui_med_gray_lo, s:cterm_lightlight_gray, s:cterm_med_gray_lo]
"   else
"
"     let s:N2 = [s:gui_light_gray, s:gui_med_gray_lo, s:cterm_light_gray, s:cterm_med_gray_lo]
"   endif
"   let s:N3 = [s:gui_green, s:gui_med_gray_hi, s:cterm_green, s:cterm_med_gray_hi]
"   let g:airline#themes#base16#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
"   let g:airline#themes#base16#palette.normal_modified = {
"         \ 'airline_c': [s:gui_orange, s:gui_med_gray_hi, s:cterm_orange, s:cterm_med_gray_hi, ''],
"         \ }
"
"   " Insert mode
"   let s:I1 = [s:gui_med_gray_hi, s:gui_blue, s:cterm_med_gray_hi, s:cterm_blue]
"   let s:I3 = [s:gui_blue, s:gui_med_gray_hi, s:cterm_blue, s:cterm_med_gray_hi]
"   let g:airline#themes#base16#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:I3)
"   let g:airline#themes#base16#palette.insert_modified = copy(g:airline#themes#base16#palette.normal_modified)
"   let g:airline#themes#base16#palette.insert_paste = {
"         \ 'airline_a': [s:gui_dark_gray, s:gui_orange, s:cterm_dark_gray, s:cterm_orange, ''],
"         \ }
"
"   " Replace mode
"   let g:airline#themes#base16#palette.replace = {
"         \ 'airline_a': [s:gui_dark_gray, s:gui_red, s:cterm_dark_gray, s:cterm_red, ''],
"         \ 'airline_c': [s:gui_red, s:gui_med_gray_hi, s:cterm_red, s:cterm_med_gray_hi, ''],
"         \ }
"   let g:airline#themes#base16#palette.replace_modified = copy(g:airline#themes#base16#palette.insert_modified)
"
"   " Visual mode
"   let s:V1 = [s:gui_dark_gray, s:gui_pink, s:cterm_dark_gray, s:cterm_pink]
"   let s:V3 = [s:gui_pink, s:gui_med_gray_hi, s:cterm_pink, s:cterm_med_gray_hi]
"   let g:airline#themes#base16#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:V3)
"   let g:airline#themes#base16#palette.visual_modified = copy(g:airline#themes#base16#palette.insert_modified)
"
"   " Inactive window
"   if s:improved_contrast
"     let s:IA = [s:gui_dark_gray, s:gui_med_gray_hi, s:cterm_lightlight_gray, s:cterm_med_gray_hi, '']
"   else
"     let s:IA = [s:gui_dark_gray, s:gui_med_gray_hi, s:cterm_light_gray, s:cterm_med_gray_hi, '']
"   endif
"   let g:airline#themes#base16#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
"   let g:airline#themes#base16#palette.inactive_modified = {
"         \ 'airline_c': [s:gui_orange, '', s:cterm_orange, '', ''],
"         \ }
"   " Warnings
"   let s:WI = [ '#282C34', '#E5C07B', s:term_black, s:term_yellow ]
"   let g:airline#themes#deus#palette.normal.airline_warning = [
"        \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
"        \ ]
"
"   let g:airline#themes#deus#palette.normal_modified.airline_warning =
"       \ g:airline#themes#deus#palette.normal.airline_warning
"
"   let g:airline#themes#deus#palette.insert.airline_warning =
"       \ g:airline#themes#deus#palette.normal.airline_warning
"
"   let g:airline#themes#deus#palette.insert_modified.airline_warning =
"       \ g:airline#themes#deus#palette.normal.airline_warning
"
"   let g:airline#themes#deus#palette.visual.airline_warning =
"       \ g:airline#themes#deus#palette.normal.airline_warning
"
"   let g:airline#themes#deus#palette.visual_modified.airline_warning =
"       \ g:airline#themes#deus#palette.normal.airline_warning
"
"   let g:airline#themes#deus#palette.replace.airline_warning =
"       \ g:airline#themes#deus#palette.normal.airline_warning
"
"   let g:airline#themes#deus#palette.replace_modified.airline_warning =
"       \ g:airline#themes#deus#palette.normal.airline_warning
"
"   " Errors
"   let s:ER = [ '#282C34', '#E06C75', s:term_black, s:term_red ]
"   let g:airline#themes#deus#palette.normal.airline_error = [
"        \ s:ER[0], s:ER[1], s:ER[2], s:ER[3]
"        \ ]
"
"   let g:airline#themes#deus#palette.normal_modified.airline_error =
"       \ g:airline#themes#deus#palette.normal.airline_error
"
"   let g:airline#themes#deus#palette.insert.airline_error =
"       \ g:airline#themes#deus#palette.normal.airline_error
"
"   let g:airline#themes#deus#palette.insert_modified.airline_error =
"       \ g:airline#themes#deus#palette.normal.airline_error
"
"   let g:airline#themes#deus#palette.visual.airline_error =
"       \ g:airline#themes#deus#palette.normal.airline_error
"
"   let g:airline#themes#deus#palette.visual_modified.airline_error =
"       \ g:airline#themes#deus#palette.normal.airline_error
"
"   let g:airline#themes#deus#palette.replace.airline_error =
"       \ g:airline#themes#deus#palette.normal.airline_error
"
"   let g:airline#themes#deus#palette.replace_modified.airline_error =
"       \ g:airline#themes#deus#palette.normal.airline_error
" endif
