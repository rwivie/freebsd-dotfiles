
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle :compinstall filename '/home/ron/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
bindkey -e
# End of lines configured by zsh-newuser-install

#==== source

source $HOME/.aliases
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#==== dir colors
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

#=== Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
# mandatory for colored man pages
export GROFF_NO_SGR=1         # For Konsole and Gnome-terminal

#====command-not-found

command_not_found_handler() {
  local missing_command="$1"
  local search_results

  # Run 'pkg search' and grep for the missing command
  search_results=$(pkg search "$missing_command" 2>/dev/null | grep -E "^$missing_command")

  if [ -n "$search_results" ]; then
    echo "The following package(s) provide '$missing_command':"
    echo "$search_results"
  else
    echo "zsh: command not found: $missing_command" 1>&2
  fi
  return 127
}

#==== prompts

autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%{${fg[cyan]}%}[%{${fg[green]}%}%s%{${fg[cyan]}%}][%{${fg[blue]}%}%r/%S%%{${fg[cyan]}%}][%{${fg[blue]}%}%b%{${fg[yellow]}%}%m%u%c%{${fg[cyan]}%}]%{$reset_color%}"

setprompt() {
  setopt prompt_subst

  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
    p_host='%F{yellow}%M%f'
  else
    p_host='%F{green}%M%f'
  fi

  PS1=${(j::Q)${(Z:Cn:):-$'
    %F{cyan}[%f
    %(!.%F{red}%n%f.%F{green}%n%f)
    %F{cyan}@%f
    ${p_host}
    %F{cyan}][%f
    %F{blue}%~%f
    %F{cyan}]%f
    %(!.%F{red}%#%f.%F{green}%#%f)
    " "
  '}}

  PS2=$'%_>'
  RPROMPT=$'${vcs_info_msg_0_}'
}
setprompt