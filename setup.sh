git clone git@github.com:eugeniy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
ln -s .dotfiles/vim ../.vim
ln -s .dotfiles/vimrc ../.vimrc
ln -s .dotfiles/gitconfig ../.gitconfig
ln -s .dotfiles/tmux.conf ../.tmux.conf
ln -s .dotfiles/zshrc ../.zshrc
git submodule init
git submodule update
cd ~/.dotfiles/vim/bundle/pyflakes-vim
git submodule init
git submodule update
cd ~
