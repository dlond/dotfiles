# My dotfiles

This directory contains the dotfiles for my system. Initial inspiration came from [Dreams of Autonomy's](https://github.com/dreamsofautonomy) [YouTube video on dotfiles](https://www.youtube.com/watch?v=y6XCebnB9gs)


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
git clone git@github.com/dlond/dotfiles.git $DOTFILES
cd $DOTFILES
git submodule init
git submodule update
```

Then use GNU stow to create symlinks

```
stow .
```

## Notes

### 1. The submodule .config/nvim is forked from nvim-lua/kickstart.nvim.

To sync the fork

```
cd $DOTFILES/.config/nvim
git rebase upstream/master
[ ... fix conflicts ]
git push origin main
```

To modify nvim config 

```
cd $DOTFILES/.config/nvim
[ ... make changes ]
git commit -am "my new awesome config"
git push origin main
```

To get changes into dotfiles

```
cd $DOTFILES
git submodule update
stow .
```
