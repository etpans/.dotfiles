### PATH SETUP ###
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

### ZINIT INSTALLATION AND SETUP ###
# Install Zinit if not already installed
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}Zinit…%f"
    mkdir -p "$HOME/.local/share/zinit"
    chmod g-rwX "$HOME/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{34}Installation successful.%f" || \
        print -P "%F{160}Clone failed.%f"
fi

# Source Zinit and completion
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load important annexes (required for some plugin functionality)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### PROMPT SETUP ###
eval "$(starship init zsh)"

### PLUGIN LOADING ###
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

### COMPLETION SYSTEM ###
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a=z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

### HISTORY SETTINGS ###
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

setopt appendhistory         # Append to history file (don't overwrite)
setopt sharehistory          # Share history across all sessions
setopt hist_ignore_space     # Ignore commands that start with a space
setopt hist_ignore_all_dups  # Don't record duplicate entries
setopt hist_save_no_dups     # Avoid saving duplicate commands
setopt hist_ignore_dups      # Ignore duplicate entries in history
setopt hist_find_no_dups     # Ignore duplicate matches when searching history
HISTDUP=erase                # Erase duplicates from history

### KEYBINDINGS ###
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

### ALIASES ###
alias ls='lsd'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$HOME/.java/jdk-24.0.2/bin:$PATH
alias py='python3'
export PATH="/mnt/c/Users/Evan/AppData/Local/Programs/Python/Python313/Scripts:$PATH"
alias isort="/mnt/c/Users/Evan/AppData/Local/Programs/Python/Python313/Scripts/isort.exe"
alias black="/mnt/c/Users/Evan/AppData/Local/Programs/Python/Python313/Scripts/black.exe"
alias dotfiles=/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
