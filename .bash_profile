#
# .bash_profile
#
# @author Scott Perkins
# @see .inputrc
#

# Nicer prompt.
export PS1="\[\e[0;32m\] \[\e[1;32m\]\t \[\e[0;2m\]\w \[\e[0m\]\$ "

# Use colors.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Custom $PATH with extra locations.
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/local/git/bin:$PATH

# Include alias file (if present) containing aliases for ssh, etc.

# Include bashrc file (if present).
if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

# Syntax-highlight code for copying and pasting.

alias python='/usr/local/bin/python3'
alias pip='/usr/local/bin/pip3'
alias vim='mvim -v'
alias vi='mvim -v'
# Requires highlight (`brew install highlight`).

# Git aliases.
alias gs='git status'
alias gc='git commit'
alias gp='git pull --rebase'
alias gcam='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# Git upstream branch syncer.
# Usage: gsync master (checks out master, pull upstream, push origin).


# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Python settings.
export PYTHONPATH="/usr/local/lib/python2.7/site-packages"

#Powerline settings.
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

