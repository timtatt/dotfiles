# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

# START: pure theme

fpath+=("$(npm root -g)/pure-prompt")

autoload -U promptinit; promptinit
prompt pure

# END: pure theme

plugins=(git zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

# Java
export JAVA_HOME_21=/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home/
export JAVA_HOME_17=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home/
export JAVA_HOME=$JAVA_HOME_17

# bun completions
[ -s "/Users/timtattersall/.bun/_bun" ] && source "/Users/timtattersall/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"

# PATH
export PATH="$PATH:$BUN_INSTALL/bin:/usr/local/go/bin::$HOME/.local/bin"

alias lg='lazygit'
alias oc='opencode'
alias python='python3'
