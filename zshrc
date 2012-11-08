ZSH=$HOME/.oh-my-zsh
ZSH_THEME="koto"

# CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# COMPLETION_WAITING_DOTS="true"

plugins=(git pip rails3 python fabric history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

alias gs="gst -sb"
alias ll="ls -alh"
alias lh='ls --hide="*.pyc"'

# disable autocorrect for fabric...
alias fab='nocorrect fab'

# Disable Ctrl+S
stty stop undef

export TERM=xterm-256color
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    if [ -z $TMUX ]; then
      tmux -u -2 attach-session -t ''
    fi
fi

export WORKON_HOME=~/.virtualenvs
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -x /usr/bin/dircolors ]; then
    if [ -f ~/.dotfiles/dircolors.ansi-dark ]; then
        eval `dircolors -b ~/.dotfiles/dircolors.ansi-dark`
    fi
fi

# postgres.app
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

if [ -f ~/.dotfiles/private/zshrc ]; then
    . ~/.dotfiles/private/zshrc
fi
