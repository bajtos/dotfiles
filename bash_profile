[ -n ${WSL_AUTH_SOCK} ] && export SSH_AUTH_SOCK=${WSL_AUTH_SOCK}

if uname -r | grep -q Microsoft
then
  export DOCKER_HOST=tcp://localhost:2375
fi


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

export PATH="$HOME/bin:./node_modules/.bin:$PATH"
if [ -f ~/.cargo/env ]; then
  source ~/.cargo/env
fi
