ZSH=$HOME/.oh-my-zsh
ZSH_THEME="koto"

# CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# COMPLETION_WAITING_DOTS="true"

plugins=(git yum pip)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

alias gs="gst -sb"
alias ll="ls -alh"

if [ -z $TMUX ]; then
  tmux -u -2 attach-session -t raven
fi

export WORKON_HOME=~/.virtualenvs
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
  source /usr/bin/virtualenvwrapper.sh
fi

if [ -f ~/.dotfiles/DIR_COLORS.xterm ]; then
    eval `dircolors -b ~/.dotfiles/DIR_COLORS.xterm`
fi
