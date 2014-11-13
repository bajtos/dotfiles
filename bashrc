GIT_PS1_SHOWCOLORHINTS=1
. ~/.git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\[\033]0;\u@\h: \w\007\]\u@\h:\w" "\\\$ "'
. ~/.git-completion.bash

. ~/.shrc
