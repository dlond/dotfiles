# My dotfiles

This directory contains the dotfiles for my system. Initial inspiration came from [Dreams of Autonomy](https://github.com/dreamsofautonomy)'s YouTube video on [dotfiles](https://www.youtube.com/watch?v=y6XCebnB9gs)


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
```

Then use GNU stow to create symlinks

```
stow .
```

