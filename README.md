# vim-colorscheme-fav

## Features

1. Store and select favourite colorschemes.
2. Pre- and post-hooks when changing colorschemes with [vim-colorscheme-switcher](https://github.com/xolox/vim-colorscheme-switcher) so you can do stuff when changing colorschemes, e.g. overwriting highlights.

### Installation with [plug](https://github.com/junegunn/vim-plug):

> Requires [vim-colorscheme-switcher](https://github.com/xolox/vim-colorscheme-switcher)!

```
Plug 'xolox/vim-colorscheme-switcher'
Plug 'rwilhelm/vim-colorscheme-fav'
```

### Default Mappings

| Key      | Action                  | Description                                |
| -------- | ----------------------- | ------------------------------------------ |
| `<F6>`   | `:ColorschemeFavAdd`    | Add current colorscheme to favourites      |
| `<S-F6>` | `:ColorschemeFavRemove` | Remove current colorscheme from favourites |
| `<F7>`   | `:ColorschemeFavNext`   | Select next favourite colorscheme          |
| `<S-F7>` | `:ColorschemeFavPrev`   | Select previous favourite colorscheme      |
| `<F8>`   | `:ColorschemeNext`      | Select next colorscheme                    |
| `<S-F8>` | `:ColorschemePrev`      | Select previous colorscheme                |
| `<C-F8>` | `:ColorschemeRandom`    | Select random colorscheme                  |

Commands from [vim-colorscheme-switcher](https://github.com/xolox/vim-colorscheme-switcher) are wrapped to apply pre- and post-hooks.

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

### Variables
```viml
	let g:colorscheme_fav#file = $VIMHOME . '/colorscheme-fav.lst'
	let g:colorscheme_fav#default = 'base16-tomorrow-night'
```
***
