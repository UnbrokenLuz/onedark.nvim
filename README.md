fork from one-dark/onedark.nvim, just  little colors  modification

# Neovim One Dark

A Dark Theme for Neovim based on [One Dark Theme](https://github.com/atom/atom/tree/master/packages/one-dark-ui) written in lua with [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlight.

## Features

- 6 styles (default one dark + 5 color variants)
- Changing the style without exiting Neovim (using shortcut key `<leader>cs`. If you want to change or disable this mapping see [toggle style](#toggle-style))
- Supported mulitple plugins with hand picked proper colors

### Plugins Supported

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSPDiagnostics](https://neovim.io/doc/user/lsp.html)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [WhichKey](https://github.com/folke/which-key.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [GitGutter](https://github.com/airblade/vim-gitgutter)
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
- [VimFugitive](https://github.com/tpope/vim-fugitive)
- [DiffView](https://github.com/sindrets/diffview.nvim)
- [Hop](https://github.com/phaazon/hop.nvim)

## Installation

Install via your favorite package manager.

### Vim Plug

```vim
Plug 'one-dark/onedark.nvim'
```

### Packer

```lua
use 'one-dark/onedark.nvim'
```

### Manual

```bash
git clone https://github.com/one-dark/onedark.nvim ~/.config/nvim
nvim +PackerSync
```

## Usage

Enable the colorscheme:

```vim
" ~/.config/nvim/init.vim
colorscheme onedark
```

```lua
-- ~/.config/nvim/init.lua
require('onedark').setup()
```

To Enable the `onedark` theme for `Lualine`, specify theme as `onedark`:

```lua
require('lualine').setup {
  options = {
    theme = 'onedark'
    -- ... your lualine config
  }
}
```

## Styles

### Normal

```vim
colorscheme onedark
```

<img alt="onedark" src="https://user-images.githubusercontent.com/20145075/119296900-8301de80-bc77-11eb-8b50-2accd6f8ecb0.png">

### Vivid

```vim
let g:onedark_style = 'vivid'
colorscheme onedark
```

<img alt="onedark-vivid" src="https://user-images.githubusercontent.com/20145075/119296915-872dfc00-bc77-11eb-9bd0-76c6d90f8e4f.png">

## Configuration

**Important:** you need to add the configs before changing colorscheme

### Onedark options

| Variable name                     | Default value | Description                           |
| --------------------------------- | ------------- | ------------------------------------- |
| `onedark_style`                   | `'normal'`    | Change style variant of one dark      |
| `onedark_italics`                 | `true`        | Enable italics                        |
| `onedark_transparent_background`  | `false`       | Enable transparent background         |
| `onedark_disable_terminal_colors` | `false`       | Disable terminal colors               |
| `onedark_diagnostics_undercurl`   | `true`        | Use curly underline for diagnostics   |
| `onedark_darker_diagnostics`      | `true`        | Show diagnostics using a darker color |
| `onedark_hide_ending_tildes`      | `false`       | Hide end of buffer tildes             |

### Configure onedark.nvim using vimscript:

```vim
let g:onedark_style = 'vivid'
let g:<onedark_option> = 'value'
colorscheme onedark
```

When using vimscript to configure onedark settings **be sure** to use `v:true` and `v:false` to set boolean values!

```vim
let g:onedark_italics = v:true        " don't use 0 or 1
```

### Configure onedark.nvim using lua:

```lua
vim.g.onedark_style = 'vivid'
vim.g.onedark_italics = false
vim.g.<onedark_option> = 'value'
require('onedark').setup()
```
