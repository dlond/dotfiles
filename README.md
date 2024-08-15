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
git submodules init
git submodules update
```

Then use GNU stow to create symlinks

```
stow .
```
