if &cp || exists('g:loaded_colorscheme_fav')
  finish
endif

let g:loaded_colorscheme_fav = 1

"
" Activate the default colorscheme
" Set by overwriting g:fav_default
"

call colorscheme_fav#set()

" Commands
command! -bar ColorschemeFavAdd call colorscheme_fav#add()
command! -bar ColorschemeFavRemove call colorscheme_fav#remove()

command! -bar ColorschemeFavNext call colorscheme_fav#nextfav()
command! -bar ColorschemeFavPrev call colorscheme_fav#prevfav()

" Wraps xolox#colorscheme_switcher
command! -bar ColorschemeNext call colorscheme_fav#next()
command! -bar ColorschemePrev call colorscheme_fav#prev()
command! -bar ColorschemeRandom call colorscheme_fav#random()

" Add/remove favourite
inoremap<silent> <F6>   <C-O> :ColorschemeFavAdd<CR>
nnoremap<silent> <F6>         :ColorschemeFavAdd<CR>
inoremap<silent> <S-F6> <C-O> :ColorschemeFavRemove<CR>
nnoremap<silent> <S-F6>       :ColorschemeFavRemove<CR>

" Next/prev favourite
inoremap<silent> <F7>   <C-O> :ColorschemeFavNext<CR>
nnoremap<silent> <F7>         :ColorschemeFavNext<CR>
inoremap<silent> <S-F7> <C-O> :ColorschemeFavPrev<CR>
nnoremap<silent> <S-F7>       :ColorschemeFavPrev<CR>

" Next/prev colorscheme
inoremap<silent> <F8>   <C-O> :ColorschemeNext<CR>
nnoremap<silent> <F8>         :ColorschemeNext<CR>
inoremap<silent> <S-F8> <C-O> :ColorschemePrev<CR>
nnoremap<silent> <S-F8>       :ColorschemePrev<CR>

