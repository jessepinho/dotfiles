# Use vim key bindings.
set -o vi

# Use git bash completion.
source ~/.git-completion.bash

export EDITOR=/usr/local/bin/vim # Use vim as the default editor.
export NODE_ENV=development
export PATH="/usr/local/heroku/bin:$PATH" # Added by the Heroku Toolbelt
export PATH="~/Library/Python/2.7/bin:$PATH" # Add pip executables to the path
export PATH="./node_modules/.bin:$PATH" # Make node executables in the current node project accessible
export PS1="\W$ " # Format the bash prompt to only show the current directory
export PS2="> " # Format the continuation interactive prompt
export RAILS_ENV=development
export VISUAL="$EDITOR"

# Set up thefuck (https://github.com/nvbn/thefuck)
eval $(thefuck --alias)

# Set up NVM.
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Load RVM into a shell session *as a function*.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias android-emulator='~/Library/Android/sdk/tools/emulator -avd pixel2 &'
alias be='bundle exec'
alias dotfiles='cd ~/.dotfiles'
alias dr80='docker run -p 80:80'
# https://remysharp.com/2017/05/29/getting-free-wifi
alias freewifi="sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`"
alias g='git'
alias gc='git commit'
alias gcm='gc -m '
alias gcp='gc && gpoh'
alias gpoh='git push origin head'
alias gpohnv='git push origin head --no-verify'
alias gpohf='git push origin head --force'
alias gpohfnv='git push origin head --force --no-verify'
alias gpohu='git push origin head -u'
alias gpohunv='git push origin head -u --no-verify'
alias ll='ls -alh'
alias sbp='source ~/.bash_profile'
alias simplehttpserver='python -m SimpleHTTPServer 8000'
alias untar='tar -xvzf'
alias vbp='vim ~/.bash_profile'
alias vbpl='vim ~/.bash_profile_local'

# Allow Doge Git commands, like "such commit," or "very push." Because it's
# important.
alias many='git'
alias much='git'
alias such='git'
alias very='git'
alias wow='git'

ulimit -n 4096

checkPort() {
  lsof -i tcp:$1
}

# Switch iTerm profile. Thanks to http://superuser.com/a/948104/286156
iterm() {
  local message="Changing iTerm profile to $1."
  echo -e "$message\033]50;SetProfile=$1\a"
}

# Include a local .bash_profile, if it exists.
if [ -f ~/.bash_profile_local ]; then
  source ~/.bash_profile_local
fi

# Prune merged branches. Thanks to http://stackoverflow.com/a/6127884/974981
function gpm {
  git branch --merged \
    | grep -v "\*" \
    | grep -v master \
    | xargs -n 1 git branch -d

  git remote prune origin
}

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

function setUpWorkDirectoryAliases {
  local file
  # Iterate over all files in ~/Code
  for file in ~/Code/work/*; do
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

setUpWorkDirectoryAliases

# Open XCode for the project in the current directory
function xc {
  for file in ./*.{xcworkspace,xcodeproj}; do
    if [ -e $file ]; then
      open $file
      break
    fi
  done
}

# Open simulators
function simulators {
  # Open Simulator with iPhone X
  open -a Simulator --args -CurrentDeviceUDID 8E51DCC4-83C4-4C24-8049-6F4B5F7ADEB7

  # Boot iPad after waiting for Simulator to open
  sleep 5 && xcrun simctl boot 30F5A835-AB9B-4AA0-804E-E86C366EA7B0

  # Open the provided URL in all devices
  sleep 5 && \
    xcrun simctl openurl 8E51DCC4-83C4-4C24-8049-6F4B5F7ADEB7 "http://localhost:3000" && \
    xcrun simctl openurl 30F5A835-AB9B-4AA0-804E-E86C366EA7B0 "http://localhost:3000"

  # Open Android Emulator with Pixel 2
  # Requires that a device with the name "pixel2" exists
  ~/Library/Android/sdk/tools/emulator -avd pixel2 &
}

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
