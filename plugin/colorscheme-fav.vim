
if &cp || exists('g:loaded_colorscheme_fav')
  finish
endif

" Make sure vim-misc is installed.
"try
"  " The point of this code is to do something completely innocent while making
"  " sure the vim-misc plug-in is installed. We specifically don't use Vim's
"  " exists() function because it doesn't load auto-load scripts that haven't
"  " already been loaded yet (last tested on Vim 7.3).
"  call type(g:xolox#misc#version)
"catch
"  echomsg "Warning: The vim-colorscheme-switcher plug-in requires the vim-misc plug-in which seems not to be installed! For more information please review the installation instructions in the readme (also available on the homepage and on GitHub). The vim-colorscheme-switcher plug-in will now be disabled."
"  let g:loaded_colorscheme_fav = 1
"  finish
"endtry

"if xolox#misc#option#get('colorscheme_switcher_define_mappings', 1)
"  inoremap <silent> <F8> <C-O>:NextColorScheme<CR>
"  nnoremap <silent> <F8> :NextColorScheme<CR>
"  inoremap <silent> <S-F8> <C-O>:PrevColorScheme<CR>
"  nnoremap <silent> <S-F8> :PrevColorScheme<CR>
"  inoremap <silent> <C-F8> <C-O>:RandomColorScheme<CR>
"  nnoremap <silent> <C-F8> :RandomColorScheme<CR>
"endif
"
"command! -bar NextColorScheme call xolox#colorscheme_switcher#next()
"command! -bar PrevColorScheme call xolox#colorscheme_switcher#previous()
"command! -bar RandomColorScheme call xolox#colorscheme_switcher#random()

" Don't reload the plug-in once it has loaded successfully.
let g:loaded_colorscheme_fav = 1

" vim: ts=2 sw=2 et


call rw#colorscheme_fav#set()

" Commands
command! -bar ColorschemeFavNext call rw#colorscheme_fav#nextfav()
command! -bar ColorschemeFavPrev call rw#colorscheme_fav#prevfav()
command! -bar ColorschemeFavAdd call rw#colorscheme_fav#add()
command! -bar ColorschemeFavRemove call rw#colorscheme_fav#remove()
command! -bar ColorschemeNext call rw#colorscheme_fav#next()
command! -bar ColorschemePrev call rw#colorscheme_fav#prev()
command! -bar ColorschemeRandom call rw#colorscheme_fav#random()

" Mappings
inoremap<silent> <F6>   <C-O> :ColorschemeFavAdd<CR>
nnoremap<silent> <F6>         :ColorschemeFavAdd<CR>
inoremap<silent> <S-F6> <C-O> :ColorschemeFavRemove<CR>
nnoremap<silent> <S-F6>       :ColorschemeFavRemove<CR>

inoremap<silent> <F7>   <C-O> :ColorschemeFavNext<CR>
nnoremap<silent> <F7>         :ColorschemeFavNex<CR>
inoremap<silent> <S-F7> <C-O> :ColorschemeFavPrev<CR>
nnoremap<silent> <S-F7>       :ColorschemeFavPrev<CR>

inoremap<silent> <F8>   <C-O> :ColorschemeNext<CR>
nnoremap<silent> <F8>         :ColorschemeNext<CR>
inoremap<silent> <S-F8> <C-O> :ColorschemePrev<CR>
nnoremap<silent> <S-F8>       :ColorschemePrev<CR>

