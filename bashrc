# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# enable programmable completion features
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if type starship >/dev/null; then
  function set_win_title(){
      echo -ne "\033]0; ${PWD/#$HOME/\~} \007"
  }
  starship_precmd_user_func="set_win_title"
  eval "$(starship init bash)"
else
  echo "Please install starship, see https://starship.rs/guide/#getting-started"
  echo "Falling back to git-prompt.sh"
  GIT_PS1_SHOWCOLORHINTS=1
   . ~/.git-prompt.sh
  PROMPT_COMMAND='__git_ps1 "\[\033]0;\u@\h: \w\007\]\u@\h:\w" "\\\$ "'
fi

. ~/.git-completion.bash

. ~/.shrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

type node > /dev/null && source <(node --completion-bash)
type npm >/dev/null && source <(npm completion)

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true
