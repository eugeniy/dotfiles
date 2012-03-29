ZSH=$HOME/.oh-my-zsh
ZSH_THEME="koto"

# CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# COMPLETION_WAITING_DOTS="true"

plugins=(git yum pip rails3)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

alias gs="gst -sb"
alias ll="ls -alh"

export TERM=xterm-256color
if [ -z $TMUX ]; then
  tmux -u -2 attach-session -t raven
fi

export WORKON_HOME=~/.virtualenvs
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -x /usr/bin/dircolors ]; then
    if [ -f ~/.dotfiles/DIR_COLORS.xterm ]; then
        eval `dircolors -b ~/.dotfiles/DIR_COLORS.xterm`
    fi
fi

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

if [ -f private/.zshrc ]; then
    . private/.zshrc
fi
