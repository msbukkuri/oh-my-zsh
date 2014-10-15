PROMPT=$'%{$fg[red]%}[%{$fg_bold[white]%}%{$fg[blue]%}%D{%a %b %d %T} %{$fg_bold[white]%}%n%{$fg_bold[blue]%}:%{$fg_bold[white]%}%c%{$fg[red]%}]%(?,,%{$fg[red]%}-[%{$fg_bold[blue]%}%?%{$fg[red]%}])->%{$reset_color%} '
RPROMPT=$'%{$fg[red]%}[%{$fg_bold[white]%}$(repo_prompt)$(repo_branch)%{$fg[red]%}]%{$reset_color%}'

PS2=$' %{$fg[red]%}->%{$reset_color%} '

function repo_prompt {
	git branch > /dev/null 2>/dev/null && echo 'git' && return
	echo 'none'
}

function repo_branch {
  git branch >/dev/null 2>/dev/null || return
  branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch_name="-HEAD"
  branch_name="%{$fg[red]%}:%{$fg_bold[white]%}${branch_name##refs/heads/}"
  echo $branch_name
}