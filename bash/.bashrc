# ~/.bashrc
#
# Executed by Bash for interactive non-login shells.
# This file contains shell configuration, prompt settings,
# completion, PATH updates, and custom functions.
#
# Personal aliases are stored in ~/.bash_aliases.

# --------------------------------------------------
# Exit if shell is non-interactive
# --------------------------------------------------
case $- in
    *i*) ;;
      *) return;;
esac

# --------------------------------------------------
# History Configuration
# --------------------------------------------------

# Ignore duplicate commands and commands prefixed with a space
HISTCONTROL=ignoreboth

# Append to history file instead of overwriting it
shopt -s histappend

# History size (current session / saved file)
HISTSIZE=10000
HISTFILESIZE=20000

# --------------------------------------------------
# Terminal Behavior
# --------------------------------------------------

# Update terminal dimensions automatically
shopt -s checkwinsize

# Make less friendlier for non-text files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# --------------------------------------------------
# Chroot Support
# --------------------------------------------------

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# --------------------------------------------------
# Prompt Configuration
# --------------------------------------------------

case "$TERM" in
    xterm-color|*-256color)
        color_prompt=yes
        ;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# --------------------------------------------------
# Terminal Title
# --------------------------------------------------

case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
esac

# --------------------------------------------------
# Color Support
# --------------------------------------------------

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# --------------------------------------------------
# Default Ubuntu Aliases
# --------------------------------------------------

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Notify when a long-running command finishes
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# --------------------------------------------------
# Load Personal Aliases
# --------------------------------------------------

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# --------------------------------------------------
# Bash Completion
# --------------------------------------------------

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# --------------------------------------------------
# User-local executables
# --------------------------------------------------

export PATH="$HOME/.local/bin:$PATH"

# --------------------------------------------------
# Custom Functions
# --------------------------------------------------

# Create directory and immediately enter it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# opencode
export PATH=/home/smit-patel/.opencode/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Starship
eval "$(starship init bash)"

# Zoxide (must be last)
eval "$(zoxide init bash)"

# Organizing in Scripts folder
export PATH="$HOME/Scripts:$PATH"
