
#
# .zshrc
#
# @author Scott Perkins
#
#
#
#
#

# Number of history entries stored in memory
HISTSIZE=10000

# Number of history entries stored in the history file
SAVEHIST=10000

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

export PATH="/opt/homebrew/opt/ssh-copy-id/bin:$PATH"
