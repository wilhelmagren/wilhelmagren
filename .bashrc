# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't put duplicate lines or line starting with space in history.
HISTCONTROL=ignoreboth

# Make 'less' more friendly for non-text input files, se lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# Comment this out if you don't want to force colors
force_color_prompt=yes

if [ -n "force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1="\e[1;37m┌──(\e[0m\e[1;36m\u\e[0m\e[1;37m@\e[0m\e[1;36m\h\e[0m\e[1;37m)-[\e[0m\e[1;35m\w\e[0m\e[1;37m]\e[0m\n└──\e[1;37m\$\e[0m "
else
	PS1='┌──(\u@\h)-[\w]\n└──\$ '
fi
unset color_prompt force_color_prompt

# Alias definitions
if [ -e $HOME/.bash_aliases ]; then
	source $HOME/.bash_aliases
fi

