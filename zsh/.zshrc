# PATH / ENVIRONMENT

# User-local binaries first
export PATH="$HOME/.local/bin:$PATH"

# Optional: Neovim downloaded manually to /opt
if [ -d /opt/nvim-linux-x86_64/bin ]; then
  export PATH="/opt/nvim-linux-x86_64/bin:$PATH"
fi

# Homebrew on Linux
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Rust / Cargo
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# Node.js (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# ZINIT PLUGIN MANAGER
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}Zinit…%f"
    mkdir -p "$HOME/.local/share/zinit"
    chmod g-rwX "$HOME/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{34}Installation successful.%f" || \
        print -P "%F{160}Clone failed.%f"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# COMPLETION
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a=z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# HISTORY
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
HISTDUP=erase

# KEYBINDINGS
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# PROMPT
eval "$(starship init zsh)"

# ALIASES
if command -v lsd >/dev/null 2>&1; then
  alias ls='lsd'
else
  alias ls='ls --color=auto'
fi

alias py='python3'
alias home='cd ~'
alias root='cd ~/'
alias documents='cd /mnt/d/Documents/'
alias projects='cd /mnt/d/Documents/Projects/'
alias leet='tmux new-session -s interview -n notes "nvim ~/interviews/python_coding_interview_notes.md" \; new-window -n leet "nvim leetcode.nvim"'
alias interviews='cd ~/interviews'

# Course/project shortcuts
# alias pcrs='cd ~/Workspace/pcrs-plus-rewrite'
# alias csc259='cd ~/Workspace/Courses/CSC258H5-F'
# alias csc207='cd ~/Workspace/Courses/CSC207H5-F'
# alias csc209='cd ~/Workspace/Courses/CSC209H5-S'
# alias csc209d='cd ~/Workspace/Courses/CSC209H5-S/209'
# alias csc263='cd /mnt/d/Documents/LaTex/CSC263'
# alias csc207d='cd /mnt/d/Documents/University/CSC207/'
# alias nvim-f="NVIM_APPNAME=nvim-f nvim"

# PLUGINS 
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
