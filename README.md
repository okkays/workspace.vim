# workspace.vim

Assorted integrations between workspace and vim.

See [okkays/workspace](https://github.com/okkays/workspace) for the underlying
bash utility.

## Installation

```vimscript
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'okkays/helpers.vim'
Plug 'okkays/workspace', { 'dir': '~/.workspace', 'do': './install' }
Plug 'okkays/workspace.vim'
```

## Features

### fzf :heart: workspace

All commands support (and require)
[junegunn/fzf.vim](https://github.com/junegunn/fzf.vim),

### <C-P>

With the default mappings, ctrl+p opens any file in your workspace.

### Workspace Ag

Search for any file in your workspace using `:WsAg`.

## Development

Use [google/vimdoc](https://github.com/google/vimdoc) to produce documentation.
