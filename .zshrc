
#
# .zshrc
#
# @author Scott Perkins
#
#
#
#
#
# --- Enable vi mode ---
#echo scott
#set -o vi
#
## --- Keybindings for editing ---
#bindkey "^H" backward-delete-char        # Ctrl-H / Backspace fixes
#bindkey '^A' beginning-of-line           # Ctrl-A to go to start
#bindkey '^E' end-of-line                 # Ctrl-E to go to end
#
## --- History search in vi-mode ---
#bindkey -M vicmd '/' history-incremental-search-backward
#bindkey -M vicmd '?' history-incremental-search-forward

# Number of history entries stored in memory
HISTFILE=~/.zsh_history
HISTSIZE=500
SAVEHIST=500
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE

# Load the full history file into each new session
fc -R ~/.zsh_history

# Number of history entries stored in the history file

#
#Set VI mode
set -o vi
#.config/dotfiles
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.config/dotfiles/zsh/aliases.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.config/dotfiles/zsh/starship.zsh
#[[ -f ~/.zsh/goto.zsh ]] && source ~/.zsh/goto.zsh

eval "$(starship init zsh)"
# You may need to manually set your language environment
 export LANG=en_US.UTF-8
 export LC_ALL=en_US.UTF-8
 export FUNNEST=750


 # fzf keybind for interactive history search
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# fzf keybind for interactive history search
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi




# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


##
# alias vim='mvim -v'
#  alias vi='mvim -v'
#  alias k='kubectl'
#  alias kn='kubectl config set-context --current --namespace'
#  alias kgp='kubectl get pods'
#  alias kl='kubectl logs'


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

#================================#
# Force emacs-style bindings (Ghostty expects this)
bindkey -e

# Ctrl shortcuts
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

