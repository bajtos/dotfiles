GIT_PS1_SHOWCOLORHINTS=1
. ~/.git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
. ~/.git-completion.bash

PATH=$HOME/bin:$PATH
export PATH

alias node-dev='$HOME/src/node/out/Release/node'
alias npm-dev='$HOME/src/npm/bin/npm-cli.js'

export D8_PATH=$HOME/src/node/deps/v8/out/native

case `uname -s` in
  Darwin )
    alias v8-tick-processor='$HOME/src/node/deps/v8/tools/mac-tick-processor'
    ;;

  Linux )
    alias v8-tick-processor='$HOME/src/node/deps/v8/tools/linux-tick-processor'
    ;;
esac

# This loads NVM
[[ -s /Users/bajtos/.nvm/nvm.sh ]] && . /Users/bajtos/.nvm/nvm.sh
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# Local host-specific configuration
[[ -f ~/.bash_local ]] && . ~/.bash_local
