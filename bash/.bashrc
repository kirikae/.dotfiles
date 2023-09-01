#
#     █                    █
#     █                    █
#     █                    █
#     █▓██   ░███░  ▒███▒  █▒██▒   █▒██▒  ▓██▒
#     █▓ ▓█  █▒ ▒█  █▒ ░█  █▓ ▒█   ██  █ ▓█  ▓
#     █   █      █  █▒░    █   █   █     █░
#     █   █  ▒████  ░███▒  █   █   █     █
#     █   █  █▒  █     ▒█  █   █   █     █░
#     █▓ ▓█  █░ ▓█  █░ ▒█  █   █   █     ▓█  ▓
#     █▓██   ▒██▒█  ▒███▒  █   █   █      ▓██▒
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PROJECT_HOME=$HOME/Repositories
export VISUAL=vim
export EDITOR=vim
export BROWSER=firefox
export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go"
if [ -f /usr/bin/virtualenvwrapper.sh  ]; then
  export WORKON_HOME=$HOME/.virtualenvs
  . /usr/bin/virtualenvwrapper.sh
elif [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  export WOKRON_HOME=$HOME/.virtualenvs
  . /usr/local/bin/virtualenvwrapper.sh
fi
export VAGRANT_DEFAULT_PROVIDER=libvirt

# Ansible variables
export ANSIBLE_NOCOWS=true

# Ensure history is written on the fly and appended each time.
# No more lost history from closing multiple windows / panes!!
shopt -s histappend
PROMPT_COMMAND='$PROMPT_COMMMAND; history -a; history -n'
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL="ignoredups"
HISTIGNORE='ls:clear:history:pwd:git status:mosquitto_'
shopt -s cmdhist
HISTTIMEFORMAT='%F %T '

#########################################
#
#	COLOURS FOR MAN PAGES
#---------------------------------------#

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1   		# For Konsole and Gnome-terminal
# Add support to Less as well
export LESS="--RAW-CONTROL-CHARS"

#########################
#	PROMPT
#-----------------------#

# Syntactic sugar for ANSI escape sequences
txtblk='\[\e[0;30m\]'	# Black - Regular
txtred='\[\e[0;31m\]'	# Red
txtgrn='\[\e[0;32m\]'	# Green
txtylw='\[\e[0;33m\]'	# Yellow
txtblu='\[\e[0;34m\]'	# Blue
txtpur='\[\e[0;35m\]'	# Purple
txtcyn='\[\e[0;36m\]'	# Cyan
txtwht='\[\e[0;37m\]'	# White
bldblk='\[\e[1;30m\]'	# Black - Bold
bldred='\[\e[1;31m\]'	# Red
bldgrn='\[\e[1;32m\]'	# Green
bldylw='\[\e[1;33m\]'	# Yellow
bldblu='\[\e[1;34m\]'	# Blue
bldpur='\[\e[1;35m\]'	# Purple
bldcyn='\[\e[1;36m\]'	# Cyan
bldwht='\[\e[1;37m\]'	# White
unkblk='\[\e[4;30m\]'	# Black - Underline
undred='\[\e[4;31m\]'	# Red
undgrn='\[\e[4;32m\]'	# Green
undylw='\[\e[4;33m\]'	# Yellow
undblu='\[\e[4;34m\]'	# Blue
undpur='\[\e[4;35m\]'	# Purple
undcyn='\[\e[4;36m\]'	# Cyan
undwht='\[\e[4;37m\]'	# White
bakblk='\[\e[40m\]'		# Black - Background
bakred='\[\e[41m\]'		# Red
badgrn='\[\e[42m\]'		# Green
bakylw='\[\e[43m\]'		# Yellow
bakblu='\[\e[44m\]'		# Blue
bakpur='\[\e[45m\]'		# Purple
bakcyn='\[\e[46m\]'		# Cyan
bakwht='\[\e[47m\]'		# White
txtrst='\[\e[0m\]'		# Text Reset

if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
  source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

GIT_PS1_SHOWCOLORHINTS=1
GITPROMPT='$(__git_ps1 "\e[0;30m╾╼[\e[0m %s \e[0m\e[0;30m]\e[0m")'

PS1="${txtblk}┌╼${txtrst}${txtblk}[${txtrst}${txtblu}\u${txtrst}${txtblk}]${txtrst}${txtblk}╾╼${txtrst}${txtblk}[${txtrst}${txtblu}\h${txtrst}${txtblk}]${txtrst}${GITPROMPT}$(__venv_ps1) \n${txtblk}└╼${txtrst}${txtblk}[${txtrst}${txtblu}\w${txtrst}${txtblk}]${txtrst} "

#########################
#	ALIASES
#-----------------------#

if [[ -f ~/.alias ]]; then
	. ~/.alias
fi

source <(kubectl completion bash)
eval "$(direnv hook bash)"
eval "$(register-python-argcomplete kcli)"
