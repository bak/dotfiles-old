###########
#   ZSH   #
###########

# go fast
setopt NO_cdable_vars

# Initialize colors.
autoload -U colors
colors

setopt PROMPT_SUBST

# Zsh's globbing...
setopt no_nomatch
setopt no_correctall

# Load and run compinit
autoload -U compinit
compinit -i

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# use emacsish keybindings at prompt
bindkey -e

# make search up and down work, so partially type and cycle up/down to find relevant stuff
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

# Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Allow for functions in the prompt.
setopt PROMPT_SUBST

# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

PROMPT=$'%D{%T} %{${fg[yellow]}%}%~/$(prompt_git_info)%{${fg[default]}%} %# '

# direnv
eval "$(direnv hook zsh)"

# hub
# eval "$(hub alias -s)"

export EDITOR="vim"

if [ -f "${HOME}/.gemrc.local" ]; then
  export GEMRC="${HOME}/.gemrc.local"
fi

#######################
# Generic shell stuff #
#######################

export PAGER="less"
export LESS="-R"

alias l='ls -1AopG'
alias ll='ls -1AopG | less'
alias hx='fc -l 1'

export HOMEBREW_NO_ANALYTICS=1


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

