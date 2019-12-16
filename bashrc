GIT_PS1_SHOWCOLORHINTS=1
. ~/.git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\[\033]0;\u@\h: \w\007\]\u@\h:\w" "\\\$ "'
. ~/.git-completion.bash

. ~/.shrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source <(node --completion-bash)
source <(npx --shell-auto-fallback bash)
