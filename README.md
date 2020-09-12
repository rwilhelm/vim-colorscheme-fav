# vim-colorscheme-fav

## Features

1. Pre- and post-hooks when changing colorschemes with [vim-colorscheme-switcher](https://github.com/xolox/vim-colorscheme-switcher) so you can do stuff when changing colorschemes, e.g. overwriting highlights.
2. Ability to store and select favourite colorschemes.

### Installation with [plug](https://github.com/junegunn/vim-plug):

```
Plug 'xolox/vim-colorscheme-switcher'
Plug 'rwilhelm/vim-colorscheme-fav'
```

### Add or remove favourite
```
:ColorschemeFavAdd
:ColorschemeFavRemove
```

### Select next/prev/random favourite colorscheme
```
:ColorschemeFavNext
:ColorschemePrev
:ColorschemeFavRandom
```

### Select next/prev colorscheme
Wrappers for the ones from [vim-colorscheme-switcher](https://github.com/xolox/vim-colorscheme-switcher) to apply pre- and post-hooks.
```
:ColorschemeNext
:ColorschemePrev
:ColorschemeRandom
```

### Hooks
Define `ColorschemePostHook()` and/or `ColorschemePreHook()`, e.g.:
```viml
function! ColorschemePostHook()
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
```

### Variable Defaults
```viml
	let g:colorscheme_fav#file = $VIMHOME . '/colorscheme-fav.lst'
```
