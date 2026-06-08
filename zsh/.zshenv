. "$HOME/.cargo/env"

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

export PATH="$PATH:$terraform/bin:/Applications/IntelliJ IDEA CE.app/Contents/MacOS"
. "$HOME/.cargo/env"

export GOPATH=~/opt/go/

# Maven
export PATH=$PATH:~/opt/maven/apache-maven-3.9.7/bin

# Java
export JAVA_HOME_21=/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home/
export JAVA_HOME_17=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home/
export JAVA_HOME=$JAVA_HOME_17
export PATH=$PATH:~/opt/jdtls/bin:$GOPATH/bin

alias lg='lazygit'

# bun completions
[ -s "/Users/timtattersall/.bun/_bun" ] && source "/Users/timtattersall/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias oc='opencode'
