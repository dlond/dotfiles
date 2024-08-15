# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git
```
brew install git
```

### Stow
```
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
git clone git@github.com/dlond/dotfiles.git
cd dotfiles
git submodule init
git submodule update
```

Then use GNU stow to create symlinks

```
stow .
```

## Notes

### 1.

nvim config is forked from nvim-lua/kickstart.nvim.

To sync the fork

```
git rebase upstream/master
```

To get changes (e.g. syncs or updates) into dotfiles

```
git submodule update
```
