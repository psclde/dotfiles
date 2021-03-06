dotfiles
========
A collection of my various dotfiles and other configuration files.

## Usage
`./install.sh` creates all necessary links, folders, downloads [vim-plug](https://github.com/junegunn/vim-plug) and installs all Vim plugins.
Additional programs on macOS can be installed through the package manager [Homebrew](https://brew.sh).
A list of my currently installed programs is defined in the [Brewfile](https://github.com/Homebrew/homebrew-bundle).
The listed programs can be installed using the following `brew bundle install --verbose`.

## Vim

### Configuration

Which plugins will be installed can be controlled on a per-machine basis via the `g:installType#isCompleteInstall` constant in `vim/autoload/installType.vim`.
The install script ask whether all plugins should be installed or not.
An incomplete install ignores some of the heavier plugins which would be not very useful on some machines (e.g. servers).

Filetype specific settings are configured in `vim/after/ftplugin`.
A type of 'inheritance' is implemented by using `runtime!`.
For example both Markdown (`pandoc.vim`) and LaTeX (`tex.vim`) inherit settings from plain text files (`text.vim`) through `runtime! ftplugin/text.vim`.

## ZSH

### Configuration

Machine specific environment variables can be put in `~/.zshenv.local` and `$PATH` additions in `~/.zprofile.local`.
