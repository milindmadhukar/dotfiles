# dotfiles
The configuration of software I use.

## Pre-requisites

`git` and GNU `stow`

`sudo pacman -S git stow` </br>
`sudo apt install git stow`

## Setup ⚙️

1. Clone the repository.</br>
`git clone https://github.com/milindmadhukar/dotfiles.git ~`

1. Run stow to symlink everything or just select what you want</br>
`stow --target=$HOME */ # Everything (the '/' ignores the README)`</br>
`stow zsh # Just my zsh config`
