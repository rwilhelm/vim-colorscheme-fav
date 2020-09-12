let g:colorscheme_fav#version = '0.3.1'
let g:colorscheme_fav#file = $VIMHOME . '/colorscheme-fav.lst'

"
" Wrap functions from xolox#colorscheme_switcher
"

function! colorscheme_fav#next(...)
" {{{
	call s:pre_hook()
  call xolox#colorscheme_switcher#cycle(1)
	call s:post_hook()
endfunction
" }}}

function! colorscheme_fav#prev(...)
" {{{
	call s:pre_hook()
  call xolox#colorscheme_switcher#cycle(0)
	call s:post_hook()
endfunction
" }}}

function! colorscheme_fav#random(...)
" {{{
	call s:pre_hook()
	call xolox#colorscheme_switcher#random()
	call s:post_hook()
endfunction
" }}}

"
" Set colorscheme and apply hooks
"

function! colorscheme_fav#set(...)
" {{{
	let default = get([g:colorscheme_fav#default], 0, 'default')
	echo default
	let name = get(a:, 1, default)
	let idx = get(a:, 2, -1)
	echo "Switching to colorscheme " . name . " [" . idx . "]"
	call s:pre_hook()
	execute 'colorscheme ' . name
	call s:post_hook()
endfunction
" }}}

"
" Set next/prev favourite colorscheme
"

function! colorscheme_fav#nextfav()
" {{{
	let cur = trim(execute('colorscheme'))
	let favs = readfile(g:fav_file)
	let idx = index(favs, cur)

	if idx == -1
		let idx = index(uniq(sort(add(favs, cur))), cur)
	endif

	let idx = idx >= len(favs) - 1 ? 0 : idx + 1
	call colorscheme_fav#set(favs[idx], idx)
endfunction
" }}}

function! colorscheme_fav#prevfav()
" {{{
	let cur = trim(execute('colorscheme'))
	let favs = readfile(g:fav_file)
	let idx = index(favs, cur)

	if idx == -1
		let idx = index(uniq(sort(add(favs, cur))), cur)
	endif

	let idx = idx == 0 ? len(favs) - 1 : idx - 1
	call colorscheme_fav#set(favs[idx], idx)
endfunction
" }}}

"
" Add/remove favourite
"

function! colorscheme_fav#add()
" {{{
	let cur = trim(execute('colorscheme'))
	echo "Saving colorscheme to favourites: " . cur
	let favs = readfile(g:fav_file)
	call writefile(uniq(sort(add(favs, cur))), g:fav_file, 'b')
endfunction
" }}}

function! colorscheme_fav#remove(...)
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

"
" Use hooks if available
"

function! s:pre_hook()
" {{{
	if exists('*ColorschemePreHook')
		call ColorschemePreHook()
	endif
endfunction
" }}}

function! s:post_hook()
" {{{
	if exists('*ColorschemePostHook')
		call ColorschemePostHook()
	endif
endfunction
" }}}
