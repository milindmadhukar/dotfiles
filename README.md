# dotfiles
The configuration of software I use.

## Pre-requisites

`git` and GNU `stow`

```bash
sudo pacman -S git stow
sudo apt install git stow
```

## Setup ⚙️

1. Clone the repository.
```bash
git clone https://github.com/milindmadhukar/dotfiles.git ~
```

1. Run stow to symlink everything or just select what you want
```bash
stow --target=$HOME */ # Everything (the '/' ignores the README)
stow zsh # Just my zsh config
```
