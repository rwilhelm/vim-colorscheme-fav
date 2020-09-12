let g:rw#colorscheme_fav#version = '0.3.1'

let g:rw#fav_file = $VIMHOME . '/colorscheme-fav.lst'
let g:rw#fav_default = 'base16-gruvbox-dark-hard'

function! rw#colorscheme_fav#next(...)
" {{{
	call rw#colorscheme_fav#pre()
	call xolox#colorscheme_switcher#next()
	call rw#colorscheme_fav#post()
endfunction
" }}}

function! rw#colorscheme_fav#prev(...)
" {{{
	call rw#colorscheme_fav#pre()
  call xolox#colorscheme_switcher#cycle(0)
	call rw#colorscheme_fav#post()
endfunction
" }}}

function! rw#colorscheme_fav#random(...)
" {{{
	call rw#colorscheme_fav#pre()
	call xolox#colorscheme_switcher#random()
	call rw#colorscheme_fav#post()
endfunction
" }}}

function! rw#colorscheme_fav#set(...)
" {{{
	let name = get(a:, 1, g:rw#fav_default)
	let idx = get(a:, 2, 0)
	echo "Switching to colorscheme " . name . " [" . idx . "]"
	call rw#colorscheme_fav#pre()
	execute 'colorscheme ' . name
	call rw#colorscheme_fav#post()
endfunction
" }}}

function! rw#colorscheme_fav#prevfav()
" {{{
	let cur = trim(execute('colorscheme'))
	let favs = readfile(g:rw#fav_file)
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
	let favs = readfile(g:rw#fav_file)
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
	let favs = readfile(g:rw#fav_file)
	call writefile(uniq(sort(add(favs, cur))), g:rw#fav_file, 'b')
endfunction
" }}}

function! rw#colorscheme_fav#remove(...)
" {{{
	let cur = trim(execute('colorscheme'))
	echo "Removing colorscheme " . cur . " from favourites"
	let favs = readfile(g:rw#fav_file)
	let idx = index(favs, cur)
	if idx == -1
		return
	endif
	call remove(favs, idx)
	call writefile(favs, g:rw#fav_file, 'b')
endfunction
" }}}

function! rw#colorscheme_fav#pre()
" {{{
	if exists('#User#ColorschemeFavPreHook')
		echo "Found custom pre hook"
		doautocmd <nomodeline> User ColorschemeFavPreHook
	else
		echo "NO custom pre hook found"
	endif
endfunction
" }}}

function! rw#colorscheme_fav#post()
" {{{
	if exists('#User#ColorschemeFavPostHook')
		echo "Found custom post hook"
		doautocmd <nomodeline> User ColorschemeFavPostHook
	else
		echo "NO custom post hook found"
	endif
endfunction
" }}}
