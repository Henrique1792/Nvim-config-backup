# Nvim-config-backup

Warning: you may need some configurations before like:

* adding a nerdfont 
* adding python2 and python3 support (probably using pyenv)
* a clipboard manager supported
* I **trully** recommend using tmux or screen to multiplex your terminal. It makes faster and easier to execute many different tasks.
* Compile latest version of nvim (current 0.9)

I won't link needed stuff here - usually I compile nvim with Release tag.

Last, but not least important: I use lazy-nvim to install my plugins and have fun :smile:

## Completion notes!

Some autocompletion tools requires installation without setup with `Lspinstall` - so, check within

[nvim-lspconfig repo](https://github.com/neovim/nvim-lspconfig)

**ERRATA** changed structure to use lsp-zero

## Lua

Some entries still are using vim.cmd call due to issues setting up variables, but it was
entirely migrated to lua.

Pay attention for fzf and nnn versions, these might break if you do not compile them in newer versions
(those packages in apt, for example, are too old for some plugins)

I'll tag latest vimscript based for further references.

