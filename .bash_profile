# Use vim key bindings.
set -o vi

# Use git bash completion.
source ~/.git-completion.bash

export EDITOR=vim # Use vim as the default editor.
export PATH="$HOME/.bin:/usr/local/bin:$PATH:$HOME/.node_modules/bin" # Make any node executables accessible.
export PATH="/usr/local/heroku/bin:$PATH" # Added by the Heroku Toolbelt
export PS1='\W$ ' # Only show the current directory in bash prompt

# Load RVM into a shell session *as a function*.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias be='bundle exec'
alias ll='ls -l'

# Allow Doge Git commands, like "such commit," or "very push." Because it's
# important.
alias many='git'
alias much='git'
alias such='git'
alias very='git'
alias wow='git'

ulimit -n 4096
