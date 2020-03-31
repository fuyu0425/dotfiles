NEWLINE=$'\n'
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='%{$fg[cyan]%}%d%{$reset_color%} %{$fg_bold[blue]%}%M $(git_prompt_info)\
       ${NEWLINE}%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )'
RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
