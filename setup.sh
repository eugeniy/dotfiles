#git clone git@github.com:eugeniy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
ln -s .dotfiles/vim ../.vim
ln -s .dotfiles/vimrc ../.vimrc
ln -s .dotfiles/gitconfig ../.gitconfig
ln -s .dotfiles/tmux.conf ../.tmux.conf
ln -s .dotfiles/zshrc ../.zshrc
ln -s .dotfiles/ackrc ../.ackrc
ln -s .dotfiles/gemrc ../.gemrc
ln -s .dotfiles/jshintrc ../.jshintrc
git submodule init
git submodule update
#cd ~/.dotfiles/vim/bundle/pyflakes-vim
#git submodule init
#git submodule update
cd ~
#git clone git@github.com:eugeniy/oh-my-zsh.git ~/.oh-my-zsh
#echo 'Set zsh as your default shell: chsh -s /bin/zsh'
