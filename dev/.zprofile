# Don't let Homebrew talk to Google Analytics
export HOMEBREW_NO_ANALYTICS=1

#######################
# Generic shell stuff #
#######################

export PAGER="less"
export LESS="-R"

alias l='ls -1aopG'
alias ll='ls -1aopG | less'
alias history='fc -l 1'

##########
#  PATH  #
##########

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="./bin:$PATH"
export MANPATH="/usr/share/man:/usr/local/share/man"
