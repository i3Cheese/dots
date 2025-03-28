function addToPath {
    export PATH="$1:$PATH"
}
function doOnce {
    if [ "$SHLVL" = 1 ]; then
        sh -c "${@:1}"
    fi
}
function addToPathOnce {
    if [ "$SHLVL" = 1 ]; then
        export PATH="$1:$PATH"
    fi
}

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/dots/oh_my_zsh_custom/"

alias docker-compose="docker compose"

ZSH_THEME="candy"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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
REPORTTIME=5
plugins=(git fzf fancy-ctrl-z sudo colored-man-pages copypath cmd-time)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# alias ohmyzsh="mate ~/.oh-my-zsh"

export POETRY_VIRTUALENVS_IN_PROJECT=true
# pyenv python virtualenvs
if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v "pyenv >/dev/null" || addToPathOnce "$PYENV_ROOT/bin"
    doOnce eval "$(pyenv init -)"
    alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/i3cheese/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/i3cheese/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/i3cheese/miniforge3/etc/profile.d/conda.sh"
    else
        addToPathOnce "/Users/i3cheese/miniforge3/bin"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoload -Uz compinit && compinit

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# kitty
alias kssh="kitty +kitten ssh"

# custom aliases
function mkcd () {
  mkdir -p -- "$1" && cd -P -- "$1"
}


# NNN config
export NNN_PLUG="x:!chmod +x $nnn;p:preview-tui;t:tex-new;u:upload"
export NNN_FIFO="/tmp/nnn.fifo"
#
# # homebrew packages to PATH
# addToPath "/opt/homebrew/opt/llvm/bin"
# addToPath "/opt/homebrew/opt/identify/bin"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

alias cmake_p='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B ./build .'

which direnv >/dev/null && eval "$(direnv hook zsh)"
which xdg-open >/dev/null && alias open=xdg-open
which pbcopy >/dev/null && alias copy=pbcopy
which xclip >/dev/null && alias copy="xclip -selection clipboard -i"

addToPath ~/local/bin/
addToPath ~/.local/bin/

# save screenshot
function pss () {
    folder=$(pwd)
    filename="Screenshot $(date +%Y-%m-%d\ at\ %H.%M.%S).png"

    if [ $# -ne 0 ]; then
        arg="$1"
        if [[ -d $arg ]]; then
            folder=$arg
        else
            a=$(dirname "$arg")
            b=$(basename "$arg" .png)

            if [ "$b" != "" ]; then filename=$b.png; fi

            if [ "$a" != "." ]; then folder=$a; fi
        fi
    fi
    real_folder=$(realpath -q "$folder")
    if [ -n "$real_folder" ]; then
    else
        echo "Bad folder $folder"
        return 1
    fi
    folder="$real_folder"
    # linux
    if [ -x "$(command -v xclip)" ]; then
        (xclip -selection clipboard -t TARGETS -o | grep -q image/png) || (echo "No image in clipboard" && return 1) || return 1
        echo "Saving to folder $folder file $filename"
        xclip -selection clipboard -t image/png -o > "$folder/$filename" || (echo "fail" && return 1) || return 1
        return 0
    else
        echo "No xclip"
    fi

    # mac
    if [ -x "$(command -v osascript)" ]; then
        echo "Saving to folder $folder file $filename"
        osascript -e "tell application \"System Events\" to ¬
            write (the clipboard as «class PNGf») to ¬
            (make new file at folder \"$folder\" ¬
            with properties {name:\"$filename\"})" || (echo "fail" && return 1) || return 1
        return 0
    else
        echo "No pbpaste"
    fi
    
}

addToPath "$HOME/go/bin"

# pnpm
export PNPM_HOME="/home/deck/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
