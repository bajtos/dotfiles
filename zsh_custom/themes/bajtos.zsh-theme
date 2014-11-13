# based on dpoggi theme
if [ $UID -eq 0 ]; then NCOLOR="$fg[red]"; else NCOLOR="$reset_color"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$NCOLOR%}%n%{$reset_color%}@%m\
%{$reset_color%}:%~\
$(git_prompt_info)\
%{$reset_color%}%(!.#.$) '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%} ("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_DIRTY=""
