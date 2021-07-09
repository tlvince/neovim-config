# Neovim Configuration

Optimised for NodeJS, serverless and React

## Features

- Language Server Protocol (go-to, auto completion, code actions, snippets)
- Diagnostics (formatting, linting)
- Auto completion
- Git signs
- Fuzzy finder
- Wiki

## Requirements

- neovim >=0.5

## Usage

```bash
git clone --recursive https://github.com/tlvince/neovim-config.git $HOME/dotfiles/neovim-config
ln -s "$HOME/dotfiles/neovim-config/.nvim" "$XDG_CONFIG_HOME/nvim"
```

## Thanks

- [Steve Losh](http://stevelosh.com/blog/2010/09/coming-home-to-vim/) for his setup guide
- [Patrick Brisbin](https://github.com/pbrisbin/dotfiles) for his `.vimrc`
- [Vim Casts](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/) for the `git submodule` idea for plugins
- [Vim-Scripts](http://vim-scripts.org/) for the convenient GitHub mirror

## Author

© 2013-2021 Tom Vincent <http://tlvince.com/contact>

## License

Released under the [MIT license](http://tlvince.mit-license.org).
