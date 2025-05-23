# Enable Powerlevel11k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/go/bin:$PATH

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.config/rofi/scripts:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git golang zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias hyprconf="cd ~/.config/hypr/"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias lvimconf="cd ~/dotfiles/lvim/.config/lvim/ && nvim config.lua"
alias hexec="history | fzf | sed -E 's/^[[:space:]]*[0-9]+//' | sh"
alias dotfiles="cd ~/dotfiles"
alias nv="nvim"

alias mcode="cd ~/Code"

alias kittyconf="cd ~/dotfiles/kitty/.config/kitty/"
alias nvimconf="cd ~/dotfiles/nvim/.config/nvim/"
alias zshconf="nvim ~/dotfiles/zsh/.zshrc"

alias updatekitty="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
alias updatevencord="sh -c \"\$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)\""

alias forgetwifi="sudo $HOME/.config/zsh/forget_wifi.sh"

alias go-musixmatch="cd ~/Desktop/Code/Golang\ Projects/go-musixmatch"
alias stonksapi="cd ~/Desktop/Code/Golang\ Projects/stonksapi"
alias Martin-Garrix-Bot="cd ~/Desktop/Code/Python\ Projects/Martin-Garrix-Bot && source venv/bin/activate"
alias pycordia="cd ~/Desktop/Code/Python\ Projects/pycordia"
alias piston="cd ~/Desktop/Code/Golang\ Projects/go-piston/"
alias portfolio="cd ~/Desktop/Code/Golang\ Projects/portfolio"
alias garrixrocks="cd ~/Desktop/Code/Garrix/garrix.rocks"
alias garrixbot="cd ~/Desktop/Code/Garrix/garrix-bot"
alias plusxplay="cd ~/Desktop/Code/plusxhub/plusxplay"
alias aoc="cd ~/Desktop/Code/Advent-Of-Code/"

# TODO: Remove kitty specific stuff
alias kssh="kitty +kitten ssh"
alias icat="kitty +kitten icat"
alias ls="lsd"
alias lg="lazygit"
alias clock="tty-clock -c -s -S -B -C 2"
alias tmux="tmux -u"
alias matrix="cmatrix"
alias neofetch="fastfetch"

alias ascap="cd ~/Desktop/Code/ascap_scraper/ && source venv/bin/activate && python main.py && deactivate && cd"
alias wifi="cd ~/Desktop/Code && python3 vitlogin.py && cd"
alias ytdlpbest='yt-dlp -f "bv*+ba/b" --merge-output-format mp4 --embed-metadata --embed-thumbnail --add-metadata'

bgr() {
   python3 $HOME/.config/zsh/random_wallpaper.py
}

bgs() {
    python3 $HOME/.config/zsh/select_wallpaper.py
}

proxy_on() {
  export http_proxy=http://172.16.1.1:56349
  export https_proxy=http://172.16.1.1:56349
}

proxy_off() {
  unset http_proxy
  unset https_proxy
}

# fnm
FNM_PATH="/home/milind/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/milind/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

export ANTHROPIC_API_KEY=$(< ~/anthropicapikey.txt)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
