#!/bin/bash

# File Management
if [ "$OSTYPE" == linux-gnu ]; then
  alias la="ls -alh --group-directories-first --color --time-style=\"+%Y-%m-%d %H:%M\""
  alias ll="ls -aC  --group-directories-first --color"
else
  alias ls="gls"
  alias la="gls -alh --group-directories-first --color --time-style=\"+%Y-%m-%d %H:%M\""
  alias ll="gls -aC  --group-directories-first --color"
fi

# Dot net
alias dnr="dotnet run"
alias dnb="dotnet build"

# Git
alias gitlog="tput rmam; echo ''; git log --format='%C(green)%ad %C(blue)%h%C(auto)%d%C(reset)%n%an (%ae)%n%C(bold)%s%C(reset)%n' --date=format:'%Y-%m-%d %H:%M:%S' --graph -n 10; tput smam;"
alias gitstat="git fetch --prune && git status"
