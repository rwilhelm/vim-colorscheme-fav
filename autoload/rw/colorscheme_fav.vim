let g:rw#colorscheme_fav#version = '0.3.1'

let g:fav_file = $VIMHOME . '/colorscheme-fav.lst'
let g:fav_default = 'base16-gruvbox-dark-hard'

function! rw#colorscheme_fav#next(...)
" {{{
	call xolox#colorscheme_switcher#next()
	call rw#colorscheme_fav#post()
endfunction
" }}}

function! rw#colorscheme_fav#prev(...)
" {{{
	call xolox#colorscheme_switcher#previous()
	call rw#colorscheme_fav#post()
endfunction
" }}}

function! rw#colorscheme_fav#random(...)
" {{{
	call xolox#colorscheme_switcher#random()
	call rw#colorscheme_fav#post()
endfunction
" }}}

function! rw#colorscheme_fav#set(...)
" {{{
	let name = get(a:, 1, g:fav_default)
	let idx = get(a:, 2, 0)
	echo "Switching to colorscheme " . name . " [" . idx . "]"
	execute 'colorscheme ' . name
	call rw#colorscheme_fav#post()
endfunction
" }}}

function! rw#colorscheme_fav#prevfav()
" {{{
	let cur = trim(execute('colorscheme'))
	let favs = readfile(g:fav_file)
	let idx = index(favs, cur)
	if idx == -1
		let idx = index(uniq(sort(add(favs, cur))), cur) - 1
	endif
	if idx < 0
		let idx = len(favs)
	endif
	call rw#colorscheme_fav#set(favs[idx - 1], idx - 1)
endfunction
" }}}

function! rw#colorscheme_fav#nextfav()
" {{{
	let cur = trim(execute('colorscheme'))
	let favs = readfile(g:fav_file)
	let idx = index(favs, cur)
	if idx == -1
		let idx = index(uniq(sort(add(favs, cur))), cur) + 1
	endif
	if idx >= len(favs) - 1
		let idx = 1
	endif
	let name = favs[idx]
	call rw#colorscheme_fav#set(name, idx)
endfunction
" }}}

function! rw#colorscheme_fav#add()
" {{{
	let cur = trim(execute('colorscheme'))
	echo "Saving colorscheme to favourites: " . cur
	let favs = readfile(g:fav_file)
	call writefile(uniq(sort(add(favs, cur))), g:fav_file, 'b')
endfunction
" }}}

function! rw#colorscheme_fav#remove(...)
" {{{
	let cur = trim(execute('colorscheme'))
	echo "Removing colorscheme " . cur . " from favourites"
	let favs = readfile(g:fav_file)
	let idx = index(favs, cur)
	if idx == -1
		return
	endif
	call remove(favs, idx)
	call writefile(favs, g:fav_file, 'b')
endfunction
" }}}

function! rw#colorscheme_fav#post()
" {{{
	highlight clear LineNr
	highlight clear SignColumn
	highlight clear CursorLineNr
	highlight clear SignifySignAdd
	highlight clear SignifySignChange
	highlight clear SignifySignDelete
	highlight clear SignatureMarkText

	highlight Error guifg=#ff0022
	highlight LineNr guifg=#555555
	highlight CursorLine guibg=#2B2620
	highlight CursorLineNr guifg=#ffffff
	highlight Folded guifg=#eeeeee guibg=none
	highlight Search guifg=#00cc99 guibg=none
	highlight SignifySignAdd guifg=#00cc99
	highlight SignifySignChange guifg=#00cc00
	highlight SignifySignDelete guifg=#cc00cc
	highlight SignatureMarkText guifg=#eeeeee
endfunction
" }}}
