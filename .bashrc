#!/bin/bash

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac


# Load aliass if exists
if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi

# Load variables if exists
if [ -f ~/.bash_colors ]; then
   . ~/.bash_colors
fi

# Configure Bash History

# Don't put duplicate lines or lines starting with space in
# the history (~/.bash_history).
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# Setting history size.
HISTSIZE=100
HISTFILESIZE=200


# Configure Bash Behavior

# Check the window size after each command and, if
# necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make the pattern "**" in a pathname expansion context
# match all files and zero or more directories.
if [ "$OSTYPE" == linux-gnu ]; then
  shopt -s globstar;
fi


# Configure Prompt Style

# Lookup for git branch.
function PS1_GIT_BRANCH() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Set different color for root.
PS1_USER_COLOR="\e[31m"
if [ "$EUID" -ne 0 ]; then
  PS1_USER_COLOR="\e[32m"
fi

# Set the promt variable.
export PS1="\[$PS1_USER_COLOR\]\u@\h \[\e[${LIGHT_YELLOW_FG}m\]\w \[\e[${LIGHT_CYAN_FG}m\]\$(PS1_GIT_BRANCH)
\[\e[${WHITE_FG}m\]\$ \[\e[m\] "
