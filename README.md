# dotfiles
The configuration of software I use.

![Screenshot 2](https://user-images.githubusercontent.com/68477234/276937815-4dace757-d381-4743-b63c-ce68dd6aa958.png)
![Screenshot 1](https://user-images.githubusercontent.com/68477234/218270384-be39dee1-ccdc-4ea0-bde0-2aed220fd349.png)

## Pre-requisites

`git` and GNU `stow`

```bash
sudo pacman -S git stow
sudo apt install git stow
```

## Setup ⚙️

1. Clone the repository.
```bash
git clone --recursive https://github.com/milindmadhukar/dotfiles.git ~
```

1. Run stow to symlink everything or just select what you want
```bash
stow --target=$HOME */ # Everything (the '/' ignores the README)
stow zsh # Just my zsh config
```
