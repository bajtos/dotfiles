if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.iterm2_shell_integration.`basename $SHELL` ]; then
  source ~/.iterm2_shell_integration.`basename $SHELL`
fi

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

function iterm2_print_user_vars() {
  iterm2_set_user_var nodeVersion $(node -v)
  iterm2_set_user_var npmVersion $(npm -v)
}

if which hub > /dev/null; then
  eval "$(hub alias -s)"
fi
