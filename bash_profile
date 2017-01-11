if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.iterm2_shell_integration.`basename $SHELL` ]; then
  source ~/.iterm2_shell_integration.`basename $SHELL`
fi
