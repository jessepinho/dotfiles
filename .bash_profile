# Use vim key bindings.
set -o vi

# Use git bash completion.
source ~/.git-completion.bash

export EDITOR=vim # Use vim as the default editor.
export PATH="$HOME/.bin:/usr/local/bin:$PATH:$HOME/.node_modules/bin" # Make any node executables accessible
export PATH="/usr/local/heroku/bin:$PATH" # Added by the Heroku Toolbelt
export PATH="./node_modules/.bin:$PATH" # Make node executables in the current node project accessible

currentDirectory='\W' # Only show the current directory
export PS1="${currentDirectory}$ " # Format the bash prompt
export PS2="> " # Format the continuation interactive prompt

# Set up NVM.
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Load RVM into a shell session *as a function*.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias be='bundle exec'
alias dotfiles='cd ~/.dotfiles'
alias ll='ls -l'

# Allow Doge Git commands, like "such commit," or "very push." Because it's
# important.
alias many='git'
alias much='git'
alias such='git'
alias very='git'
alias wow='git'

ulimit -n 4096

# Include a local .bash_profile, if it exists.
if [ -f ~/.bash_profile_local ]; then
  source ~/.bash_profile_local
fi

function setUpCodeDirectoryAliases {
  local file
  # Iterate over all files in ~/Code
  for file in ~/Code/*; do
    # Filter for just directories
    if [ -d $file ]; then
      # Get the directory name without the full path
      local aliasName=$(basename $file)
      # Make sure the directory's name isn't already a command in bash
      if ! command -v $aliasName >/dev/null 2>&1; then
        # Create an alias named after the directory that cd's into it
        alias $aliasName="cd $file"
      fi
    fi
  done
}

setUpCodeDirectoryAliases
